import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:get/get.dart';
import 'package:stomata_app/core/utils/colors_utils.dart';
import 'package:stomata_app/features/main/controller/main_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(MainController());
    return BaseWidgetContainer(
      body: Obx(
        () => _controller.widgetScreen.elementAt(
          _controller.selectedWidget.value,
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: Colors.white);
            }
            return const IconThemeData(color: Colors.grey);
          }),
        ),
        child: Obx(
          () => NavigationBar(
            backgroundColor: ColorUtils.secondaryBgColors,
            indicatorColor: ColorUtils.primaryColors,

            selectedIndex: _controller.selectedWidget.value,
            onDestinationSelected: (index) {
              _controller.selectedWidget.value = index;
            },
            labelTextStyle: WidgetStateProperty.all(
              TextStyle(color: Colors.white),
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
    );
  }
}
