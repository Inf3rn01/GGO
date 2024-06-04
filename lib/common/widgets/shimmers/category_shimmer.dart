import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/shimmers/shimmer.dart';
import 'package:ggo/utils/constants/sizes.dart';


class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({
    super.key,
    this.itemCount = 6,
    });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: GSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ///Image
              ShimmerEffect(width: 58, height: 58, radius: 58),
              
              SizedBox(height: 5),

              /// Text
              ShimmerEffect(width: 50, height: 8)

            ],
          );
        },
      ),
    );
  }
}