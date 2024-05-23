import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GSectionsHeading(title: 'Delivery point', textSize: 20, buttonTitle: 'change', onPressed: (){}),
        const Text('Dan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: GSizes.spaceBtwItems / 3),
      
        const Row(
          children: [
            Icon(Clarity.phone_handset_line, color: GColors.grey, size: 19),
            SizedBox(width: GSizes.spaceBtwItems / 2),
            Text('+79682834638', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)
          ],
        ),

        const SizedBox(height: GSizes.spaceBtwItems / 3),

        const Row(
          children: [
            Icon(Icons.location_history, color: GColors.grey, size: 20),
            SizedBox(width: GSizes.spaceBtwItems / 2),
            Expanded(child: Text('Russia, Volgograd, 64-Army, 63', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),))
          ],
        ),

      ],
    );
  }
}