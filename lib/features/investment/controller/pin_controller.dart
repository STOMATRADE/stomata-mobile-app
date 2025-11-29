import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PinController extends GetxController {
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
    textController.clear(); // langsung kosong
  }
}
