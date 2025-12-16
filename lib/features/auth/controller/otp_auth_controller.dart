import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/config/blockchain/model/verify_privy_model.dart';
import 'package:stomata_app/core/config/blockchain/model/wallet_privy_model.dart';
import 'package:stomata_app/core/config/blockchain/privy_config.dart';
import 'package:stomata_app/core/utils/cache_manager.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/features/main/main_screen.dart';
import 'package:stomata_app/repository/auth/auth_repository.dart';
import 'package:stomata_app/repository/auth/request/login_request.dart';

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
        showError(context: context, message: data.message);
        printLog("is failed");
      }
    } catch (e) {
      setLoginStatus(false);
      printLog("error screen: $e");

      isLoading.value = false;
      showError(context: context, message: e);
    }
  }

  void createWalletAcc(context) async {
    try {
      var address = await PrivyConfigUtils().getContractAddress();

      if ((address ?? "").isNotEmpty) {
        verifyAuth(
          context,
          walletAddress: address ?? "",
          signature: await PrivyConfigUtils().getSignature(
            walletAddress: address ?? "",
          ),
          message:
              "Login Stomatrade: ${DateTime.now().toUtc().toIso8601String()}",
        );
      } else {
        WalletPrivyModel data = await PrivyConfigUtils().createWallet();

        if (data.success ?? false) {
          verifyAuth(
            context,
            walletAddress: data.walletAddress ?? "",
            signature: await PrivyConfigUtils().getSignature(
              walletAddress: data.walletAddress ?? "",
            ),
            message:
                "Login Stomatrade: ${DateTime.now().toUtc().toIso8601String()}",
          );
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

      if (response.header.statusCode == 200) {
        isLoading.value = false;
        // LoginViewModel loginViewModel = response.data;

        setLoginStatus(true);
        isLoading.value = false;
        Get.offAll(() => const MainScreen());
      } else {
        isLoading.value = false;
        showError(context: context, message: response.header.message);
      }
    } catch (e) {
      isLoading.value = false;
      showError(context: context, message: e);
    }
  }

  showError({required BuildContext context, required message}) {
    final snackbar = SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Failed',
        message: message,
        contentType: ContentType.failure,
        inMaterialBanner: false,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}
