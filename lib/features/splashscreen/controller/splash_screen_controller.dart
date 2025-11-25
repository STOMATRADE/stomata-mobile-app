import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:stomata_app/core/utils/cache_manager.dart';

class SplashScreenController extends GetxController with CacheManager {
  @override
  void onReady() async {
    super.onReady();
    // splasScreenStart();
  }

  splasScreenStart() async {
    bool loginStatus = await getLoginStatus();
    await Future.delayed(const Duration(seconds: 1));

    if (loginStatus) {
      // Get.offAll(() => const Homepage());
    } else {
      // Get.offAll(() => const LoginPage());
    }
  }
}
