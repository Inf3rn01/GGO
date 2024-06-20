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
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final double width, height, padding;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Circular Icon
              GCircularImage(
                image: image,
                overlayColor: darkTheme ? GColors.white : GColors.black,
                isNetworkImage: isNetworkImage,
              ),
              const SizedBox(height: 3),
              /// Text with SizedBox to limit width
              SizedBox(
                width: width,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 13.4,
                    fontWeight: FontWeight.w600,
                    color: darkTheme ? GColors.white : GColors.dark,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}