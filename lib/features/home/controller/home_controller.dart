import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';
import 'package:stomata_app/core/global_widget/snackbar.dart';
import 'package:stomata_app/features/project/project_detail_screen.dart';
import 'package:stomata_app/repository/auth/view/user_view_model.dart';
import 'package:stomata_app/repository/portofolio/portofolio_repository.dart';
import 'package:stomata_app/repository/portofolio/view/portofolio_amount_view_model.dart';

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
      SnackbarComponent.showErrorSnackbar(context: context, message: e);
    }
  }

  void goToDetail() {
    Get.to(() => ProjectDetailScreen());
  }
}
