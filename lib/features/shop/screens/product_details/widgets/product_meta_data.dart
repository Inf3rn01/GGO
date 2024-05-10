import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/images/circular_image.dart';
import 'package:ggo/common/widgets/texts/brand_title_text_with_verify_icon.dart';
import 'package:ggo/common/widgets/texts/product_price_text.dart';
import 'package:ggo/common/widgets/texts/product_title_text.dart';
import 'package:ggo/utils/constants/enums.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// Price
        const Row(
          children: [
            GProductPriceText(price: '1000', isLarge: true)
          ],
        ),

        const SizedBox(height: GSizes.spaceBtwItems / 1.5),

        /// Title
        const GProductTitleText(title: 'AK-47', smallSize: false),
        
        const SizedBox(height: GSizes.spaceBtwItems / 1.5),
        
        /// Brand
        Row(
          children: [
            Flag(Flags.russia, size: 21.5),
            const SizedBox(width: GSizes.xs),
            const BrandTitleWithVerifiedIcon(title: 'Kalashnikov', brandIconSizeSmall: false)
          ],
        ),
        

      ],
    );
  }
}