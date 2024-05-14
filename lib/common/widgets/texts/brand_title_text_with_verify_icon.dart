import 'package:flutter/material.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../utils/constants/sizes.dart';
import 'brand_title_text.dart';

class BrandTitleWithVerifiedIcon extends StatelessWidget {
  const BrandTitleWithVerifiedIcon({
    super.key,
    this.textColor,
    this.maxLines = 1,
    required this.title,
    this.iconColor = GColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSizeSmall = false,
    this.iconSizeSmall = true,
    required this.brandImageAsset, // The image asset or URL for the brand logo
    this.isNetworkImage = false, // Whether the image is a network image or not
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final bool brandTextSizeSmall;
  final bool iconSizeSmall;
  final String brandImageAsset; // The image asset or URL for the brand logo
  final bool isNetworkImage; // Whether the image is a network image or not

  @override
  Widget build(BuildContext context) {
    Widget brandImage;

    if (isNetworkImage) {
      brandImage = Image.network(
        brandImageAsset,
        width: 20.5,
        height: 20.5,
        fit: BoxFit.cover,
      );
    } else {
      brandImage = Image.asset(
        brandImageAsset,
        width: 20.5,
        height: 20.5,
        fit: BoxFit.cover,
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        brandImage,
        const SizedBox(width: GSizes.xs),
        Flexible(
          child: BrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSizeSmall: brandTextSizeSmall,
          ),
        ),
        const SizedBox(width: 2),
        Icon(Iconsax.verify_bold, color: iconColor, size: iconSizeSmall ? 16 : 19),
      ],
    );
  }
}