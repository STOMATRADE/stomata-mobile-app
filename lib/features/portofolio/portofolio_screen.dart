import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/global_widget/company_logo/company_logo.dart';
import 'package:stomata_app/core/global_widget/loading/circle_loading.dart';
import 'package:stomata_app/core/global_widget/loading/skeleton_loading.dart';
import 'package:stomata_app/core/global_widget/total_asset_widget.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/features/portofolio/controller/portofolio_controller.dart';
import 'package:stomata_app/features/portofolio/widget/portofolio_item.dart';

class PortofolioScreen extends StatefulWidget {
  const PortofolioScreen({super.key});

  @override
  State<PortofolioScreen> createState() => _PortofolioScreenState();
}

class _PortofolioScreenState extends State<PortofolioScreen> {
  late final PortofolioController controller;

  @override
  void initState() {
    controller = Get.put(PortofolioController(context: context));

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
              pinned: false,
              floating: false,
              expandedHeight: 170,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CompanyLogo(),
                        const SizedBox(height: 30),
                        Card(
                          color: ColorUtils.fourGreenColors.withValues(
                            alpha: 0.3,
                          ),
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 24, right: 24),
            decoration: const BoxDecoration(color: ColorUtils.bgColors),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CText(
                  text: "Your Portofolio",
                  fontSize: 20,
                  textColor: ColorUtils.white,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 12),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: ColorUtils.thirdBgColors,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.white),
                        const SizedBox(width: 5),
                        CText(
                          text: "Search Portofolio...",
                          fontWeight: FontWeight.bold,
                          textColor: ColorUtils.white,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Obx(
                    () => controller.loadingPortofolio.value
                        ? Center(child: CircleLoading())
                        : loadDataWidget(controller),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loadDataWidget(PortofolioController controller) {
    if (controller.listPortofolio.isNotEmpty) {
      return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: controller.listPortofolio.length,
        itemBuilder: (context, index) {
          var data = controller.listPortofolio[index];

          return PortofolioItem(
            onTap: () {
              controller.goToDetail(data);
            },
            projectId: data.projectId ?? "",
            imageUrl: data.image ?? "-",
            projectName: data.projectName ?? "-",
            releaserName: data.collectorName ?? "-",
            totalFunding: data.totalFunding ?? "0",
            fundingGoal: data.fundingPrice ?? "0",
            totalAsset: data.amount ?? "0",
            margin: data.margin.toString(),
            returnAsset: data.returnAsset ?? "0",
            cumulativeAssetValue: data.cumulativeAsset ?? "0",
          );
        },
      );
    } else {
      return Center(child: Text("data is empty"));
    }
  }
}
