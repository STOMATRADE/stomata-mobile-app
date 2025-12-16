import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:privy_flutter/privy_flutter.dart';
import 'package:stomata_app/core/config/blockchain/model/auth_privy_model.dart';
import 'package:stomata_app/core/config/blockchain/model/verify_privy_model.dart';
import 'package:stomata_app/core/config/blockchain/model/wallet_privy_model.dart';
import 'package:stomata_app/core/config/firebase/firebase_remote_config_utils.dart';
import 'package:stomata_app/core/utils/logging.dart';

class PrivyConfigUtils {
  Future<PrivyConfig> _setupPrivyConfig() async {
    FirebaseRemoteConfig remoteConfigUtils = await FirebaseRemoteConfigUtils()
        .getRemoteConfig();

    var privyConfig = PrivyConfig(
      appClientId: remoteConfigUtils.getString("privyAppClientId"),
      appId: remoteConfigUtils.getString("privyAppId"),
      logLevel: PrivyLogLevel.verbose,
    );

    printLog("privyAppId: ${privyConfig.appId}");
    printLog("appClientId: ${privyConfig.appClientId}");

    return privyConfig;
  }

  Future<Privy> _getPrivyConfig() async {
    var config = await _setupPrivyConfig();

    final privy = Privy.init(config: config);
    return privy;
  }

  Future<AuthPrivyModel> loginWithEmail(String email) async {
    AuthPrivyModel data = AuthPrivyModel();

    try {
      var privy = await _getPrivyConfig();
      final sendResult = await privy.email.sendCode(email);
      sendResult.fold(
        onSuccess: (ok) {
          printLog("Code sent to $email");
          data.message = "Success";
          data.success = true;
        },
        onFailure: (err) {
          printLog("Failed to send code: ${err.message}");

          data.message = err.message;
          data.success = false;
        },
      );

      return data;
    } catch (e) {
      printLog("privy Error: $e");
      data.message = e.toString();
      data.success = false;

      return data;
    }
  }

  Future<VerifyPrivyModel> verifyCode(String email, String code) async {
    printLog("email: $email");
    printLog("code: $code");

    VerifyPrivyModel data = VerifyPrivyModel();

    try {
      var privy = await _getPrivyConfig();
      final loginResult = await privy.email.loginWithCode(
        email: email,
        code: code,
      );
      loginResult.fold(
        onSuccess: (privyUser) {
          printLog("Login succeeded, user id: ${privyUser.id}");

          data.message = "success";
          data.privyUser = privyUser;
          data.success = true;
        },
        onFailure: (err) {
          printLog("Login failed: ${err.message}");

          data.message = err.message;
          data.success = false;
        },
      );
    } catch (e) {
      printLog("privy Error: $e");
      data.message = e.toString();
      data.success = false;
    }

    return data;
  }

  Future<AuthPrivyModel> privyLogout() async {
    AuthPrivyModel data = AuthPrivyModel();

    try {
      var privy = await _getPrivyConfig();
      await privy.logout();

      data.message = "Logout Success";
      data.success = true;
    } catch (e) {
      printLog("error: $e");
      data.message = e.toString();
      data.success = false;

      rethrow;
    }

    return data;
  }

  Future<WalletPrivyModel> createWallet() async {
    final user = await _getCurrentUser();

    WalletPrivyModel data = WalletPrivyModel();

    if (user == null) {
      data.message = "Can't get Account";
      data.success = false;
      return data;
    }

    try {
      final walletResult = await user.createEthereumWallet();

      walletResult.fold(
        onSuccess: (wallet) {
          final address = wallet.address;
          data.message = "Success Create Wallet";
          data.success = true;
          data.walletAddress = wallet.address;

          printLog("Wallet created — address: $address");
        },
        onFailure: (error) {
          data.message = error.toString();
          data.success = false;
          printLog("Gagal buat wallet: $error");
        },
      );
    } catch (error) {
      printLog("function error: $error");
      data.message = error.toString();
      data.success = false;
    }

    return data;
  }

  Future<PrivyUser?> _getCurrentUser() async {
    try {
      final privy = await _getPrivyConfig();
      final user = await privy.getUser();

      return user;
    } catch (e) {
      printLog("Error getUser: $e");
      rethrow;
    }
  }

  Future<String?> getEmailAcc() async {
    final user = await _getCurrentUser();
    if (user == null) {
      printLog("User not authenticated");
      return null;
    }

    try {
      String? email;
      for (final acc in user.linkedAccounts) {
        if (acc is EmailAccount) {
          email = acc.emailAddress;
        }
      }

      printLog("Privy Email: $email");
      return email;
    } catch (e) {
      printLog("Cannot get email: $e");
      rethrow;
    }
  }

  Future<String?> getContractAddress() async {
    final user = await _getCurrentUser();
    var address = "";

    if (user == null) {
      printLog("User not authenticated");
      return null;
    }

    try {
      for (final acc in user.linkedAccounts) {
        if (acc is EmbeddedEthereumWalletAccount) {
          address = acc.address;
        }

        if (acc is EmbeddedSolanaWalletAccount) {
          address = acc.address;
        }

        if (acc is ExternalWalletAccount) {
          address = acc.address;
        }
      }

      printLog("address: $address");

      return address;
    } catch (e) {
      printLog("error get contract address: $e");
      rethrow;
    }
  }

  Future<String> getSignature({required String walletAddress}) async {
    String signatureData = "";
    try {
      final user = await _getCurrentUser();

      final wallets = user?.embeddedEthereumWallets.first;

      final rpcRequest = EthereumRpcRequest(
        method: "personal_sign",
        params: ["Hello Privy!", walletAddress],
      );

      final result = await wallets?.provider.request(rpcRequest);

      result?.fold(
        onSuccess: (resp) {
          signatureData = resp.data;
        },
        onFailure: (error) {
          signatureData = "";
        },
      );

      return signatureData;
    } catch (e) {
      rethrow;
    }
  }
}
