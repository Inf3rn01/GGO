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
              CartItems(showAddRemoveButtons: false),
              const SizedBox(height: GSizes.spaceBtwSections),
              
              /// Billing section
              GRoundedContainer(
                showBorder: true,
                borderColor: GColors.borderPrimary.withOpacity(0.2),
                padding: const EdgeInsets.all(GSizes.md),
                backgroundColor: darkTheme ? GColors.black : GColors.grey,
                child: const Column(
                  children: [

                    /// Pricing
                    BillingAmountSection(),
                    SizedBox(height: 8),

                    Divider(),
                    //SizedBox(height: GSizes.spaceBtwItems / 10),

                    /// Payment Methods
                    BillingPaymentSection(),
                    SizedBox(height: GSizes.spaceBtwItems),

                    Divider(),

                    /// Address Section
                    BillingAddressSection(),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    
      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(GSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: 'assets/gifs/delivery_truck.gif',
              title: 'Payment Success!',
              subTitle: 'Your item will be shipped soon!',
              onPressed: () => Get.offAll(()=> const NavigationMenu()))
          ), child: const Text('Checkout', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
