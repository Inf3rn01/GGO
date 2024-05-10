import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ggo/features/shop/screens/cart/cart.dart';
import 'package:ggo/features/shop/screens/home/home.dart';
import 'package:ggo/features/personalization/screens/settings/settings.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = GHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: darkMode ? Colors.white : Colors.black,
          unselectedItemColor: darkMode ? Colors.white.withOpacity(0.5) : Colors.black.withOpacity(0.5),
          backgroundColor: darkMode ? GColors.black : Colors.white,
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.selectedIndex.value = index,
          items: [
            BottomNavigationBarItem(
              icon: controller.selectedIndex.value == 0
                  ? const Icon(Iconsax.home_2_outline, color: GColors.primary)
                  : const Icon(Iconsax.home_outline),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: controller.selectedIndex.value == 1
                  ? const Icon(CupertinoIcons.shopping_cart, color: GColors.primary)
                  : const Icon(CupertinoIcons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: controller.selectedIndex.value == 2
                  ? const Icon(Iconsax.more_2_outline, color: GColors.primary)
                  : const Icon(Iconsax.more_outline),
              label: 'Account',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final Rx<int> cartItemCount = 0.obs;
  final screens = [const HomeScreen(), const CartScreen(), const SettingsScreen()];

  void updateCartItemCount(int count) {
    cartItemCount.value = count; // Обновляем количество товаров в корзине
  }
}