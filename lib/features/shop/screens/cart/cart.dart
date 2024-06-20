import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/features/personalization/controlers/user_controller.dart';
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
    final userController = UserController.instance;
    final CartController cartController = Get.put(CartController());
    final darkTheme = GHelperFunctions.isDarkMode(context);
    final productController = ProductController.instance;
    final userId = userController.user.value.id;

    if (userId.isNotEmpty) {
      cartController.fetchCartItems(userId);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
        actions: [
          IconButton(
            icon: Icon(EvaIcons.trash_2_outline, size: 23, color: darkTheme ? GColors.light : GColors.dark),
            onPressed: () async {
              await cartController.clearCart(userId);
              cartController.calculateTotalCartPrice();
              cartController.fetchCartItems(userId);
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
                      itemCount: cartController.cartItems.first.productId!.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartController.cartItems.first;
                        final productId = cartItem.productId![index];
                        final product = productController.getProductById(productId);

                        return Card(
                          color: Colors.transparent,
                          elevation: 0,
                          margin: const EdgeInsets.all(5),
                          child: ListTile(
                            onTap: () {
                              Get.to(() => ProductDetailScreen(product: product));
                            },
                            leading: SizedBox(
                              width: 56,
                              height: 56,
                              child: GRoundedImage(
                                imageUrl: product.images?.isNotEmpty == true ? product.images!.first : '',
                                borderRadius: 10,
                              ),
                            ),
                            title: Text(product.title, style: TextStyle(fontSize: 16, color: darkTheme ? GColors.light : GColors.dark)),
                            subtitle: Text('\$${product.price} x ${cartItem.quantity![index]}', style: TextStyle(fontSize: 14.5, color: darkTheme ? GColors.light : GColors.dark)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove_circle, size: 20, color: darkTheme ? GColors.light : GColors.dark),
                                  onPressed: () {
                                    cartController.decreaseQuantity(userId, productId);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.add_circle, size: 20, color: darkTheme ? GColors.light : GColors.dark),
                                  onPressed: () {
                                    cartController.increaseQuantity(userId, productId);
                                  },
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
                    'Оформить',
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