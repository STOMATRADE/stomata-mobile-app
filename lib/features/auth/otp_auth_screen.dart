import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:stomata_app/core/global_widget/loading_screen.dart';
import 'package:stomata_app/core/utils/helpers.dart';
import 'package:stomata_app/features/auth/controller/otp_auth_controller.dart';

class OtpAuthScreen extends StatefulWidget {
  final String email;
  const OtpAuthScreen({super.key, required this.email});

  @override
  State<OtpAuthScreen> createState() => _OtpAuthScreenState();
}

class _OtpAuthScreenState extends State<OtpAuthScreen> {
  late final OtpAuthController controller;

  @override
  void initState() {
    controller = Get.put(OtpAuthController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Helpers.getFullHeight(context) * 0.2,
              left: 50,
              right: 50,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "input OTP Authentication",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  Pinput(
                    autofocus: true,
                    length: 6,
                    showCursor: true,
                    validator: (code) {
                      controller.otpConfirmation(
                        widget.email,
                        code ?? "",
                        context,
                      );
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "OTP has been sended to your email",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
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
