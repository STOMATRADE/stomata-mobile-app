import 'package:flutter/material.dart';
import 'package:flutter_package/source/custom_button.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';

class CardItem extends StatelessWidget {
  final String? imageUrl;
  final String? projectName;
  final String? releaserName;
  final VoidCallback onTap;

  const CardItem({
    super.key,
    this.projectName,
    this.releaserName,
    this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: ColorUtils.secondaryBgColors,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imageUrl ??
                      "https://www.sadakoffie.com/wp-content/uploads/2018/05/Carrboro-Coffee-Roasters.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(projectName ?? "", style: TextStyle(fontSize: 24)),
                    SizedBox(height: 8),
                    Text(releaserName ?? "", style: TextStyle(fontSize: 15)),
                    SizedBox(height: 10),
                    CustomButton(
                      onPressed: () {},
                      titleButton: "See Detail",
                      backgroundColors: ColorUtils.primaryColors,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
