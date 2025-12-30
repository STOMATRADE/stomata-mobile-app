import 'package:easy_load_more/easy_load_more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:stomata_app/core/global_widget/card_item.dart';
import 'package:stomata_app/core/global_widget/company_logo/company_logo.dart';
import 'package:stomata_app/core/global_widget/loading/circle_loading.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/features/project/controller/project_controller.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  late final ProjectController controller;
  @override
  void initState() {
    controller = Get.put(ProjectController(context: context));
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
            CompanyLogo(),
            const SizedBox(height: 30),
            CText(
              text: "Project List",
              fontSize: 20,
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
                      : loadDataWidget(controller),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loadDataWidget(ProjectController controller) {
    if (controller.listProjects.isNotEmpty) {
      return ListView.builder(
        padding: const EdgeInsets.only(top: 0),
        itemBuilder: (context, index) {
          var data = controller.listProjects[index];

          return CardItem(
            onTap: () => controller.goToDetail(data),
            imageUrl: data.image ?? "",
            projectName: data.projectName ?? "",
            releaserName: data.projectCompany ?? "",
            investor: data.investors ?? 0,
            fundingGoal: double.parse(data.fundingPrice ?? "0"),
            margin: data.margin,
            percentageFunded: data.fundingPercentage,
            totalFunding: double.parse(data.totalFunding ?? "0"),
          );
        },
        itemCount: controller.listProjects.length,
      );
    } else {
      return Center(child: Text("data is empty"));
    }
  }
}
