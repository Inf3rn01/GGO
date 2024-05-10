import 'package:flutter/material.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class GSectionsHeading extends StatelessWidget {
  const GSectionsHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Text(title, style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700, color: darkTheme ? GColors.white : GColors.dark), maxLines: 1, overflow: TextOverflow.ellipsis),
        if(showActionButton) TextButton(onPressed: (){}, child: Text(buttonTitle))
      ],
    );
  }
}
