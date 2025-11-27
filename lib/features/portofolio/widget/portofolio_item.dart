import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';

class PortofolioItem extends StatelessWidget {
  final String? imageUrl;
  final String? projectName;
  final String? releaserName;
  final VoidCallback onTap;

  const PortofolioItem({
    super.key,
    this.imageUrl,
    this.projectName,
    this.releaserName,
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
                    SizedBox(height: 12),
                    // const Divider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          margin: const EdgeInsets.all(0),
                          color: ColorUtils.thirdBgColors,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                              top: 2,
                              bottom: 2,
                            ),
                            child: Text(
                              "Rp 500.000.000 / Rp 10.000.000.000",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        LinearProgressBar(
                          maxSteps: 1000000000,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: 500000000,
                          progressColor: ColorUtils.primaryColors,
                          backgroundColor: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Text("Price", style: TextStyle(fontSize: 15)),
                        Expanded(child: const SizedBox()),
                        Text(
                          "Rp 10.000.000.000",
                          style: TextStyle(
                            fontSize: 15,
                            color: ColorUtils.primaryColors,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text("Total Asset", style: TextStyle(fontSize: 15)),
                        Expanded(child: const SizedBox()),
                        Text(
                          "Rp 500.000.000",
                          style: TextStyle(
                            fontSize: 15,
                            color: ColorUtils.primaryColors,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text("Margin", style: TextStyle(fontSize: 15)),
                        Expanded(child: const SizedBox()),
                        Card(
                          margin: const EdgeInsets.all(0),
                          color: ColorUtils.primaryColors,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                              top: 2,
                              bottom: 2,
                            ),
                            child: Text(
                              "50%",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text("Return", style: TextStyle(fontSize: 15)),
                        Expanded(child: const SizedBox()),
                        Text(
                          "Rp 250.000.000 (+50%)",
                          style: TextStyle(
                            fontSize: 15,
                            color: ColorUtils.primaryColors,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          "Cumulative Return",
                          style: TextStyle(fontSize: 15),
                        ),
                        Expanded(child: const SizedBox()),
                        Card(
                          margin: const EdgeInsets.all(0),
                          color: ColorUtils.thirdBgColors,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                              top: 2,
                              bottom: 2,
                            ),
                            child: Text(
                              "Rp 750.000.000",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
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
