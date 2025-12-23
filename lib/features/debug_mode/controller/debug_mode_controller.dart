import 'package:get/get.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';

class DebugModeController extends GetxController with CacheManager {
  RxBool isDummyData = false.obs;

  @override
  void onInit() {
    initiateData();
    super.onInit();
  }

  initiateData() async {
    isDummyData.value = await getDummyData();
  }

  void handleDummyData(bool status) async {
    isDummyData.value = status;
    await setDummyData(status);
  }
}
