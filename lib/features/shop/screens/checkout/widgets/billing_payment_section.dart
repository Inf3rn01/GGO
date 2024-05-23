import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ggo/common/widgets/texts/section_heading.dart';
import 'package:ggo/utils/constants/images_strings.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        GSectionsHeading(title: 'Payment Methods', textSize: 20, buttonTitle: 'change', onPressed: (){}),
        const SizedBox(height: GSizes.spaceBtwItems),
        Row(
          children: [
            GRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: darkTheme ? GColors.light : GColors.white,
              padding: const EdgeInsets.all(GSizes.sm),
              child: const Image(image: AssetImage(GImages.paypal), fit: BoxFit.contain),
            ),
            const SizedBox(width: GSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),

          ],
        )
      ],
    );
  }
}