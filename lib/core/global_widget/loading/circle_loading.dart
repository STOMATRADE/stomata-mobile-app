import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';

class CircleLoading extends StatelessWidget {
  const CircleLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: ColorUtils.primaryColors,
      strokeWidth: 2,
    );
  }
}
