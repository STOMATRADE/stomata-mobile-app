import 'package:flutter/material.dart';
import 'package:flutter_package/source/ctext_component.dart';
import 'package:flutter_package/source/custom_button.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/helpers.dart';

class ConfirmationTransaction extends StatelessWidget {
  final int amount;
  final VoidCallback onConfirm;
  const ConfirmationTransaction({
    super.key,
    required this.onConfirm,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Confirmation Transaction",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorUtils.white,
                    ),
                    child: Icon(
                      Icons.close,
                      color: ColorUtils.bgColors,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text("Amount", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Card(
              margin: const EdgeInsets.all(0),
              color: ColorUtils.secondaryGreenColors.withValues(alpha: 0.3),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Image.network(
                            "https://s3.ap-southeast-1.amazonaws.com/static.pintu.co.id/assets/images/logo/IDRX+-+IDRX.png",
                            scale: 30,
                          ),
                          const SizedBox(width: 8),
                          CText(
                            text: Helpers.formatAmount(amount),
                            fontSize: 20,
                            textColor: ColorUtils.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    CText(
                      text: "IDRX",
                      fontSize: 20,
                      textColor: ColorUtils.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Project Detail",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              margin: const EdgeInsets.all(0),
              color: ColorUtils.thirdBgColors,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Quantity of Items",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Text(
                          "20 Pieces",
                          style: TextStyle(
                            fontSize: 15,
                            color: ColorUtils.primaryColors,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Item Type",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Text(
                          "Coffee Bean",
                          style: TextStyle(
                            fontSize: 15,
                            color: ColorUtils.primaryColors,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Submission Date",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Text(
                          "27 January 2026",
                          style: TextStyle(
                            fontSize: 15,
                            color: ColorUtils.primaryColors,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Delivery Date",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Text(
                          "27 January 2026",
                          style: TextStyle(
                            fontSize: 15,
                            color: ColorUtils.primaryColors,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                onConfirm();
              },
              titleButton: "Confirm",
              borderRadius: 30,
              backgroundColors: ColorUtils.primaryColors,
            ),
          ],
        ),
      ),
    );
  }
}
