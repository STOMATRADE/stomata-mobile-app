import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/image_utils.dart';
import 'package:stomata_app/features/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splasScreenStart();
  }

  splasScreenStart() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll(() => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: Stack(
        children: [
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   right: 0,
          //   child: Image.asset(ImageUtils.background),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SvgPicture.asset(ImageUtils.brandLogo, semanticsLabel: 'Dart Logo'),
              Center(child: Image.asset(ImageUtils.brandLogo, width: 90)),
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
