import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:ggo/utils/device/device_utility.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';

class GTabBar extends StatelessWidget implements PreferredSizeWidget {
  const GTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    return TabBar(
      tabs: tabs,
      indicatorColor: GColors.primary,
      labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: darkTheme ? GColors.white : GColors.dark),
      unselectedLabelColor: GColors.darkGrey,
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(GDeviceUtils.getAppBarHeight());
}