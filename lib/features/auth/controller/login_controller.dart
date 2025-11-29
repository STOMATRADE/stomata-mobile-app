import 'package:get/get.dart';
import 'package:stomata_app/features/main/main_screen.dart';

class LoginController extends GetxController {
  RxBool isLoading = true.obs;
  void gotoHome() async {
    // Implement navigation to home screen
    await Future.delayed(const Duration(seconds: 1));
    isLoading = false.obs;
    Get.offAll(() => const MainScreen());
  }
}
