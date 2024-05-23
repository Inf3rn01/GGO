import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ggo/common/widgets/texts/product_price_text.dart';
import 'package:ggo/common/widgets/texts/product_title_text.dart';


class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /// Price
        Align(
          alignment: Alignment.centerLeft,
          child: ProductPriceText(price: '1000', size: 21.5),
        ),
        
        /// Title
        Align(
          alignment: Alignment.centerLeft,
          child: ProductTitleText(title: 'AK-47', smallSize: false, maxLines: 2),
        ),
        //SizedBox(height: GSizes.spaceBtwItems / 2),
        // /// Brand
        // Align(
        //   alignment: Alignment.centerLeft,
        //   child: BrandTitleWithVerifiedIcon(
        //     brandImageAsset: GImages.lightAppLogo,
        //     isNetworkImage: false,
        //     title: 'Kalashnikov',
        //     verifyIconSizeSmall: false,
        //   ),
        // ),
      ],
    );
  }
}