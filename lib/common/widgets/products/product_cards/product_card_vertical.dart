import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/images/rounded_image.dart';
import 'package:ggo/common/widgets/texts/product_title_text.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../../../utils/constants/colors.dart';
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
      onTap: () =>  Get.to(() => const ProductDetailScreen()),
      child: Column(
        children: [
          GRoundedContainer(
            height: 240,
            backgroundColor: dark ? const Color(0xFF202020) : const Color(0xFFF0F0F0),

            child: const Column(
              children: [
                //Thumbnail Image
                GRoundedImage(imageUrl: GImages.productImageAssault1, applyImageRadius: true, isNetworkImage: true, borderRadius: 13),
                
                /// Details
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// Price
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: GProductPriceText(price: '1000',),
                      )
                    ],
                  ),
                ),
                
                Spacer(),

                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: BrandTitleWithVerifiedIcon(title: 'Kalashnikov', brandTextSizeSmall: true)
                  )
                ],
              ),
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: GProductTitleText(title: 'AK-47', smallSize: true),
                      ),
                  ],
                ),
                SizedBox(height: 5)
              ],
            ),
          ),
       ],
      ),
    );
  }
}