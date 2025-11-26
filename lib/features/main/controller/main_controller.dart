import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stomata_app/features/home/home_screen.dart';

class MainController extends GetxController {
  RxInt selectedWidget = 0.obs;

  List<Widget> widgetScreen = [
    HomeScreen(),
    Container(),
    Container(),
    Container(),
  ];

  void selectWidget(int index) {
    selectedWidget.value = index;
  }
}
