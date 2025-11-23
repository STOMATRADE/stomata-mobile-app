import 'package:get/get.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:stomata_app/core/utils/function/url_launcher.dart';
import 'package:stomata_app/core/utils/onchain_utils/chain.dart';
import 'package:stomata_app/core/utils/onchain_utils/deeplink_app_controller.dart';
import 'package:stomata_app/core/utils/function/logging.dart';

class ThirdAppController {
  static late ReownAppKit appKit;
  static late ReownAppKitModal appKitModal;

  static const projectId = '23c57f4e7337f54599d251aaab7fcd6f';
  static var accountAddress = ''.obs;
  static var accountBalance = ''.obs;
  static var accountChain = ''.obs;
  static var accountNamespace = {}.obs;
  static var isConnected = false.obs;

  static Future<void> init() async {
    appKit = await ReownAppKit.createInstance(
      projectId: projectId,
      metadata: const PairingMetadata(
        name: 'Bandshare',
        description: 'Connect Bandshare Token',
        url: 'https://bandshare.cloud',
        verifyUrl: 'myapp://bandshare.cloud?action=verivy',
        icons: ['https://bandshare.cloud/assets/favicon-c3130c73.png'],
        redirect: Redirect(
          native: 'myapp://',
          universal: 'https://reown.com/myapp',
          linkMode: true | false,
        ),
      ),
    );

    appKitModal = ReownAppKitModal(
      context: Get.context ?? Get.overlayContext!,
      appKit: appKit,
    );

    ReownAppKitModalNetworks.addSupportedNetworks('eip155', [
      ChainNetwork.base,
      ChainNetwork.baseSepolia,
    ]);

    await appKit.init();
    await appKitModal.init();
    DeepLinkHandler.init(appKitModal);

    if (appKitModal.isConnected) {
      await loadAccountData();
    } else {
      isConnected.value = false;
    }
  }

  Future<bool> connectWallet() async {
    try {
      await appKitModal.openModalView();

      if (appKitModal.isConnected) {
        await loadAccountData();
        await switchChain(ChainNetwork.baseSepolia);
        printLog("Wallet connected!");
      } else {
        printLog("Wallet connection failed.");
        await disConnectWallet();
      }

      return isConnected.value;
    } catch (e, trace) {
      printLog(e.toString());
      printLog(trace.toString());
      await disConnectWallet();

      return isConnected.value;
    }
  }

  static Future<void> disConnectWallet() async {
    try {
      await appKitModal.disconnect();
    } catch (e) {
      printLog('error disconnect wallet: $e');
    }

    isConnected.value = false;
    accountAddress.value = '';
    accountBalance.value = '';
    accountChain.value = '';
    accountNamespace.value = {};
  }

  static Future<void> loadAccountData() async {
    if (appKitModal.isConnected) {
      isConnected.value = true;

      await appKitModal.loadAccountData();

      accountChain.value = appKitModal.session?.chainId ?? '';
      accountNamespace.value = appKitModal.session?.namespaces ?? {};

      var nameSpace = accountNamespace.keys.toList();
      var nameSpaceId = nameSpace.first;

      accountAddress.value = appKitModal.session?.getAddress(nameSpaceId) ?? '';
      appKitModal.balanceNotifier.addListener(() {
        accountBalance.value = appKitModal.balanceNotifier.value;
      });

      // final userData = UserDataController();
      // final req = UserUpdateRequest(walletAddress: accountAddress.value);

      // await userData.updateWallet(req: req);
    }
  }

  static Future<String> getAddress() async {
    if (appKitModal.isConnected) {
      await appKitModal.loadAccountData();

      accountChain.value = appKitModal.session?.chainId ?? '';
      accountNamespace.value = appKitModal.session?.namespaces ?? {};

      var nameSpace = accountNamespace.keys.toList();
      var nameSpaceId = nameSpace.first;

      return appKitModal.session?.getAddress(nameSpaceId) ?? '';
    } else {
      return '';
    }
  }

  Future<void> openWallet() async {
    final wallet = appKitModal.session?.peer?.metadata;
    await urlLauncher(wallet?.redirect?.native ?? '');
  }

  Future<void> sendTx({
    required String contractAddress,
    required String dataHex,
    String valueInEther = '0',
  }) async {
    try {
      final address = await getAddress();
      final request = SessionRequestParams(
        method: 'eth_sendTransaction',
        params: [
          {
            "from": address,
            "to": contractAddress,
            "value": valueInEther,
            "data": dataHex,
          },
        ],
      );

      final chainId = ReownAppKitModalNetworks.getCaip2Chain(
        ChainNetwork.baseSepolia.chainId,
      );

      await openWallet();

      final txHash = await appKitModal.request(
        topic: appKitModal.session?.topic ?? '',
        chainId: chainId,
        request: request,
        switchToChainId: chainId,
      );

      printLog('Transaction sent! Hash: $txHash');
    } catch (e) {
      printLog('Error sending transaction: $e');
    }
  }

  Future<void> addChain(ReownAppKitModalNetworkInfo chain) async {
    try {
      await appKitModal.requestAddChain(chain);
      printLog('Chain added successfully');
    } catch (e, trace) {
      printLog('Failed to add chain: $e');
      printLog('Failed to add chain: $trace');
    }
  }

  Future<void> switchChain(ReownAppKitModalNetworkInfo chain) async {
    try {
      await appKitModal.requestSwitchToChain(chain);
      printLog('Chain added successfully');
    } catch (e, trace) {
      printLog('Failed to add chain: $e');
      printLog('Failed to add chain: $trace');
    }
  }
}
