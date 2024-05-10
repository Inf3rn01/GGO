import 'package:flutter/material.dart';
import 'package:ggo/utils/device/device_utility.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:ggo/utils/constants/images_strings.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';

class MarketAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MarketAppBar({
    super.key,
    this.title = 'Gun Gale Online',
    this.imageAssetPath = GImages.lightAppLogo, // Новый параметр для пути к файлу изображения
  });

  final String title;
  final String imageAssetPath; // Путь к файлу изображения

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Stack(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: dark ? const Color(0xFF111111) : GColors.white,
            title: Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imageAssetPath,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    color: dark ? GColors.white : const Color(0xFF101010),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 0.5,
              color: const Color(0xFF949494)
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(GDeviceUtils.getAppBarHeight());
}