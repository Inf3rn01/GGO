import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/features/personalization/controlers/user_controller.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../personalization/controlers/address_controller.dart';
import '../../../../personalization/screens/address/address.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = UserController.instance;
    final AddressController addressController = Get.put(AddressController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GSectionsHeading(title: 'Место доставки', textSize: 20, buttonTitle: 'изменить', onPressed: () => Get.to(() => const UserAddressScreen())),

        const SizedBox(height: GSizes.spaceBtwItems / 10),

        Row(
          children: [
            const Icon(Clarity.user_line, color: GColors.grey, size: 19),
            const SizedBox(width: GSizes.spaceBtwItems / 2),
            Text(userController.user.value.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),

        const SizedBox(height: GSizes.spaceBtwItems / 4),
      
        Row(
          children: [
            const Icon(Clarity.phone_handset_line, color: GColors.grey, size: 19),
            const SizedBox(width: GSizes.spaceBtwItems / 2),
            Text(userController.user.value.phoneNumber, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)
          ],
        ),

        const SizedBox(height: GSizes.spaceBtwItems / 4),

        Row(
          children: [
            const Icon(Iconsax.truck_outline, color: GColors.grey, size: 20),
            const SizedBox(width: GSizes.spaceBtwItems / 2),
            Expanded(
              child: Obx(() {
                final address = addressController.selectedAddress.value;
                if (address.id.isEmpty) {
                  return const Text(
                    'Адрес не выбран',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  );
                }
                return Text(
                  '${address.country}, ${address.city}, ${address.street}, ${address.house}, ${address.apartment}',
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}