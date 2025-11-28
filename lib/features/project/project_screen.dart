import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/instance_manager.dart';
import 'package:stomata_app/core/global_widget/card_item.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/image_utils.dart';
import 'package:stomata_app/features/project/controller/project_controller.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(ProjectController());
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
            const SizedBox(height: 30),
            CText(
              text: "Projects List",
              fontSize: 24,
              textColor: ColorUtils.white,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {},
              child: Card(
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
                        text: "Search Project...",
                        fontWeight: FontWeight.bold,
                        textColor: ColorUtils.white,
                      ),
                    ],
                  ),
                ),
              ),
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
