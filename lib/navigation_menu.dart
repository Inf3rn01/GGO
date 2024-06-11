import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:icons_plus/icons_plus.dart';

import 'features/shop/controlers/navigation_controller.dart';
import 'utils/constants/colors.dart';
import 'utils/helpers/helper_functions.dart';

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
          selectedItemColor: GColors.primary,
          unselectedItemColor: darkMode ? Colors.white.withOpacity(0.5) : Colors.black.withOpacity(0.5),
          backgroundColor: darkMode ? GColors.black : Colors.white,
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.selectedIndex.value = index,
          items: [
            BottomNavigationBarItem(
              icon: controller.selectedIndex.value == 0
                  ? const Icon(Iconsax.home_2_outline)
                  : const Icon(Iconsax.home_outline),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Icon(CupertinoIcons.shopping_cart),
                  // if (controller.cartItemCount.value > 0)
                  //   Positioned(
                  //     left: 10,
                  //     top: -10,
                  //     child: badges.Badge(
                  //       badgeContent: Text(
                  //         controller.cartItemCount.value.toString(),
                  //         style: const TextStyle(color: Colors.white),
                  //       ),
                  //       badgeStyle: const badges.BadgeStyle(
                  //         badgeColor: GColors.primary,
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: controller.selectedIndex.value == 2
                  ? const Icon(Iconsax.more_2_outline)
                  : const Icon(Iconsax.more_outline),
              label: 'More',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}