import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/images/rounded_image.dart';
import 'package:ggo/common/widgets/texts/product_title_text.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';

import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../../../features/shop/screens/product_reviews/widgets/raiting/rating_one_star_widget.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../texts/product_price_text.dart';

class GProductCardVertical extends StatelessWidget {
  const GProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: GRoundedContainer(
        showBorder: true,
        borderColor: GColors.borderPrimary.withOpacity(0.02),
        backgroundColor: dark ? const Color(0xFF202020) : const Color(0xFFF0F0F0),
        child: Stack(
          children: [
            const Positioned.fill(
              bottom: 88,
              child: GRoundedImage(
                imageUrl: GImages.productImageAssault1,
                applyImageRadius: true,
                isNetworkImage: true,
                borderRadius: 13,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 7.5),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10),
                    Flexible(
                      child: ProductPriceText(
                        price: '1000',
                        size: 19.5,
                        maxLines: 1,
                      ),
                    ),
                    Flexible(
                      child: ProductTitleText(
                        title: 'AK-47',
                        smallSize: true,
                        maxLines: 1,
                      ),
                    ),
                    Flexible(
                      child:
                      RatingWithOneStar(rating: 4.5, reviewCount: 199)
                    ),
                    //BrandTitleWithVerifiedIcon(title: 'Kalashnikov', brandTextSizeSmall: true),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}