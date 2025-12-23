import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/config/blockchain/privy_config.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';
import 'package:stomata_app/core/global_widget/snackbar.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/helpers.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/features/auth/login_screen.dart';
import 'package:stomata_app/features/profile/widget/confirm_logout.dart';
import 'package:stomata_app/repository/auth/view/user_view_model.dart';
import 'package:stomata_app/repository/portofolio/portofolio_repository.dart';
import 'package:stomata_app/repository/portofolio/view/portofolio_amount_view_model.dart';
import 'package:stomata_app/repository/source_of_fund/source_of_fund_repository.dart';
import 'package:stomata_app/repository/source_of_fund/view/sof_view_model.dart';

class ProfileController extends GetxController with CacheManager {
  BuildContext? context;

  RxBool loadingLogout = false.obs;
  RxBool loadingAsset = false.obs;
  RxBool loadingCash = false.obs;
  RxBool loadingAcc = true.obs;

  RxString userEmail = "".obs;
  RxString contractAddress = "".obs;

  RxInt totalAsset = 1000000.obs;
  RxInt totalCash = 500000.obs;
  RxInt totalReturn = 1200000.obs;
  RxString percentage = "50".obs;

  ProfileController({required this.context});

  @override
  void onInit() {
    loadWalletData();
    getAsset(context);
    getSofData(context);
    super.onInit();
  }

  void loadWalletData() async {
    loadingAcc.value = true;
    userEmail.value = await PrivyConfigUtils().getEmailAcc() ?? "";
    contractAddress.value = await PrivyConfigUtils().getContractAddress() ?? "";

    loadingAcc.value = false;
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

  void confirmLogout(context) {
    Get.bottomSheet(
      Container(
        height: Helpers.getFullHeight(context) * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: ColorUtils.secondaryBgColors,
        ),
        child: ConfirmLogout(
          onCancel: () {
            Get.back();
          },
          onLogout: () {
            logout();
          },
        ),
      ),
    );
  }

  void logout() async {
    try {
      loadingLogout.value = true;

      await PrivyConfigUtils().privyLogout();
      Get.offAll(() => LoginScreen());
      loadingLogout.value = false;
    } catch (e) {
      loadingLogout.value = false;
      printLog("error: $e");
    }
  }
}
