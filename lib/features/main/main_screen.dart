import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/features/main/controller/main_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final MainController controller;

  @override
  void initState() {
    controller = Get.put(MainController());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: Obx(
        () =>
            controller.widgetScreen.elementAt(controller.selectedWidget.value),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: Colors.black);
            }
            return const IconThemeData(color: Colors.grey);
          }),
        ),
        child: Obx(
          () => ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: NavigationBar(
              backgroundColor: ColorUtils.secondaryBgColors,
              indicatorColor: ColorUtils.primaryColors,
              selectedIndex: controller.selectedWidget.value,

              onDestinationSelected: (index) {
                controller.selectedWidget.value = index;
              },
              labelTextStyle: WidgetStateProperty.all(
                TextStyle(color: Colors.white, fontSize: 10),
              ),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.shopping_basket_outlined),
                  selectedIcon: Icon(Icons.shopping_basket_rounded),
                  label: 'Project',
                ),
                NavigationDestination(
                  icon: Icon(Icons.shopping_cart_checkout_rounded),
                  selectedIcon: Icon(Icons.shopping_cart_checkout_rounded),
                  label: 'Portofolio',
                ),
                NavigationDestination(
                  icon: Icon(Icons.people_alt_outlined),
                  selectedIcon: Icon(Icons.people_alt),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
