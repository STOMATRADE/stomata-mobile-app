import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/global_widget/card_item.dart';
import 'package:stomata_app/core/global_widget/total_asset_widget.dart';
import 'package:stomata_app/core/global_widget/total_cash_widget.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/image_utils.dart';
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
    controller = Get.put(HomeController());
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
                      Row(
                        children: [
                          Image.asset(ImageUtils.brandLogo, scale: 20),
                          const Text(
                            "Stomatrade",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Card(
                        color: ColorUtils.secondaryGreenColors.withValues(
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
                              TotalAssetWidget(
                                totalAmount: controller.totalAsset.value,
                                totalReturn: controller.totalReturn.value,
                                percentageReturn: controller.percentage.value,
                              ),
                              const SizedBox(height: 8),
                              const Divider(),
                              const SizedBox(height: 8),
                              TotalCashWidget(
                                amount: controller.totalCash.value,
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
          child: ListView(
            padding: const EdgeInsets.only(top: 20),
            children: [
              CardItem(
                onTap: controller.goToDetail,
                imageUrl:
                    'https://www.sadakoffie.com/wp-content/uploads/2018/05/Carrboro-Coffee-Roasters.jpg',
                projectName: "Pengiriman Kopi Lampung",
                releaserName: "PT. Makmur Sejahtera",
              ),
              CardItem(
                onTap: controller.goToDetail,
                imageUrl:
                    'https://www.sadakoffie.com/wp-content/uploads/2018/05/Carrboro-Coffee-Roasters.jpg',
                projectName: "Pengiriman Kopi Lampung",
                releaserName: "PT. Makmur Sejahtera",
              ),
              CardItem(
                onTap: controller.goToDetail,
                imageUrl:
                    'https://www.sadakoffie.com/wp-content/uploads/2018/05/Carrboro-Coffee-Roasters.jpg',
                projectName: "Pengiriman Kopi Lampung",
                releaserName: "PT. Makmur Sejahtera",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
