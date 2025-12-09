import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/global_widget/card_item.dart';
import 'package:stomata_app/core/global_widget/total_asset_widget.dart';
import 'package:stomata_app/core/global_widget/total_cash_widget.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/helpers.dart';
import 'package:stomata_app/core/utils/image_utils.dart';
import 'package:stomata_app/features/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(HomeController());
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
                      totalAmount: _controller.totalAsset.value,
                      totalReturn: _controller.totalReturn.value,
                      percentageReturn: _controller.percentage.value,
                    ),
                    const SizedBox(height: 8),
                    Divider(),
                    const SizedBox(height: 8),
                    TotalCashWidget(amount: _controller.totalCash.value),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           CText(
                    //             text: "Total Cash",
                    //             fontSize: 12,
                    //             textColor: ColorUtils.white,
                    //           ),
                    //           const SizedBox(height: 8),
                    //           CText(
                    //             text: Helpers.formatRupiah(
                    //               _controller.totalCash.value,
                    //             ),
                    //             fontSize: 20,
                    //             textColor: ColorUtils.white,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     // Padding(
                    //     //   padding: const EdgeInsets.only(right: 10),
                    //     //   child: ElevatedButton(
                    //     //     onPressed: () {},
                    //     //     style: ButtonStyle(
                    //     //       backgroundColor: WidgetStateProperty.all<Color>(
                    //     //         ColorUtils.primaryColors,
                    //     //       ),
                    //     //     ),
                    //     //     child: Row(
                    //     //       children: [
                    //     //         Icon(
                    //     //           Icons.add_circle_rounded,
                    //     //           color: Colors.black,
                    //     //         ),
                    //     //         const SizedBox(width: 5),
                    //     //         CText(
                    //     //           text: "Deposit",
                    //     //           fontWeight: FontWeight.bold,
                    //     //         ),
                    //     //       ],
                    //     //     ),
                    //     //   ),
                    //     // ),
                    //   ],
                    // ),
                    // const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            CText(
              text: "Ongoing Project",
              fontSize: 24,
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
                    onTap: _controller.goToDetail,
                    imageUrl:
                        'https://www.sadakoffie.com/wp-content/uploads/2018/05/Carrboro-Coffee-Roasters.jpg',
                    projectName: "Pengiriman Kopi Lampung",
                    releaserName: "PT. Makmur Sejahtera",
                  ),
                  CardItem(
                    onTap: _controller.goToDetail,
                    imageUrl:
                        'https://www.sadakoffie.com/wp-content/uploads/2018/05/Carrboro-Coffee-Roasters.jpg',
                    projectName: "Pengiriman Kopi Lampung",
                    releaserName: "PT. Makmur Sejahtera",
                  ),
                  CardItem(
                    onTap: _controller.goToDetail,
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
