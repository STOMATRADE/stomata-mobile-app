import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';
import 'package:stomata_app/core/global_widget/snackbar.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/features/investment/model/investment_model.dart';
import 'package:stomata_app/features/main/main_screen.dart';
import 'package:stomata_app/repository/auth/view/user_view_model.dart';
import 'package:stomata_app/repository/investment/investment_repository.dart';
import 'package:stomata_app/repository/investment/request/create_investment_request.dart';
import 'package:stomata_app/repository/investment/view/create_investment_view_model.dart';

class PinController extends GetxController with CacheManager {
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

  void confirmPin({
    required String value,
    context,
    required InvestmentModel investmentData,
  }) async {
    createInvestment(investmentData: investmentData, context: context);
  }

  void createInvestment({
    context,
    required InvestmentModel investmentData,
  }) async {
    try {
      isLoading.value = true;

      UserViewModel userData = await getLoginData();
      CreateInvestmentRequest param = CreateInvestmentRequest()
        ..amount = investmentData.nominalAmount
        ..projectId = investmentData.projectId
        ..userId = userData.id;

      var response = await InvestmentRepository().createInvestment(param);

      isLoading.value = false;
      if (response.header.statusCode == 200) {
        CreateInvestmentViewModel createInvestmentViewModel = response.data;

        SnackbarComponent.showSuccesSnackbar(
          context: context,
          message: createInvestmentViewModel.message,
        );

        Get.offAll(() => MainScreen());
      } else {
        SnackbarComponent.showErrorSnackbar(
          context: context,
          message: response.header.message,
        );
      }
    } catch (e) {
      isLoading.value = false;
      printLog("error : ${e.toString()}");
      SnackbarComponent.showErrorSnackbar(
        context: context,
        message: e.toString(),
      );
    }
  }
}
