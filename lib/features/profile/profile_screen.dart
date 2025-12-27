import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/global_widget/company_logo/company_logo.dart';
import 'package:stomata_app/core/global_widget/loading/loading_screen.dart';
import 'package:stomata_app/core/global_widget/loading/skeleton_loading.dart';
import 'package:stomata_app/core/global_widget/total_asset_widget.dart';
import 'package:stomata_app/core/global_widget/total_cash_widget.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/image_utils.dart';
import 'package:stomata_app/features/profile/controller/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileController controller;

  @override
  void initState() {
    controller = Get.put(ProfileController(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CompanyLogo(),
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => SkeletonLoading(
                        loading: controller.loadingAcc.value,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(ImageUtils.profile, scale: 60),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => SkeletonLoading(
                              loading: controller.loadingAcc.value,
                              child: Text(
                                controller.userEmail.value,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Obx(
                            () => SkeletonLoading(
                              loading: controller.loadingAcc.value,
                              child: Text(
                                controller.contractAddress.value,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: ColorUtils.primaryColors,
                                ),
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
                      () => SkeletonLoading(
                        loading: controller.loadingCash.value,
                        child: TotalCashWidget(
                          amount: controller.totalCash.value,
                        ),
                      ),
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
                      () => SkeletonLoading(
                        loading: controller.loadingAsset.value,
                        child: TotalAssetWidget(
                          totalAmount: controller.totalAsset.value,
                          totalReturn: controller.totalReturn.value,
                          percentageReturn: controller.percentage.value,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    controller.confirmLogout(context);
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
            () => controller.loadingLogout.value
                ? const LoadingScreen()
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
