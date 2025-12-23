import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:get/get.dart';
import 'package:stomata_app/features/debug_mode/controller/debug_mode_controller.dart';

class DebugModeScreen extends StatefulWidget {
  const DebugModeScreen({super.key});

  @override
  State<DebugModeScreen> createState() => _DebugModeScreenState();
}

class _DebugModeScreenState extends State<DebugModeScreen> {
  late final DebugModeController controller;

  @override
  void initState() {
    controller = Get.put(DebugModeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      appBar: AppBar(title: Text("Debug Mode"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text("Activate Dummy Data")),
                Obx(
                  () => Switch(
                    value: controller.isDummyData.value,
                    onChanged: (status) {
                      controller.handleDummyData(status);
                    },
                    // activeThumbColor: ColorUtils.primaryColors,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
