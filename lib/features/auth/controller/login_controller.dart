import 'package:get/get.dart';
import 'package:stomata_app/features/main/main_screen.dart';

class LoginController extends GetxController {
  void gotoHome() {
    // Implement navigation to home screen
    Get.offAll(() => const MainScreen());
  }
}
