import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/config/blockchain/privy_config.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/helpers.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/features/auth/login_screen.dart';
import 'package:stomata_app/features/profile/widget/confirm_logout.dart';

class ProfileController extends GetxController {
  RxBool loadingLogout = false.obs;
  RxBool loadingData = false.obs;
  RxString userEmail = "".obs;
  RxString contractAddress = "".obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    userEmail.value = await PrivyConfigUtils().getEmailAcc() ?? "";
    contractAddress.value = await PrivyConfigUtils().getContractAddress() ?? "";
    super.onInit();
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
