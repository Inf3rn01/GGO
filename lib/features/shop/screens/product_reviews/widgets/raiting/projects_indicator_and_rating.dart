import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/device/device_utility.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key, required this.text, required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(text, style: Theme.of(context).textTheme.bodyLarge)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: GDeviceUtils.getScreenWidth(context) * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              backgroundColor: GColors.grey.withOpacity(0.9),
              borderRadius: BorderRadius.circular(7),
              valueColor: const AlwaysStoppedAnimation(GColors.primary),
            ),
          )
        
        )
      ],
    );
  }
}