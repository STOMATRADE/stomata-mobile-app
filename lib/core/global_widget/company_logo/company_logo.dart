import 'package:flutter/material.dart';
import 'package:stomata_app/core/utils/image_utils.dart';

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(ImageUtils.brandLogo, width: 20),
        const SizedBox(width: 8),
        Text(
          "Stomatrade",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
