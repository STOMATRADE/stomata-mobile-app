import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';
import 'package:stomata_app/core/global_widget/snackbar.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/helpers.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/features/investment/model/investment_model.dart';
import 'package:stomata_app/features/investment/pin_screen.dart';
import 'package:stomata_app/features/investment/widget/confirmation_transaction.dart';
import 'package:stomata_app/repository/auth/view/user_view_model.dart';
import 'package:stomata_app/repository/source_of_fund/source_of_fund_repository.dart';
import 'package:stomata_app/repository/source_of_fund/view/sof_view_model.dart';

class InvestmentController extends GetxController with CacheManager {
  BuildContext? context;

  RxBool enableButton = false.obs;
  RxInt totalCash = 0.obs;
  RxBool loadingCash = false.obs;

  TextEditingController textEditingController = TextEditingController();
  InvestmentController({required this.context});

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
    getSofData(context);
    super.onInit();
  }

  void getSofData(context) async {
    try {
      loadingCash.value = true;
      UserViewModel userData = await getLoginData();

      var response = await SourceOfFundRepository().getSourceOfFund(
        userData.id ?? "",
      );

      if (response.header.statusCode == 200) {
        loadingCash.value = false;
        SofViewModel sofData = response.data;
        totalCash.value = int.parse(sofData.amount ?? "0");
      } else {
        loadingCash.value = false;
        SnackbarComponent.showErrorSnackbar(
          context: context,
          message: response.header.message,
        );
      }
    } catch (e) {
      loadingCash.value = false;
      printLog("error : ${e.toString()}");
      SnackbarComponent.showErrorSnackbar(
        context: context,
        message: e.toString(),
      );
    }
  }

  void confirmTransaction(context, InvestmentModel data) {
    data.nominalAmount = textEditingController.text;

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
          investmentData: data,
          onConfirm: () {
            gotoPin(data);
          },
        ),
      ),
    );
  }

  void gotoPin(InvestmentModel data) {
    Get.to(() => PinScreen(investmentData: data));
  }
}
