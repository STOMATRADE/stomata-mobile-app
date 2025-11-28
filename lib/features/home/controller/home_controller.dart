import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stomata_app/features/project_detail/project_detail_screen.dart';

class HomeController extends GetxController {
  RxInt totalAsset = 1000000.obs;
  RxInt totalCash = 500000.obs;
  RxInt totalReturn = 1200000.obs;

  void goToDetail() {
    Get.to(() => ProjectDetailScreen());
  }
}
