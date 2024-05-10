import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class GSearchContainer extends StatelessWidget {
  const GSearchContainer({
    super.key,
    this.icon = Iconsax.search_normal_1_outline,
    required this.text,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  25.0, vertical: 34),
        child: Container(
          width: GDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(12.5),
          decoration: BoxDecoration(
            color: showBackground ? dark? GColors.dark : GColors.light : Colors.transparent,
            borderRadius: BorderRadius.circular(GSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: const Color(0xFFB3B3B3)) : null
          ),
          child: Row(
            children: [
              Icon(icon, color: GColors.darkGrey),
              const SizedBox(width: GSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
