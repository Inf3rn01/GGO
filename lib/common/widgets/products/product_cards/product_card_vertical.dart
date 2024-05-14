import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/images/rounded_image.dart';
import 'package:ggo/common/widgets/texts/product_title_text.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';

import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../texts/brand_title_text_with_verify_icon.dart';
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
        height: 240,
        backgroundColor: dark ? const Color(0xFF202020) : const Color(0xFFF0F0F0),
        child: Stack(
          children: [
            const Positioned.fill(
              bottom: 90,
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
                //height: GHelperFunctions.screenHeight() / 2, // Take up half the height of the container
                padding: const EdgeInsets.all(10.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end, // Align content to the bottom
                  children: [
                    GProductPriceText(price: '1000'),
                    GProductTitleText(title: 'AK-47', smallSize: true),
                    BrandTitleWithVerifiedIcon(brandImageAsset: GImages.lightAppLogo, isNetworkImage: false, title: 'Kalashnikov', brandTextSizeSmall: true),
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