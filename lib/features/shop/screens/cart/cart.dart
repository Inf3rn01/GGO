import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ggo/features/shop/screens/checkout/checkout.dart';
import '../../../../common/widgets/app_bar/market_appbar.dart';
import '../../../../utils/constants/colors.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MarketAppBar(),
      body: const Padding(
        padding: EdgeInsets.all(7),
    
        /// Items in cart
        child: CartItems(),
      ),

      /// Checkout button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        child: SizedBox(
          height: 56,
          child: ElevatedButton(
            onPressed: () => Get.to(()=> const CheckoutScreen()),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Checkout', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
                const SizedBox(height: 2),
                Text('\$5000', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: GColors.grey.withOpacity(0.8))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
