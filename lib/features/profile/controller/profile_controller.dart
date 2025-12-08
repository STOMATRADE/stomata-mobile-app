import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/config/blockchain/privy_config.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/helpers.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/features/auth/login_screen.dart';
import 'package:stomata_app/features/profile/widget/confirm_logout.dart';

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;

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
      isLoading.value = true;

      await PrivyConfigUtils().privyLogout();
      Get.offAll(() => LoginScreen());
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      printLog("error: $e");
    }
  }
}
