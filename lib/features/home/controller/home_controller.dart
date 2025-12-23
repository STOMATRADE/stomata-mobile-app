import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';
import 'package:stomata_app/core/global_widget/snackbar.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/features/project/project_detail_screen.dart';
import 'package:stomata_app/repository/auth/view/user_view_model.dart';
import 'package:stomata_app/repository/portofolio/portofolio_repository.dart';
import 'package:stomata_app/repository/portofolio/view/portofolio_amount_view_model.dart';
import 'package:stomata_app/repository/source_of_fund/source_of_fund_repository.dart';
import 'package:stomata_app/repository/source_of_fund/view/sof_view_model.dart';

class HomeController extends GetxController with CacheManager {
  BuildContext? context;

  RxInt totalAsset = 0.obs;
  RxInt totalCash = 0.obs;
  RxInt totalReturn = 0.obs;
  RxString percentage = "0".obs;

  RxBool loadingAsset = false.obs;
  RxBool loadingCash = false.obs;
  RxBool loadingProject = false.obs;

  ScrollController scrollController = ScrollController();

  HomeController({required this.context});

  @override
  void onInit() {
    getAsset(context);
    getSofData(context);
    getAllProject(context);
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

  void getAllProject(context) async {
    try {
      loadingProject.value = true;

      await Future.delayed(const Duration(seconds: 2));

      loadingProject.value = false;
    } catch (e) {
      loadingProject.value = false;
      printLog("error : ${e.toString()}");
      SnackbarComponent.showErrorSnackbar(
        context: context,
        message: e.toString(),
      );
    }
  }

  void goToDetail() {
    Get.to(() => ProjectDetailScreen());
  }
}
