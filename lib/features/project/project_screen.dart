import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:flutter_package/source/custom_button.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/image_utils.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

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
            SizedBox(height: 30),
            CText(
              text: "Projects List",
              fontSize: 24,
              textColor: ColorUtils.white,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 30),
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
                    SizedBox(width: 5),
                    CText(
                      text: "Search Project...",
                      fontWeight: FontWeight.bold,
                      textColor: ColorUtils.white,
                    ),
                  ],
                ),
              ),
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
