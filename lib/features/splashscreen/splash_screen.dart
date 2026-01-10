import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/config/firebase/firebase_remote_config_utils.dart';
import 'package:stomata_app/core/config/storage/cache_manager.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/image_utils.dart';
import 'package:stomata_app/core/utils/logging.dart';
import 'package:stomata_app/core/utils/param/parameters.dart';
import 'package:stomata_app/features/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with CacheManager {
  @override
  void initState() {
    splasScreenStart();
    super.initState();
  }

  splasScreenStart() async {
    try {
      /// FOR DATA DUMMY HANDLE
      FirebaseRemoteConfig remoteConfigUtils = await FirebaseRemoteConfigUtils()
          .getRemoteConfig();

      bool dummyStatus = remoteConfigUtils.getBool("dummy_status");
      await setDummyData(dummyStatus);

      Get.off(() => const LoginScreen());
    } catch (e) {
      printLog("error firebase config: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Hero(
                  tag: ParametersKey.brandLogo.name,
                  child: Image.asset(ImageUtils.brandLogo, width: 90),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Stomatrade",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              CircularProgressIndicator(
                color: ColorUtils.primaryColors,
                strokeWidth: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
