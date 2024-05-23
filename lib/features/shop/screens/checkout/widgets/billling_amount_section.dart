import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SubTotal', style: Theme.of(context).textTheme.bodyLarge),
            Text('\$2000', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),

        const SizedBox(height: GSizes.spaceBtwItems / 4),

        /// Shipping
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping fee', style: Theme.of(context).textTheme.bodyLarge),
            const Text('Free', style: TextStyle(fontSize: 15, color: Colors.green)),
          ],
        ),

        const SizedBox(height: GSizes.spaceBtwItems / 4),

        /// Order Total
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order total', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            Text('\$2000', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          ],
        ),

      ],
    );
  }
}