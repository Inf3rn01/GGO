import 'package:ggo/utils/constants/images_strings.dart';
import 'package:ggo/utils/constants/sizes.dart';
import 'package:ggo/utils/constants/text_strings.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';


class GLoginHeader extends StatelessWidget {
  const GLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageHeight = constraints.maxWidth < 600 ? 100 : 140;
        double titleFontSize = constraints.maxWidth < 600 ? 24 : 32;
        double subTitleFontSize = constraints.maxWidth < 600 ? 14 : 18;
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              height: imageHeight,
              image: AssetImage(darkTheme ? GImages.lightAppLogo : GImages.darkAppLogo),
              color: darkTheme ? GColors.white : Colors.black.withOpacity(0.9),
            ),
            const SizedBox(height: GSizes.sm),
            Text(
              GTexts.loginTitle,
              style: TextStyle(fontSize: titleFontSize, color: darkTheme ? GColors.white : Colors.black.withOpacity(0.9), fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: GSizes.sm),
            Text(
              GTexts.loginSubTitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: subTitleFontSize),
            ),
          ],
        );
      },
    );
  }
}
