import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:stomata_app/core/global_widget/loading/loading_screen.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/helpers.dart';
import 'package:stomata_app/features/investment/controller/pin_controller.dart';

class PinScreen extends StatelessWidget {
  const PinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PinController());
    return BaseWidgetContainer(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('PIN', style: TextStyle(fontSize: 18)),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Helpers.getFullHeight(context) * 0.11,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "input your pin",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Pinput(
                      length: 6,
                      showCursor: true,
                      obscureText: true,
                      enabled: false,
                      controller: controller.textController,
                      validator: (value) {
                        controller.confirmPin(value ?? "", context);
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildNumberButton("1", controller),
                            const SizedBox(width: 20),
                            buildNumberButton("2", controller),
                            const SizedBox(width: 20),
                            buildNumberButton("3", controller),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildNumberButton("4", controller),
                            const SizedBox(width: 20),
                            buildNumberButton("5", controller),
                            const SizedBox(width: 20),
                            buildNumberButton("6", controller),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildNumberButton("7", controller),
                            const SizedBox(width: 20),
                            buildNumberButton("8", controller),
                            const SizedBox(width: 20),
                            buildNumberButton("9", controller),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            refreshButton(controller),
                            const SizedBox(width: 20),
                            buildNumberButton("0", controller),
                            const SizedBox(width: 20),
                            deleteButton(controller),
                          ],
                        ),
                      ],
                    ),
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

  Widget buildNumberButton(String number, PinController controller) {
    return GestureDetector(
      onTap: () => controller.onNumberTap(number),
      child: Container(
        width: 70,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorUtils.thirdBgColors,
        ),
        child: Text(number, style: TextStyle(fontSize: 24)),
      ),
    );
  }

  Widget deleteButton(PinController controller) {
    return GestureDetector(
      onTap: controller.onDeleteTap,
      child: Container(
        width: 70,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorUtils.thirdBgColors,
        ),
        child: Icon(Icons.backspace, size: 26, color: ColorUtils.white),
      ),
    );
  }

  Widget refreshButton(PinController controller) {
    return GestureDetector(
      onTap: controller.onClear,
      child: Container(
        width: 70,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorUtils.thirdBgColors,
        ),
        child: Icon(Icons.refresh, size: 26, color: ColorUtils.white),
      ),
    );
  }
}
