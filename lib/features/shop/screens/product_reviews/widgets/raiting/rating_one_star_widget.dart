import 'package:flutter/material.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:ggo/utils/constants/colors.dart';

class RatingWithOneStar extends StatelessWidget {
  const RatingWithOneStar({
    super.key,
    required this.rating,
    required this.reviewCount,
    this.showRating = true,
    this.showIcon = true,
  });

  final double rating;
  final int reviewCount;
  final bool showRating;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    final screenWidth = GHelperFunctions.screenWidth();

    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (showRating)
                      Row(
                        children: [
                          const Icon(
                            HeroIcons.star,
                            color: Colors.amber,
                            size: 15,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            rating.toStringAsFixed(1),
                            style: TextStyle(fontSize: screenWidth < 600 ? 14 : 16),
                          ),
                        ],
                      ),
                    if (showIcon)
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Icon(
                          Iconsax.more_circle_bulk,
                          color: darkTheme ? GColors.grey.withOpacity(0.6) : GColors.darkGrey.withOpacity(0.8),
                          size: screenWidth < 600 ? 5 : 6,
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: Text(
                        '$reviewCount отзыв',
                        style: TextStyle(
                          fontSize: screenWidth < 600 ? 13 : 15,
                          color: darkTheme ? GColors.grey.withOpacity(0.6) : GColors.darkerGrey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
