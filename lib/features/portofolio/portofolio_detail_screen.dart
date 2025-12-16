import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:flutter_package/source/custom_button.dart';
import 'package:get/instance_manager.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/features/portofolio/controller/portofolio_detail_controller.dart';

class PortofolioDetailScreen extends StatelessWidget {
  const PortofolioDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PortofolioDetailController());
    return BaseWidgetContainer(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Portofolio Detail', style: TextStyle(fontSize: 18)),
        actions: [
          IconButton(
            icon: Icon(Icons.message_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  child: Image.network(
                    "https://www.sadakoffie.com/wp-content/uploads/2018/05/Carrboro-Coffee-Roasters.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Card(
                            margin: const EdgeInsets.all(0),
                            color: ColorUtils.primaryColors,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                                top: 5,
                                bottom: 5,
                              ),
                              child: Text(
                                "Kopi",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Card(
                            margin: const EdgeInsets.all(0),
                            color: ColorUtils.thirdBgColors,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                                top: 5,
                                bottom: 5,
                              ),
                              child: Text(
                                "On Your Portofolio",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: ColorUtils.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Pengiriman Kopi Lampung",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () => controller.showCompanyDetail(context),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Icon(Icons.corporate_fare, color: ColorUtils.white),
                            Container(
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Image.network(
                                "https://bcassetcdn.com/public/blog/wp-content/uploads/2023/06/21145200/Costa-Coffee-1024x640.png",
                                fit: BoxFit.cover,
                                scale: 15,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "PT. Makmur Sejahtera",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  "Lampung",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: ColorUtils.primaryColors,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
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
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          LinearProgressBar(
                            minHeight: 5,
                            maxSteps: 1000000000,
                            progressType: LinearProgressBar.progressTypeLinear,
                            currentStep: 500000000,
                            progressColor: ColorUtils.primaryColors,
                            backgroundColor: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "12 Investor",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                children: [
                                  Text("Margin"),
                                  const SizedBox(width: 8),
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
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      Text(
                        "Portofolio Detail",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Card(
                        margin: const EdgeInsets.all(0),
                        color: ColorUtils.secondaryBgColors,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Your Asset",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  Text(
                                    "Rp 500.000.000",
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
                                      "Return Rate",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  Text(
                                    "25%",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: ColorUtils.primaryColors,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 8),
                              const Divider(),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Return",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  Text(
                                    "Rp 250.000.000 (+25%)",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: ColorUtils.primaryColors,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Cumulative Asset Value",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
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
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                        color: ColorUtils.secondaryBgColors,
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
                      Text(
                        "Pricing",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Card(
                        margin: const EdgeInsets.all(0),
                        color: ColorUtils.secondaryBgColors,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Project Price",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  Text(
                                    "Rp. 20.000.000.000",
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
                                      "Funding Price",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  Text(
                                    "Rp. 10.000.000.000",
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
                                      "Current Funding Price",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  Text(
                                    "Rp. 500.000.000",
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

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: ColorUtils.secondaryBgColors,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 30,
                top: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: controller.startInvest,
                      titleButton: "Invest",
                      borderRadius: 30,
                      backgroundColors: ColorUtils.primaryColors,
                    ),
                  ),
                  // const SizedBox(width: 8),
                  // Expanded(
                  //   child: CustomButton(
                  //     onPressed: () {},
                  //     titleButton: "Sell",
                  //     fontColor: ColorUtils.white,
                  //     borderRadius: 30,
                  //     backgroundColors: ColorUtils.thirdBgColors,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
