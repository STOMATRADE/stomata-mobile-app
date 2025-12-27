import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/global_widget/company_logo/company_logo.dart';
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
    controller = Get.put(PortofolioController());

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
                          color: ColorUtils.secondaryGreenColors.withValues(
                            alpha: 0.3,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(
                              () => TotalAssetWidget(
                                totalAmount: controller.totalAsset.value,
                                totalReturn: controller.totalReturn.value,
                                percentageReturn: controller.percentage.value,
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
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    children: [
                      PortofolioItem(
                        onTap: controller.goToDetail,
                        imageUrl:
                            'https://www.sadakoffie.com/wp-content/uploads/2018/05/Carrboro-Coffee-Roasters.jpg',
                        projectName: "Pengiriman Kopi Lampung",
                        releaserName: "PT. Makmur Sejahtera",
                      ),
                      PortofolioItem(
                        onTap: controller.goToDetail,
                        imageUrl:
                            'https://www.sadakoffie.com/wp-content/uploads/2018/05/Carrboro-Coffee-Roasters.jpg',
                        projectName: "Pengiriman Kopi Lampung",
                        releaserName: "PT. Makmur Sejahtera",
                      ),
                      PortofolioItem(
                        onTap: controller.goToDetail,
                        imageUrl:
                            'https://www.sadakoffie.com/wp-content/uploads/2018/05/Carrboro-Coffee-Roasters.jpg',
                        projectName: "Pengiriman Kopi Lampung",
                        releaserName: "PT. Makmur Sejahtera",
                      ),
                      PortofolioItem(
                        onTap: controller.goToDetail,
                        imageUrl:
                            'https://www.sadakoffie.com/wp-content/uploads/2018/05/Carrboro-Coffee-Roasters.jpg',
                        projectName: "Pengiriman Kopi Lampung",
                        releaserName: "PT. Makmur Sejahtera",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
