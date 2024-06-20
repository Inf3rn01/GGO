import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../product_reviews.dart';
import 'raitng_bar_indicator.dart';

class RatingWithAllStars extends StatelessWidget {
  const RatingWithAllStars({
    super.key,
    required this.rating,
    required this.reviewCount,
    this.showRating = true,
    this.showStars = true,
    this.showReviewCount = true,
  });

  final double rating;
  final int reviewCount;
  final bool showRating;
  final bool showStars;
  final bool showReviewCount;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Get.to(() => const ProductReviewsScreen()),
          child: GRoundedContainer(
            height: 33,
            width: screenWidth < 600 ? 131 : 156,
            backgroundColor: Colors.black.withOpacity(0.2),
            showBorder: true,
            borderColor: GColors.borderPrimary.withOpacity(0.1),
            radius: 12,
            child: Padding(
              padding: EdgeInsets.only(
                top: 4,
                right: screenWidth < 600 ? 3.5 : 4.5,
                left: screenWidth < 600 ? 5.5 : 6.5,
                bottom: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (showStars)
                    Row(
                      children: [
                        GRaitingBarIndicator(raiting: rating),
                        if (showRating)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              rating.toStringAsFixed(1),
                              style: TextStyle(
                                fontSize: screenWidth < 600 ? 13 : 14.5,
                                color: GColors.grey.withOpacity(0.9),
                              ),
                            ),
                          ),
                        if (showReviewCount)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              '$reviewCount',
                              style: TextStyle(
                                fontSize: screenWidth < 600 ? 13 : 14.5,
                                color: GColors.grey.withOpacity(0.9),
                              ),
                            ),
                          ),
                      ],
                    ),
                  const Icon(
                    Iconsax.arrow_right_3_outline,
                    color: GColors.darkGrey,
                    size: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
