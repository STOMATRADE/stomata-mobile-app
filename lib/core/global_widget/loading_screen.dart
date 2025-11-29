import 'package:flutter/material.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.1),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorUtils.thirdBgColors,
          ),
          child: CircularProgressIndicator(color: ColorUtils.primaryColors),
        ),
      ),
    );
  }
}
