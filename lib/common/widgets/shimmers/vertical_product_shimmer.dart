import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/layouts/grid_layout.dart';
import 'package:ggo/common/widgets/shimmers/shimmer.dart';

import '../../../features/shop/controlers/product_controller.dart';


class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({
    super.key,
    });

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return GGridLayout(
      itemCount: controller.product.length,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            ShimmerEffect(width: 180, height: 180), 
            SizedBox(height: 10),

            /// Text
            ShimmerEffect(width: 160, height: 15),
            SizedBox(height: 10),
            ShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}