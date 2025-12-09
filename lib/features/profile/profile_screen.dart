import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:stomata_app/core/global_widget/loading_screen.dart';
import 'package:stomata_app/core/global_widget/total_asset_widget.dart';
import 'package:stomata_app/core/global_widget/total_cash_widget.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/helpers.dart';
import 'package:stomata_app/core/utils/image_utils.dart';
import 'package:stomata_app/features/profile/controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(ProfileController());
    return BaseWidgetContainer(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(ImageUtils.brandLogo, scale: 20),
                    Text(
                      "Stomatrade",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(ImageUtils.profile, scale: 60),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Text(
                              _controller.userEmail.value,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Obx(
                            () => _controller.contractAddress.value.isNotEmpty
                                ? Text(
                                    _controller.contractAddress.value,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: ColorUtils.primaryColors,
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: CustomButton(
                                      onPressed: () {},
                                      titleButton: "Connect Wallet",
                                      borderRadius: 30,
                                      buttonHeight: 25,
                                      fontSize: 12,
                                      buttonWidth:
                                          Helpers.getFullWidth(context) * 0.5,
                                      backgroundColors:
                                          ColorUtils.primaryColors,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                const SizedBox(height: 40),
                CText(
                  text: "Your Cash",
                  fontSize: 15,
                  textColor: ColorUtils.white,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 8),
                Card(
                  margin: const EdgeInsets.all(0),
                  color: ColorUtils.secondaryGreenColors.withValues(alpha: 0.3),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () =>
                          TotalCashWidget(amount: _controller.totalCash.value),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                CText(
                  text: "Your Portofolio",
                  fontSize: 15,
                  textColor: ColorUtils.white,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 8),
                Card(
                  margin: const EdgeInsets.all(0),
                  color: ColorUtils.secondaryGreenColors.withValues(alpha: 0.3),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => TotalAssetWidget(
                        totalAmount: _controller.totalAsset.value,
                        totalReturn: _controller.totalReturn.value,
                        percentageReturn: _controller.percentage.value,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    _controller.confirmLogout(context);
                  },
                  child: Card(
                    margin: const EdgeInsets.all(0),
                    color: ColorUtils.secondaryBgColors,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.logout, color: ColorUtils.white),
                                const SizedBox(width: 8),
                                Text(
                                  "Logout",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: ColorUtils.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => _controller.loadingLogout.value
                ? const LoadingScreen()
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
