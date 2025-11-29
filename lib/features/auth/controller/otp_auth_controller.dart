import 'package:get/get.dart';
import 'package:stomata_app/core/config/blockchain/model/verify_privy_model.dart';
import 'package:stomata_app/core/config/blockchain/privy_config.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/features/main/main_screen.dart';

class OtpAuthController extends GetxController {
  RxBool isLoading = false.obs;

  void otpConfirmation(String email, String otpCode) async {
    isLoading.value = true;
    PrivyConfigUtils privyConfigUtils = PrivyConfigUtils();

    try {
      VerifyPrivyModel data = await privyConfigUtils.verifyCode(email, otpCode);

      printLog("data: ${data.message}");

      if (data.success == true) {
        isLoading.value = false;
        Get.offAll(() => const MainScreen());
      } else {
        isLoading.value = false;
        printLog("is failed");
      }
    } catch (e) {
      printLog("error screen: $e");

      isLoading.value = false;
    }
  }
}
