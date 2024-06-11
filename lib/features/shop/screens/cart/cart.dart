import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/features/shop/models/product_models.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../common/widgets/images/rounded_image.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controlers/cart_controller.dart';
import '../../controlers/product_controller.dart';
import '../checkout/checkout.dart';
import '../product_details/product_detail.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    final darkTheme = GHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
         actions: [
          IconButton(
            icon: Icon(EvaIcons.trash_2_outline, color: darkTheme ? GColors.light : GColors.dark),
            onPressed: () {
              cartController.cartItems.clear();
              cartController.calculateTotalCartPrice();
            },
          ),
        ],
      ),
       body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(7),
            child: Obx(
              () => cartController.cartItems.isEmpty
                  ? const Center(child: Text('Корзина пуста'))
                  : ListView.builder(
                      itemCount: cartController.cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartController.cartItems[index];
                        return Card(
                          color: Colors.transparent,
                          elevation: 0,
                          margin: const EdgeInsets.all(5),
                          child: ListTile(
                            onTap: () {
                              final ProductController productController = ProductController.instance;
                              final ProductModel product = productController.getProductById(cartItem.productId);
                              Get.to(() => ProductDetailScreen(product: product));
                            },
                            leading: GRoundedImage(
                              imageUrl: cartItem.image ?? '',
                              borderRadius: 10,
                            ),
                            title: Text(cartItem.title, style: TextStyle(fontSize: 16, color: darkTheme ? GColors.light : GColors.dark)),
                            subtitle: Text('\$${cartItem.price} x ${cartItem.quantity}', style: TextStyle(fontSize: 14.5, color: darkTheme ? GColors.light : GColors.dark)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove_circle, size: 20, color: darkTheme ? GColors.light : GColors.dark),
                                  onPressed: () => cartController.decreaseQuantity(cartItem),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add_circle, size: 20, color: darkTheme ? GColors.light : GColors.dark),
                                  onPressed: () => cartController.increaseQuantity(cartItem),
                                ),
                              ],
),
                          ),
                        );
                      },
                    ),
            ),
          );
        },
      ),
bottomNavigationBar: Obx(
  () => cartController.cartItems.isEmpty
      ? const SizedBox.shrink()
      : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          child: SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const CheckoutScreen()),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Checkout',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 2),
                  Obx(
                    () => Text(
                      '\$${cartController.totalCartPrice.value.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: GColors.grey.withOpacity(0.8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}