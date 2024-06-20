import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/texts/product_title_text.dart';
import 'package:ggo/features/shop/controlers/product_controller.dart';
import 'package:ggo/features/shop/models/product_models.dart';
import 'package:ggo/features/shop/screens/product_details/widgets/product_slider.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';

import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../../../features/shop/screens/product_reviews/widgets/raiting/rating_one_star_widget.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../texts/product_price_text.dart';

class GProductCardVertical extends StatelessWidget {
  const GProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final dark = GHelperFunctions.isDarkMode(context);
    final screenWidth = GHelperFunctions.screenWidth();

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: GRoundedContainer(
        showBorder: true,
        borderColor: GColors.borderPrimary.withOpacity(0.02),
        backgroundColor: dark ? const Color(0xFF202020) : const Color(0xFFF0F0F0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final imageHeight = constraints.maxHeight * 0.3;
            return Stack(
              children: [
                Positioned.fill(
                  bottom: imageHeight,
                  child: GProductSlider(product: product.images!, showCounter: false),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10),
                        Flexible(
                          child: ProductPriceText(
                            price: controller.getProductPrice(product),
                            size: 19,
                            maxLines: 1,
                          ),
                        ),
                        Flexible(
                          child: ProductTitleText(
                            title: product.title,
                            smallSize: screenWidth < 600,
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(height: 3),
                        const Flexible(
                          child: RatingWithOneStar(rating: 4, reviewCount: 1)
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}