import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/config/blockchain/model/auth_privy_model.dart';
import 'package:stomata_app/core/config/blockchain/privy_config.dart';
import 'package:stomata_app/core/global_widget/snackbar.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/features/auth/otp_auth_screen.dart';
import 'package:stomata_app/features/debug_mode/debug_mode_screen.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool enableButton = false.obs;

  TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    textController.addListener(() {
      if (textController.text.isNotEmpty) {
        enableButton.value = true;
      } else {
        enableButton.value = false;
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  void loginPrivyEmail(context) async {
    isLoading.value = true;
    PrivyConfigUtils privyConfigUtils = PrivyConfigUtils();

    try {
      AuthPrivyModel data = await privyConfigUtils.loginWithEmail(
        textController.text,
      );

      printLog("data: ${data.message}");

      if (data.success == true) {
        isLoading.value = false;
        Get.to(() => OtpAuthScreen(email: textController.text));
      } else {
        isLoading.value = false;
        printLog("is failed: ${data.message}");
        SnackbarComponent.showErrorSnackbar(
          context: context,
          message: data.message,
        );
      }
    } catch (e) {
      isLoading.value = false;
      printLog("error screen: $e");
      SnackbarComponent.showErrorSnackbar(context: context, message: e);
    }
  }

  void loginWithGoogle(context) {
    SnackbarComponent.showWarningSnackbar(
      context: context,
      message: "this features is not available for now",
    );
  }

  void goToDebugMode() {
    // if (kDebugMode) {
    //   Get.to(() => DebugModeScreen());
    // }
    Get.to(() => DebugModeScreen());
  }
}
