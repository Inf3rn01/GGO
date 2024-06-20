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
  final String imageAssetPath;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.all(0),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Determine if the screen is small or large
          bool isLargeScreen = constraints.maxWidth > 600;

          // Adjust font size and image size based on screen size
          double fontSize = isLargeScreen ? 20 : 16;
          double imageSize = isLargeScreen ? 50 : 40;

          return Stack(
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
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.cover,
                        color: dark ? GColors.white : const Color(0xFF101010),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600,
                          ),
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
                  color: const Color(0xFF949494),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(GDeviceUtils.getAppBarHeight());
}
