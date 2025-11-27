import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/utils/image_utils.dart';
import 'package:stomata_app/features/splashscreen/controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut<SplashScreenController>(() => SplashScreenController());
    Get.put(SplashScreenController());

    return BaseWidgetContainer(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(ImageUtils.backgroundSecondary),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SvgPicture.asset(ImageUtils.brandLogo, semanticsLabel: 'Dart Logo'),
              Center(child: Image.asset(ImageUtils.brandLogo, scale: 5)),
              Text(
                "Stomatrade",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
