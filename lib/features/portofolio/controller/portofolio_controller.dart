import 'package:get/get.dart';
import 'package:stomata_app/features/portofolio_detail/controller/portofolio_detail_controller.dart';
import 'package:stomata_app/features/portofolio_detail/portofolio_detail_screen.dart';

class PortofolioController extends GetxController {
  RxInt totalAsset = 1000000.obs;
  RxInt totalCash = 500000.obs;
  RxInt totalReturn = 1200000.obs;

  void goToDetail() {
    Get.to(() => PortofolioDetailScreen());
  }
}
