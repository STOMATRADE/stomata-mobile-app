import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stomata_app/features/home/home_screen.dart';
import 'package:stomata_app/features/portofolio/portofolio_screen.dart';
import 'package:stomata_app/features/profile/profile_screen.dart';
import 'package:stomata_app/features/project/project_screen.dart';

class MainController extends GetxController {
  RxInt selectedWidget = 0.obs;

  List<Widget> widgetScreen = [
    HomeScreen(),
    ProjectScreen(),
    PortofolioScreen(),
    ProfileScreen(),
  ];

  void selectWidget(int index) {
    selectedWidget.value = index;
  }
}
