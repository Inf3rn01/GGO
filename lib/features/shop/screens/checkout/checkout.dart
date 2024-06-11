import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/app_bar/auth_appbar.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ggo/common/widgets/success_screen/success_screen.dart';
import 'package:ggo/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ggo/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ggo/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ggo/navigation_menu.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:ggo/utils/constants/images_strings.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/billling_amount_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const AuthAppBar(showBackArrow: true, title: Text('Order review')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              /// Items in cart
              // ignore: prefer_const_constructors
              // ListView(
              //   shrinkWrap: true,
              //   children: const [
              //     GRoundedContainer(child: CartItems(showAddRemoveButtons: false))
              //   ]
              // ),
              // const SizedBox(height: GSizes.spaceBtwSections),
              
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
                    const SizedBox(height: GSizes.spaceBtwItems),

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
                            onPressed: () => Get.to(
                              () => SuccessScreen(
                                image: GImages.deliveryTruck,
                                title: 'Payment Success!',
                                subTitle: 'Your item will be shipped soon!',
                                onPressed: () => Get.offAll(()=> const NavigationMenu())
                              )
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: GColors.white,
                              backgroundColor: GColors.primary,
                              padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 11),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'Checkout',
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
