import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/app_bar/auth_appbar.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ggo/features/personalization/controlers/order_controller.dart';
import 'package:ggo/features/personalization/controlers/user_controller.dart';
import 'package:ggo/features/shop/controlers/cart_controller.dart';
import 'package:ggo/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ggo/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ggo/navigation_menu.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:ggo/utils/popups/loaders.dart';
import '../../../../common/widgets/success_screen/success_order_screen.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/order_model.dart';
import 'widgets/billling_amount_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    final CartController cartController = CartController.instance;
    final UserController userController = UserController.instance;
    final OrderController orderController = Get.put(OrderController());

    return Scaffold(
      appBar: const AuthAppBar(showBackArrow: true, title: Text('Оформление заказа')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              
              /// Billing section
              GRoundedContainer(
                showBorder: true,
                borderColor: GColors.borderPrimary.withOpacity(0.2),
                padding: const EdgeInsets.all(GSizes.md),
                backgroundColor: darkTheme ? GColors.black : GColors.grey,
                child: Column(
                  children: [

                    /// Pricing
                    const BillingAmountSection(),
                    const SizedBox(height: 8),

                    const Divider(),

                    /// Payment Methods
                    const BillingPaymentSection(),
                    const SizedBox(height: 10),

                    const Divider(),

                    /// Address Section
                    const BillingAddressSection(),

                    ///Checkout Button
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: GSizes.defaultSpace / 2, left: GSizes.defaultSpace / 2, bottom: GSizes.defaultSpace / 4.5, top: GSizes.defaultSpace * 1.2),
                          child: ElevatedButton(
                            onPressed: () async {
                              final userBalance = double.tryParse(userController.user.value.balance) ?? 0.0;
                              final totalCartPrice = cartController.totalCartPrice.value;
                              if (userBalance < totalCartPrice) {
                                Loaders.errorSnackBar(title: 'Недостаточно средств', message: 'На вашем балансе недостаточно средств для оформления заказа.');
                                return;
                              }

                              OrderModel order = OrderModel.fromControllers(userController, cartController);
                              await orderController.createOrder(order);
                              await cartController.clearCart(userController.user.value.id);
                              await userController.deductBalance(totalCartPrice);

                              Get.to(
                                () => SuccessOrderScreen(
                                  title: 'Успешная оплата товара!',
                                  subTitle: 'Ваш заказ скоро будет доставлен!',
                                  onPressed: () => Get.offAll(() => const NavigationMenu()),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: GColors.white,
                              backgroundColor: GColors.primary,
                              padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 11),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'Оформить',
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
