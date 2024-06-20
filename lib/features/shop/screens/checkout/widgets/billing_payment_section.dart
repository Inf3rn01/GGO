import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/texts/section_heading.dart';
import 'package:ggo/features/shop/screens/wallet/wallet.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../personalization/controlers/user_controller.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();
    return Column(
      children: [
        GSectionsHeading(title: 'Баланс в кошельке', textSize: 20, buttonTitle: 'пополнить', onPressed: () => Get.to(() => WalletScreen())),
        const SizedBox(height: GSizes.spaceBtwItems / 4),
        Obx(() {
          return Row(
            children: [
              Text(
                '\$${double.tryParse(userController.user.value.balance)?.toStringAsFixed(2) ?? "0.00"}',
                style: const TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
              ),
            ],
          );
        }),
      ],
    );
  }
}