import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/global_widget/company_detail_content.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/helpers.dart';
import 'package:stomata_app/features/investment/investment_screen.dart';

class PortofolioDetailController extends GetxController {
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
    Get.to(() => InvestmentScreen());
  }
}
