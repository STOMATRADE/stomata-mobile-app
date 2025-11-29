import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/helpers.dart';
import 'package:stomata_app/features/auth/login_screen.dart';
import 'package:stomata_app/features/profile/widget/confirm_logout.dart';

class ProfileController extends GetxController {
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
            Get.offAll(() => LoginScreen());
          },
        ),
      ),
    );
  }
}
