import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/utils.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/helpers.dart';
import 'package:stomata_app/features/investment/widget/confirmation_transaction.dart';

class InvestmentController extends GetxController {
  TextEditingController textEditingController = TextEditingController();

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
        child: ConfirmationTransaction(),
      ),
    );
  }
}
