import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:flutter_package/source/ctext_input_component.dart';
import 'package:flutter_package/source/custom_button.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/global_widget/loading/loading_screen.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/image_utils.dart';
import 'package:stomata_app/features/auth/controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginController controller;

  @override
  void initState() {
    controller = Get.put(LoginController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(ImageUtils.background),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Image.asset(ImageUtils.brandLogo, width: 90)),
                const SizedBox(height: 20),
                GestureDetector(
                  onLongPress: () {
                    controller.goToDebugMode();
                  },
                  child: Text(
                    "Stomatrade Login",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    CTextInput(
                      textController: controller.textController,
                      inputBackgroundColors: ColorUtils.thirdBgColors,
                      // keyboardType: TextInputType.number,
                      borderWidth: 1,
                      maxLines: 1,
                      enableBorderColors: ColorUtils.secondaryColors,
                      focusBorderColors: ColorUtils.secondaryColors,
                      preffixIcon: Icon(Icons.person, color: ColorUtils.white),
                      hintText: "Email",
                      labelInput: "Email",
                      labelInputColors: ColorUtils.white,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      cursorColors: ColorUtils.secondaryColors,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Obx(
                  () => CustomButton(
                    onPressed: () => controller.loginPrivyEmail(context),
                    enableButton: controller.enableButton.value,
                    titleButton: "Login",
                    backgroundDisableColors: ColorUtils.primaryColors.withAlpha(
                      60,
                    ),
                    borderRadius: 20,
                    backgroundColors: ColorUtils.primaryColors,
                  ),
                ),
                const SizedBox(height: 10),
                Text("Or", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                CustomButton(
                  onPressed: () {
                    controller.loginWithGoogle(context);
                  },
                  preffixIcons: Image.asset(ImageUtils.googleLogo, width: 20),
                  titleButton: "Login With Google",
                  borderRadius: 20,
                  backgroundColors: ColorUtils.secondaryBgColors,
                  borderColors: ColorUtils.primaryColors,
                  needBorder: true,
                  fontColor: ColorUtils.white,
                ),
              ],
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? const LoadingScreen()
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
