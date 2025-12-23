import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stomata_app/features/project/project_detail_screen.dart';

class HomeController extends GetxController {
  RxInt totalAsset = 1000000.obs;
  RxInt totalCash = 500000.obs;
  RxInt totalReturn = 1200000.obs;
  RxString percentage = "50".obs;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void getBalanceAndAsset() async {}

  void goToDetail() {
    Get.to(() => ProjectDetailScreen());
  }
}
