import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:ggo/utils/constants/colors.dart';

class RatingWithOneStar extends StatelessWidget {
  const RatingWithOneStar({
    super.key,
    required this.rating,
    required this.reviewCount,
    this.showRating = true, // Параметр для контроля отображения рейтинга
    this.showIcon = true, // Параметр для контроля отображения иконки
  });

  final double rating;
  final int reviewCount;
  final bool showRating; // Параметр для контроля отображения рейтинга
  final bool showIcon; // Параметр для контроля отображения иконки

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (showRating) // Отображаем рейтинг только при showRating == true
                  Row(
                    children: [
                      const Icon(
                        HeroIcons.star,
                        color: Colors.amber,
                        size: 14,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        rating.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                if (showIcon) // Отображаем иконку только при showIcon == true
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Icon(
                      Iconsax.more_circle_bulk,
                      color: GColors.darkGrey.withOpacity(0.6),
                      size: 5,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Text(
                    '$reviewCount reviews',
                    style: TextStyle(fontSize: 14, color: GColors.grey.withOpacity(0.6)),
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
  }
}