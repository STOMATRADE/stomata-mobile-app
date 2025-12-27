import 'package:flutter/material.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';

class CompanyDetailContent extends StatelessWidget {
  final String companyIcon;
  final String companyName;
  final String companyAddress;
  final String companyEmail;
  final String companyPhone;
  const CompanyDetailContent({
    super.key,
    required this.companyIcon,
    required this.companyName,
    required this.companyAddress,
    required this.companyEmail,
    required this.companyPhone,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon(Icons.corporate_fare, color: ColorUtils.white),
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.network(
                    companyIcon,
                    fit: BoxFit.cover,
                    scale: 15,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        companyName,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        companyAddress,
                        softWrap: true,
                        maxLines: null,
                        style: TextStyle(
                          fontSize: 15,
                          color: ColorUtils.primaryColors,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              "Company Email",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(companyEmail, style: TextStyle(fontSize: 12)),
            const SizedBox(height: 30),

            Text(
              "Company Phone Number",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("(+62) $companyPhone", style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
