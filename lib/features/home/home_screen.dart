import 'package:easy_load_more/easy_load_more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/global_widget/card_item.dart';
import 'package:stomata_app/core/global_widget/company_logo/company_logo.dart';
import 'package:stomata_app/core/global_widget/loading/circle_loading.dart';
import 'package:stomata_app/core/global_widget/loading/skeleton_loading.dart';
import 'package:stomata_app/core/global_widget/total_asset_widget.dart';
import 'package:stomata_app/core/global_widget/total_cash_widget.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/helpers.dart';
import 'package:stomata_app/features/home/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeController controller;

  @override
  void initState() {
    controller = Get.put(HomeController(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: ColorUtils.bgColors,
              elevation: 0,
              pinned: true,
              floating: false,
              snap: false,
              expandedHeight: 300,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(
                  left: 24,
                  bottom: 16.0,
                  right: 24,
                ),
                title: CText(
                  text: "Ongoing Project",
                  fontSize: 15,
                  textColor: ColorUtils.white,
                  fontWeight: FontWeight.bold,
                ),
                background: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CompanyLogo(),
                      const SizedBox(height: 12),
                      Card(
                        color: ColorUtils.fourGreenColors.withValues(
                          alpha: 0.3,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => SkeletonLoading(
                                  loading: controller.loadingAsset.value,
                                  child: TotalAssetWidget(
                                    totalAmount: controller.totalAsset.value,
                                    totalReturn: controller.totalReturn.value,
                                    percentageReturn:
                                        controller.percentage.value,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Divider(),
                              const SizedBox(height: 8),
                              Obx(
                                () => SkeletonLoading(
                                  loading: controller.loadingCash.value,
                                  child: TotalCashWidget(
                                    amount: controller.totalCash.value,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: const BoxDecoration(color: ColorUtils.bgColors),
          child: EasyLoadMore(
            runOnEmptyResult: false,
            onLoadMore: () async {
              debugPrint("LOAD MORE DIPANGGIL");
              controller.getAllProject(context);
              return true;
            },
            child: Obx(
              () => controller.loadingProject.value
                  ? Center(child: CircleLoading())
                  : ListView.builder(
                      padding: const EdgeInsets.only(top: 0),
                      itemBuilder: (context, index) {
                        var data = controller.listProjects[index];

                        return CardItem(
                          onTap: controller.goToDetail,
                          imageUrl: data.image ?? "",
                          projectName: data.projectName ?? "",
                          releaserName: data.projectCompany ?? "",
                          investor: data.investors ?? 0,
                          fundingGoal: Helpers.formatTokenAmount(
                            amount: BigInt.parse(data.fundingPrice ?? "0"),
                            decimals: Helpers().getDecimals(),
                          ),
                          margin: data.margin,
                          percentageFunded: data.fundingPercentage,
                          totalFunding: Helpers.formatTokenAmount(
                            amount: BigInt.parse(data.totalFunding ?? "0"),
                            decimals: Helpers().getDecimals(),
                          ),
                        );
                      },
                      itemCount: controller.listProjects.length,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
