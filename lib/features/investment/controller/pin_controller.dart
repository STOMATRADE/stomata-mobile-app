import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/global_widget/snackbar.dart';
import 'package:stomata_app/features/main/main_screen.dart';

class PinController extends GetxController {
  RxBool isLoading = false.obs;
  final TextEditingController textController = TextEditingController();

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  void onNumberTap(String value) {
    textController.text += value;
  }

  void onDeleteTap() {
    if (textController.text.isNotEmpty) {
      textController.text = textController.text.substring(
        0,
        textController.text.length - 1,
      );
    }

    textController.selection = TextSelection.fromPosition(
      TextPosition(offset: textController.text.length),
    );
  }

  void onClear() {
    textController.clear();
  }

  void confirmPin(String value, context) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;

    SnackbarComponent.showSuccesSnackbar(
      context: context,
      message: 'Your Transaction has been procesing, please wait a second',
    );

    Get.offAll(() => MainScreen());
  }
}
