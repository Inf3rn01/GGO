import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../controlers/cart_controller.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = CartController.instance;
    return Column(
      children: [

        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Стоймость товаров', style: TextStyle(fontSize: 15.3, fontWeight: FontWeight.w400)),
            Text('\$${cartController.totalCartPrice.value.toStringAsFixed(2)}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
          ],
        ),

        const SizedBox(height: GSizes.spaceBtwItems / 4),

        /// Shipping
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Доставка', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
            Text('Бесплатно', style: TextStyle(fontSize: 15, color: Colors.green)),
          ],
        ),

        const SizedBox(height: GSizes.spaceBtwItems / 4),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Итог', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            Text('\$${cartController.totalCartPrice.value.toStringAsFixed(2)}', style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }
}