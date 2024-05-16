import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/images/circular_image.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class GVerticalImagesTexts extends StatelessWidget {
  const GVerticalImagesTexts({
    super.key,
    required this.image,
    required this.title,
    this.textColor = GColors.white,
    this.backgroundColor,
    this.onTap,
    this.width = 58,
    this.height = 58,
    this.padding = 5.5,
  });

  final String image, title;
  final Color textColor;
  final double width, height, padding;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Circular Icon
            GCircularImage(image: image, overlayColor: darkTheme ? GColors.white : GColors.black),
            /// Text
            const SizedBox(height: 5),
            SizedBox(
              width: 50,
              child: Text(
                title,
                style: TextStyle(fontSize: 13.4, fontWeight: FontWeight.w600, color: darkTheme ? GColors.white : GColors.dark),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            )
          ],
        ),
      ),
    );
  }
}