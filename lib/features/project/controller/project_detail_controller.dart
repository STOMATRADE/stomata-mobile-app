import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/global_widget/snackbar.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/helpers.dart';
import 'package:stomata_app/core/global_widget/company_detail_content.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/features/investment/investment_screen.dart';
import 'package:stomata_app/features/investment/model/investment_model.dart';
import 'package:stomata_app/repository/project/project_repository.dart';
import 'package:stomata_app/repository/project/view/detail/project_detail_view_model.dart';
import 'package:stomata_app/repository/project/view/list/project_item_view_model.dart';

class ProjectDetailController extends GetxController {
  BuildContext? context;
  final ProjectItemViewModel projectData;

  RxBool loadingDetail = false.obs;
  Rx<ProjectDetailViewModel> projectDetail = ProjectDetailViewModel().obs;

  ProjectDetailController({required this.context, required this.projectData});
  @override
  void onInit() {
    getProjectDetail(context);
    super.onInit();
  }

  void getProjectDetail(context) async {
    try {
      loadingDetail.value = true;

      var response = await ProjectRepository().getProjectDetail(
        projectData.projectId ?? "",
      );

      loadingDetail.value = false;
      if (response.header.statusCode == 200) {
        projectDetail.value = response.data;

        printLog("project detail: ${projectDetail.value}");
      } else {
        SnackbarComponent.showErrorSnackbar(
          context: context,
          message: response.header.message,
        );
      }
    } catch (e) {
      loadingDetail.value = false;
      printLog("error : ${e.toString()}");
      SnackbarComponent.showErrorSnackbar(
        context: context,
        message: e.toString(),
      );
    }
  }

  void showCompanyDetail(context, ProjectDetailViewModel data) {
    Get.bottomSheet(
      Container(
        height: Helpers.getFullHeight(context) * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: ColorUtils.secondaryBgColors,
        ),
        child: CompanyDetailContent(
          companyIcon:
              "https://bcassetcdn.com/public/blog/wp-content/uploads/2023/06/21145200/Costa-Coffee-1024x640.png",
          companyName: data.collectorName ?? "",
          companyAddress: data.landAddress ?? "",
          companyEmail: "CustomerService@${data.collectorName}.co.id",
          companyPhone: "81234567823",
        ),
      ),
    );
  }

  void startInvest() {
    InvestmentModel data = InvestmentModel()
      ..collectorName = projectDetail.value.collectorName
      ..commodity = projectDetail.value.commodity
      ..currentFundingPrice = projectDetail.value.currentFundingPrice
      ..deliveryDate = projectDetail.value.deliveryDate
      ..farmerName = projectDetail.value.farmerName
      ..fundingPercentage = projectDetail.value.fundingPercentage
      ..fundingPrice = projectDetail.value.fundingPrice
      ..gradeQuality = projectDetail.value.gradeQuality
      ..image = projectDetail.value.image
      ..investors = projectDetail.value.investors
      ..landAddress = projectDetail.value.landAddress
      ..projectId = projectDetail.value.projectId
      ..projectName = projectDetail.value.projectName
      ..projectPrice = projectDetail.value.projectPrice
      ..returnInvestmentRate = projectDetail.value.returnInvestmentRate
      ..status = projectDetail.value.status
      ..submissionDate = projectDetail.value.submissionDate
      ..volume = projectDetail.value.volume;

    Get.to(() => InvestmentScreen(detailData: data));
  }
}
