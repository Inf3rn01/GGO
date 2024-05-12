import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/images/circular_image.dart';
import 'package:ggo/common/widgets/images/rounded_image.dart';
import 'package:ggo/common/widgets/texts/brand_title_text_with_verify_icon.dart';
import 'package:ggo/common/widgets/texts/product_price_text.dart';
import 'package:ggo/common/widgets/texts/product_title_text.dart';
import 'package:ggo/utils/constants/enums.dart';
import 'package:ggo/utils/constants/images_strings.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({
    super.key,
    });

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// Price
        Row(
          children: [
            GProductPriceText(price: '1000', isLarge: true)
          ],
        ),

        SizedBox(height: GSizes.spaceBtwItems / 1.5),

        /// Title
        GProductTitleText(title: 'AK-47', smallSize: false),
        
        SizedBox(height: GSizes.spaceBtwItems / 1.5),
        
        /// Brand
        Row(
          children: [
            GRoundedImage(imageUrl: GImages.lightAppLogo, width: 20, height: 20, borderRadius: 5, backgroundColor: Colors.transparent,),
            SizedBox(width: GSizes.xs),
            BrandTitleWithVerifiedIcon(title: 'Kalashnikov', brandIconSizeSmall: false)
          ],
        ),
        

      ],
    );
  }
}