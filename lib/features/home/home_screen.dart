import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:flutter_package/source/custom_button.dart';
import 'package:get/get.dart';
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
            SizedBox(height: 12),
            Card(
              color: ColorUtils.thirdBgColors,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CText(
                      text: "Total Aset",
                      fontSize: 15,
                      textColor: ColorUtils.white,
                    ),
                    SizedBox(height: 8),
                    CText(
                      text: Helpers.formatRupiah(_controller.totalAsset.value),
                      fontSize: 24,
                      textColor: ColorUtils.white,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CText(
                          text: "Return",
                          fontSize: 12,
                          textColor: ColorUtils.white,
                        ),
                        SizedBox(width: 5),
                        CText(
                          text:
                              "+${Helpers.formatRupiah(_controller.totalReturn.value)} (+20%)",
                          fontSize: 12,
                          textColor: ColorUtils.primaryColors,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Divider(),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CText(
                                text: "Total Cash",
                                fontSize: 15,
                                textColor: ColorUtils.white,
                              ),
                              SizedBox(height: 8),
                              CText(
                                text: Helpers.formatRupiah(
                                  _controller.totalCash.value,
                                ),
                                fontSize: 24,
                                textColor: ColorUtils.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                ColorUtils.primaryColors,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_circle_rounded,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 5),
                                CText(
                                  text: "Deposit",
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            CText(
              text: "Ongoing Projects",
              fontSize: 24,
              textColor: ColorUtils.white,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                      color: ColorUtils.secondaryBgColors,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              'https://www.sadakoffie.com/wp-content/uploads/2018/05/Carrboro-Coffee-Roasters.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pengiriman Kopi Lampung",
                                  style: TextStyle(fontSize: 24),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "PT. Makmur Sejahtera",
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(height: 10),
                                CustomButton(
                                  onPressed: () {},
                                  titleButton: "See Detail",
                                  backgroundColors: ColorUtils.primaryColors,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                      color: ColorUtils.secondaryBgColors,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              'https://www.sadakoffie.com/wp-content/uploads/2018/05/Carrboro-Coffee-Roasters.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pengiriman Kopi Lampung",
                                  style: TextStyle(fontSize: 24),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "PT. Makmur Sejahtera",
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(height: 10),
                                CustomButton(
                                  onPressed: () {},
                                  titleButton: "See Detail",
                                  backgroundColors: ColorUtils.primaryColors,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                      color: ColorUtils.secondaryBgColors,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              'https://www.sadakoffie.com/wp-content/uploads/2018/05/Carrboro-Coffee-Roasters.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pengiriman Kopi Lampung",
                                  style: TextStyle(fontSize: 24),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "PT. Makmur Sejahtera",
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(height: 10),
                                CustomButton(
                                  onPressed: () {},
                                  titleButton: "See Detail",
                                  backgroundColors: ColorUtils.primaryColors,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
