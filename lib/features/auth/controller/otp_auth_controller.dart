import 'package:get/get.dart';
import 'package:stomata_app/core/config/blockchain/model/verify_privy_model.dart';
import 'package:stomata_app/core/config/blockchain/model/wallet_privy_model.dart';
import 'package:stomata_app/core/config/blockchain/privy_config.dart';
import 'package:stomata_app/core/global_widget/snackbar.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/features/main/main_screen.dart';
import 'package:stomata_app/repository/auth/auth_repository.dart';
import 'package:stomata_app/repository/auth/request/login_request.dart';
import 'package:stomata_app/repository/auth/view/login_view_model.dart';

class OtpAuthController extends GetxController with CacheManager {
  RxBool isLoading = false.obs;

  void otpConfirmation(String email, String otpCode, context) async {
    isLoading.value = true;
    PrivyConfigUtils privyConfigUtils = PrivyConfigUtils();

    try {
      VerifyPrivyModel data = await privyConfigUtils.verifyCode(email, otpCode);

      printLog("data: ${data.message}");

      if (data.success == true) {
        createWalletAcc(context);
      } else {
        isLoading.value = false;

        setLoginStatus(false);
        SnackbarComponent.showErrorSnackbar(
          context: context,
          message: data.message,
        );
        printLog("is failed");
      }
    } catch (e) {
      setLoginStatus(false);
      printLog("error screen: $e");

      isLoading.value = false;
      SnackbarComponent.showErrorSnackbar(context: context, message: e);
    }
  }

  void createWalletAcc(context) async {
    var currentDate = DateTime.now();

    try {
      var address = await PrivyConfigUtils().getContractAddress();

      if ((address ?? "").isNotEmpty) {
        // TO DO: Change to this
        verifyAuth(
          context,
          walletAddress: address ?? "",
          signature: await PrivyConfigUtils().getSignature(
            walletAddress: address ?? "",
          ),
          message: "Login Stomatrade: $currentDate",
        );

        // setLoginStatus(true);
        // isLoading.value = false;
        // Get.offAll(() => const MainScreen());
      } else {
        WalletPrivyModel data = await PrivyConfigUtils().createWallet();

        if (data.success ?? false) {
          // TO DO: Change to this
          verifyAuth(
            context,
            walletAddress: data.walletAddress ?? "",
            signature: await PrivyConfigUtils().getSignature(
              walletAddress: data.walletAddress ?? "",
            ),
            message: "Login Stomatrade: $currentDate",
          );

          // setLoginStatus(true);
          // isLoading.value = false;
          // Get.offAll(() => const MainScreen());
        } else {
          setLoginStatus(false);
          isLoading.value = false;
          printLog("failed: ${data.message}");
        }
      }
    } catch (e) {
      setLoginStatus(false);
      printLog("error screen: $e");
      isLoading.value = false;
    }
  }

  void verifyAuth(
    context, {
    required String walletAddress,
    required String signature,
    required String message,
  }) async {
    try {
      LoginRequest param = LoginRequest(
        walletAddress: walletAddress,
        signature: signature,
        message: message,
      );

      var response = await AuthRepository().login(param: param);

      if (response.header.statusCode == 200 ||
          response.header.statusCode == 201) {
        isLoading.value = false;
        LoginViewModel loginViewModel = response.data;

        setLoginStatus(true);
        setBearerToken(jwt: loginViewModel.accessToken ?? "");
        setLoginData(data: loginViewModel);
        isLoading.value = false;
        Get.offAll(() => const MainScreen());
      } else {
        isLoading.value = false;
        setLoginStatus(false);
        SnackbarComponent.showErrorSnackbar(
          context: context,
          message: response.header.message,
        );
      }
    } catch (e) {
      isLoading.value = false;
      setLoginStatus(false);
      SnackbarComponent.showErrorSnackbar(context: context, message: e);
    }
  }
}
