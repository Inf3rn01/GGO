import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ggo/common/widgets/texts/brand_title_text_with_verify_icon.dart';
import 'package:ggo/common/widgets/texts/product_price_text.dart';
import 'package:ggo/common/widgets/texts/product_title_text.dart';
import 'package:ggo/utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price
        GProductPriceText(price: '1000', isLarge: true),
        SizedBox(height: GSizes.spaceBtwItems / 10),
        /// Title
        GProductTitleText(title: 'Aвтомат Калашникова-47', smallSize: false, maxLines: 3,),
        //SizedBox(height: GSizes.spaceBtwItems / 2),
        // /// Brand
        // BrandTitleWithVerifiedIcon(
        //   brandImageAsset: GImages.lightAppLogo,
        //   isNetworkImage: false,
        //   title: 'Kalashnikov',
        //   verifyIconSizeSmall: false,
        // ),
      ],
    );
  }
}