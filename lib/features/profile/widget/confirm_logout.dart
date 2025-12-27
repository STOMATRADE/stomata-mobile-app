import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/core/utils/image_utils.dart';

class ConfirmLogout extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onLogout;
  const ConfirmLogout({
    super.key,
    required this.onCancel,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(ImageUtils.exitIcon, scale: 7),
              ),
              Text(
                "Leave Stomatrade?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "You need log in again to using Stomatrade app",
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: onCancel,
                      titleButton: "Cancel",
                      fontColor: ColorUtils.white,
                      borderRadius: 30,
                      backgroundColors: ColorUtils.thirdBgColors,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomButton(
                      onPressed: onLogout,
                      titleButton: "Logout",
                      borderRadius: 30,
                      backgroundColors: ColorUtils.primaryColors,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
