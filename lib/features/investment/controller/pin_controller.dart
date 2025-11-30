import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stomata_app/features/main/main_screen.dart';

class PinController extends GetxController {
  RxBool isLoading = false.obs;
  final TextEditingController textController = TextEditingController();

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

    final snackbar = SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Success',
        message: 'Your Transaction has been procesing, please wait a second',
        contentType: ContentType.success,
        inMaterialBanner: false,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);

    Get.offAll(() => MainScreen());
  }
}
