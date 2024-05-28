import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [

        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SubTotal', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
            Text('\$2000', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
          ],
        ),

        SizedBox(height: GSizes.spaceBtwItems / 4),

        /// Shipping
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping fee', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
            Text('Free', style: TextStyle(fontSize: 15, color: Colors.green)),
          ],
        ),

        SizedBox(height: GSizes.spaceBtwItems / 4),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order total', style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w500)),
            Text('\$2000', style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w500)),
          ],
        ),

      ],
    );
  }
}