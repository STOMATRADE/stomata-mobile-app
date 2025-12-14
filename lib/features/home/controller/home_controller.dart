import 'package:get/get.dart';
import 'package:stomata_app/features/project_detail/project_detail_screen.dart';

class HomeController extends GetxController {
  RxInt totalAsset = 1000000.obs;
  RxInt totalCash = 500000.obs;
  RxInt totalReturn = 1200000.obs;
  RxString percentage = "50".obs;

  void goToDetail() {
    Get.to(() => ProjectDetailScreen());
  }
}
