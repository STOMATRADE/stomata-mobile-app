import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:flutter_package/source/ctext_input_component.dart';
import 'package:flutter_package/source/custom_button.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/image_utils.dart';
import 'package:stomata_app/features/auth/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(LoginController());

    return BaseWidgetContainer(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(ImageUtils.backgroundSecondary),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SvgPicture.asset(ImageUtils.brandLogo, semanticsLabel: 'Dart Logo'),
                Center(child: Image.asset(ImageUtils.brandLogo, scale: 5)),
                const SizedBox(height: 20),
                Text(
                  "Stomatrade Login",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                CustomButton(
                  onPressed: _controller.gotoHome,
                  preffixIcons: Image.asset(
                    ImageUtils.googleLogo,
                    height: 20,
                    width: 20,
                  ),
                  titleButton: "Login With Google",
                  borderRadius: 20,
                  backgroundColors: ColorUtils.primaryColors,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
