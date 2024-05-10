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
    this.brandIconSizeSmall = true,
    });

    final String title;
    final int maxLines;
    final Color? textColor, iconColor;
    final TextAlign? textAlign;
    final bool brandTextSizeSmall;
    final bool brandIconSizeSmall;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
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

        Icon(Iconsax.verify_bold, color: iconColor, size: brandIconSizeSmall ? 16 : 19),
      ],
    );
  }
}