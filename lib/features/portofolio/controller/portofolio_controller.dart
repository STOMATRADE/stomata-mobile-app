import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';
import 'package:stomata_app/core/global_widget/snackbar.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/features/portofolio/portofolio_detail_screen.dart';
import 'package:stomata_app/repository/auth/view/user_view_model.dart';
import 'package:stomata_app/repository/portofolio/portofolio_repository.dart';
import 'package:stomata_app/repository/portofolio/view/amount/portofolio_amount_view_model.dart';
import 'package:stomata_app/repository/portofolio/view/summary/portofolio_item_view_model.dart';
import 'package:stomata_app/repository/portofolio/view/summary/portofolio_summary_view_model.dart';

class PortofolioController extends GetxController with CacheManager {
  BuildContext? context;

  RxInt totalAsset = 1000000.obs;
  RxInt totalReturn = 1200000.obs;
  RxString percentage = "0".obs;

  RxBool loadingAsset = false.obs;
  RxBool loadingPortofolio = false.obs;

  RxList<PortofolioItemViewModel> listPortofolio =
      <PortofolioItemViewModel>[].obs;

  PortofolioController({required this.context});

  @override
  void onInit() {
    getAsset(context);
    getPortofolio(context);
    super.onInit();
  }

  void getAsset(context) async {
    try {
      loadingAsset.value = true;
      UserViewModel userData = await getLoginData();

      var response = await PortofolioRepository().getTotalAsset(
        userData.id ?? "",
      );

      if (response.header.statusCode == 200) {
        loadingAsset.value = false;
        PortofolioAmountViewModel assetData = response.data;
        totalAsset.value = int.parse(assetData.amount ?? "0");
        totalReturn.value = int.parse(assetData.returnAmount ?? "0");
        percentage.value = assetData.percentage.toString();
      } else {
        loadingAsset.value = false;
        SnackbarComponent.showErrorSnackbar(
          context: context,
          message: response.header.message,
        );
      }
    } catch (e) {
      loadingAsset.value = false;
      printLog("error : ${e.toString()}");
      SnackbarComponent.showErrorSnackbar(
        context: context,
        message: e.toString(),
      );
    }
  }

  void getPortofolio(context) async {
    try {
      loadingPortofolio.value = true;
      UserViewModel userData = await getLoginData();

      var response = await PortofolioRepository().getPortofolioSummary(
        userData.id ?? "",
      );

      loadingPortofolio.value = false;
      if (response.header.statusCode == 200) {
        PortofolioSummaryViewModel portofolioSummary = response.data;

        printLog("data porto: ${jsonEncode(portofolioSummary.investments)}");

        listPortofolio.addAll(portofolioSummary.investments ?? []);
      } else {
        SnackbarComponent.showErrorSnackbar(
          context: context,
          message: response.header.message,
        );
      }
    } catch (e) {
      loadingPortofolio.value = false;
      printLog("error : ${e.toString()}");
      SnackbarComponent.showErrorSnackbar(
        context: context,
        message: e.toString(),
      );
    }
  }

  void goToDetail() {
    Get.to(() => PortofolioDetailScreen());
  }
}
