import 'package:flutter/material.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class GSectionsHeading extends StatelessWidget {
  const GSectionsHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.textSize = 23,
    this.buttonTitle = 'View all',
    this.onPressed,
  });

  final double textSize;
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        bool isLargeScreen = constraints.maxWidth > 600;

        double responsiveTextSize = isLargeScreen ? textSize : textSize - 3;
        double buttonTextSize = isLargeScreen ? 16 : 14;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: responsiveTextSize,
                fontWeight: FontWeight.w700,
                color: textColor ?? (darkTheme ? GColors.white : GColors.dark),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (showActionButton)
              TextButton(
                onPressed: onPressed,
                child: Text(
                  buttonTitle,
                  style: TextStyle(
                    fontSize: buttonTextSize,
                    color: GColors.primary,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
