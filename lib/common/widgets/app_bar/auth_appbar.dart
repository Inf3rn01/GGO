import 'package:ggo/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../utils/constants/colors.dart';

class GAppBar extends StatelessWidget implements PreferredSizeWidget{
  const GAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:0),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
          ? IconButton(onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left_outline, color: darkTheme ? GColors.white : GColors.black)) 
          : leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,
        title: title,
        actions: actions,
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(GDeviceUtils.getAppBarHeight());
}