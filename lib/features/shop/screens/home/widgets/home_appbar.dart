import 'package:flutter/material.dart';

import '../../../../../common/widgets/app_bar/auth_appbar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class GHomeAppBar extends StatelessWidget {
  const GHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AuthAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(GTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: GColors.grey)),
         // Text(GTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: GColors.grey)),
        ],
      ),
    );
  }
}