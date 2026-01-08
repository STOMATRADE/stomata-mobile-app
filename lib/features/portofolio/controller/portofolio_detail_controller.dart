import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';
import 'package:stomata_app/core/global_widget/company_detail_content.dart';
import 'package:stomata_app/core/global_widget/snackbar.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/helpers.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/features/investment/investment_screen.dart';
import 'package:stomata_app/features/investment/model/investment_model.dart';
import 'package:stomata_app/repository/auth/view/user_view_model.dart';
import 'package:stomata_app/repository/portofolio/portofolio_repository.dart';
import 'package:stomata_app/repository/portofolio/view/detail/portofolio_detail_view_model.dart';
import 'package:stomata_app/repository/portofolio/view/summary/portofolio_item_view_model.dart';

class PortofolioDetailController extends GetxController with CacheManager {
  BuildContext? context;
  final PortofolioItemViewModel portofolioData;

  RxBool loadingDetail = false.obs;
  Rx<PortofolioDetailViewModel> portofolioDetail =
      PortofolioDetailViewModel().obs;

  PortofolioDetailController({
    required this.context,
    required this.portofolioData,
  });

  @override
  void onInit() {
    getDetailPortofolio(context);
    super.onInit();
  }

  void getDetailPortofolio(context) async {
    try {
      loadingDetail.value = true;

      UserViewModel userData = await getLoginData();

      var response = await PortofolioRepository().getPortofolioDetail(
        userId: userData.id ?? "",
        projectId: portofolioData.projectId ?? "",
      );

      loadingDetail.value = false;
      if (response.header.statusCode == 200) {
        portofolioDetail.value = response.data;
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

  void showCompanyDetail(context) {
    Get.bottomSheet(
      Container(
        height: Helpers.getFullHeight(context) * 0.35,
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
          companyName: "PT. Makmur Sejahtera",
          companyAddress: "Lampung",
          companyEmail: "CustomerService@PT.MakmurSejahtera.co.id",
          companyPhone: "81234567823",
        ),
      ),
    );
  }

  void startInvest() {
    InvestmentModel data = InvestmentModel()
      ..collectorName = portofolioDetail.value.collectorName
      ..commodity = portofolioDetail.value.commodity
      ..currentFundingPrice = portofolioDetail.value.currentFundingPrice
      ..deliveryDate = portofolioDetail.value.deliveryDate
      ..farmerName = portofolioDetail.value.farmerName
      ..fundingPercentage = portofolioDetail.value.fundingPercentage?.toInt()
      ..fundingPrice = portofolioDetail.value.fundingPrice
      ..gradeQuality = portofolioDetail.value.gradeQuality
      ..image = portofolioDetail.value.image
      ..investors = portofolioDetail.value.investors
      ..landAddress = portofolioDetail.value.landAddress
      ..projectId = portofolioDetail.value.projectId
      ..projectName = portofolioDetail.value.projectName
      ..projectPrice = portofolioDetail.value.projectPrice
      ..returnInvestmentRate = portofolioDetail.value.returnInvestmentRate
      ..status = portofolioDetail.value.status
      ..submissionDate = portofolioDetail.value.submissionDate
      ..volume = portofolioDetail.value.volume;

    Get.to(() => InvestmentScreen(detailData: data));
  }
}
