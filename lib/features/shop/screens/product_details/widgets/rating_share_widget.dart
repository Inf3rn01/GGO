import 'package:flutter/material.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class RaitingAndShare extends StatelessWidget {
  const RaitingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Rating
        const Row(
          children: [
            SizedBox(height: GSizes.spaceBtwItems / 2),
            Icon(HeroIcons.star, color: Colors.amber, size: 23),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '4.7 ', style: TextStyle(fontSize: 16)),
                  TextSpan(text: '(199)', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
        /// Share
        IconButton(onPressed: (){}, icon: Icon(Icons.share, size: GSizes.iconMd, color: darkTheme ? GColors.grey : GColors.darkerGrey)),
      ],
    );
  }
}