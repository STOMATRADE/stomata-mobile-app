import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/config/blockchain/model/auth_privy_model.dart';
import 'package:stomata_app/core/config/blockchain/privy_config.dart';
import 'package:stomata_app/features/main/main_screen.dart';

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

  void loginPrivyEmail() async {
    isLoading.value = true;
    PrivyConfigUtils privyConfigUtils = PrivyConfigUtils();

    try {
      isLoading.value = false;
      AuthPrivyModel data = await privyConfigUtils.loginWithEmail(
        textController.text,
      );

      if (data.success == true) {}
    } catch (e) {
      isLoading.value = false;
    }
  }

  void gotoHome() async {
    // Implement navigation to home screen
    await Future.delayed(const Duration(seconds: 1));
    isLoading = false.obs;
    Get.offAll(() => const MainScreen());
  }
}
