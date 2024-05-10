import 'package:ggo/utils/constants/images_strings.dart';
import 'package:ggo/utils/constants/sizes.dart';
import 'package:ggo/utils/constants/text_strings.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class GLoginHeader extends StatelessWidget {
  const GLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            height: 140,
            image: AssetImage(dark ? GImages.lightAppLogo : GImages.darkAppLogo),
          ),
          const SizedBox(height: GSizes.sm),
          Text(GTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: GSizes.sm),
          Text(GTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
        ],
    );
  }
}