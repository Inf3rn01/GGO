import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:icons_plus/icons_plus.dart';

class RatingAndReviews extends StatelessWidget {
  final double rating; // The rating value to display
  final int reviewCount; // The number of reviews

  const RatingAndReviews({
    super.key,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: GRoundedContainer(
            height: 33,
            width: 170,
            backgroundColor: Colors.black.withOpacity(0.2),
            showBorder: true,
            borderColor: GColors.borderPrimary.withOpacity(0.1),
            radius: 12,
            child: Padding(
              padding: const EdgeInsets.only(top: 4, right: 4, left: 6, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) => Icon(
                          HeroIcons.star,
                          color: index < rating ? Colors.amber : Colors.grey,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 4),
                      // Text(rating.toStringAsFixed(1), style: const TextStyle(fontSize: 16)),
                      // const SizedBox(width: 4),
                      Text('$reviewCount', style: const TextStyle(fontSize: 15, color: GColors.grey)),
                    ],
                  ),
                  const Icon(
                    Iconsax.arrow_right_3_outline,
                    color: GColors.grey,
                    size: 16.5,
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