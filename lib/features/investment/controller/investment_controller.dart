import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/helpers.dart';
import 'package:stomata_app/features/investment/pin_screen.dart';
import 'package:stomata_app/features/investment/widget/confirmation_transaction.dart';

class InvestmentController extends GetxController {
  RxBool enableButton = false.obs;
  TextEditingController textEditingController = TextEditingController();

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    textEditingController.addListener(() {
      if (textEditingController.text.isNotEmpty) {
        enableButton.value = true;
      } else {
        enableButton.value = false;
      }
    });
    super.onInit();
  }

  void confirmTransaction(context) {
    Get.bottomSheet(
      Container(
        height: Helpers.getFullHeight(context) * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: ColorUtils.secondaryBgColors,
        ),
        child: ConfirmationTransaction(
          amount: int.parse(textEditingController.text),
          onConfirm: () {
            gotoPin();
          },
        ),
      ),
    );
  }

  void gotoPin() {
    Get.to(() => PinScreen());
  }
}
