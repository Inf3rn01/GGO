import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    this.textAlign = TextAlign.start,
    this.brandTextSizeSmall = false,
    this.verifyIconSizeSmall = true,
    this.brandImageAsset,
    this.isNetworkImage = false,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final bool brandTextSizeSmall;
  final bool verifyIconSizeSmall;
  final String? brandImageAsset;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    Widget? brandImage;

    if (brandImageAsset != null) {
      brandImage = isNetworkImage
          ? Image.network(
              brandImageAsset!,
              width: 20.5,
              height: 20.5,
              fit: BoxFit.cover,
            )
          : Image.asset(
              brandImageAsset!,
              width: 20.5,
              height: 20.5,
              fit: BoxFit.cover,
            );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (brandImage != null) brandImage,
        if (brandImage != null) const SizedBox(width: GSizes.xs),
        Flexible(
          child: BrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSizeSmall: brandTextSizeSmall,
          ),
        ),
        const SizedBox(width: 3),
        Icon(
          Iconsax.verify_bold,
          color: iconColor,
          size: verifyIconSizeSmall ? 15 : 19,
        ),
      ],
    );
  }
}