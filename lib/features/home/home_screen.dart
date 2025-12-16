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
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(ImageUtils.brandLogo, scale: 20),
                Text(
                  "Stomatrade",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Card(
              color: ColorUtils.secondaryGreenColors.withValues(alpha: 0.3),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TotalAssetWidget(
                      totalAmount: controller.totalAsset.value,
                      totalReturn: controller.totalReturn.value,
                      percentageReturn: controller.percentage.value,
                    ),
                    const SizedBox(height: 8),
                    Divider(),
                    const SizedBox(height: 8),
                    TotalCashWidget(amount: controller.totalCash.value),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            CText(
              text: "Ongoing Project",
              fontSize: 20,
              textColor: ColorUtils.white,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
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
          ],
        ),
      ),
    );
  }
}
