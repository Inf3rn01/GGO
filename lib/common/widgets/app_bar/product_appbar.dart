import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/utils/device/device_utility.dart';
import '../../../utils/constants/colors.dart';

class ProductAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProductAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.onSharePressed,
  });

  final Widget? title;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final VoidCallback? onSharePressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            GColors.dark.withOpacity(0.35),
            GColors.dark.withOpacity(0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 13, top: 13, right: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Левая иконка с тенью
                GestureDetector(
                  onTap: leadingOnPressed,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 0),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Icon(
                      leadingIcon,
                      color: GColors.white,
                      size: 25,
                    ),
                  ),
                ),

                /// Иконка "Поделиться" с тенью
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(2, 0),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: onSharePressed,
                    icon: const Icon(
                      Icons.share,
                      color: GColors.white,
                      size: 23,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(GDeviceUtils.getAppBarHeight());
}