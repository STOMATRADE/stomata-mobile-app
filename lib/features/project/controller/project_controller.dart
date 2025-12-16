import 'package:get/get.dart';
import 'package:stomata_app/features/project/project_detail_screen.dart';

class ProjectController extends GetxController {
  void goToDetail() {
    Get.to(() => ProjectDetailScreen());
  }
}
