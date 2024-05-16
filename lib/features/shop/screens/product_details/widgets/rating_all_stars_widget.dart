import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:icons_plus/icons_plus.dart';


class RatingWithAllStars extends StatelessWidget {
  const RatingWithAllStars({
    super.key,
    required this.rating,
    required this.reviewCount,
    this.showRatingNumber = false,
  });

  final double rating;
  final int reviewCount;
  final bool showRatingNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: GRoundedContainer(
            height: 33,
            width: 156,
            backgroundColor: Colors.black.withOpacity(0.2),
            showBorder: true,
            borderColor: GColors.borderPrimary.withOpacity(0.1),
            radius: 12,
            child: Padding(
              padding: const EdgeInsets.only(top: 4, right: 4.5, left: 6.5, bottom: 5),
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
                          size: 17.5,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text('$reviewCount', style: TextStyle(fontSize: 14.5, color: GColors.grey.withOpacity(0.9))),
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