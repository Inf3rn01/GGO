import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/features/personalization/controlers/user_controller.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
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
    final darkTheme = GHelperFunctions.isDarkMode(context);
    final UserController userController = UserController.instance;
    final AddressController addressController = Get.put(AddressController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GSectionsHeading(title: 'Место доставки', textSize: 20, buttonTitle: 'изменить', onPressed: () => Get.to(() => const UserAddressScreen())),

        const SizedBox(height: GSizes.spaceBtwItems / 10),

        Row(
          children: [
            Icon(Clarity.user_line, color: darkTheme ? GColors.grey : GColors.darkerGrey, size: 19),
            const SizedBox(width: GSizes.spaceBtwItems / 2),
            Text(userController.user.value.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ],
        ),

        const SizedBox(height: GSizes.spaceBtwItems / 4),
      
        Row(
          children: [
            Icon(Clarity.phone_handset_line, color: darkTheme ? GColors.grey : GColors.darkerGrey, size: 19),
            const SizedBox(width: GSizes.spaceBtwItems / 2),
            Text(userController.user.value.phoneNumber, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)
          ],
        ),

        const SizedBox(height: GSizes.spaceBtwItems / 4),

        Row(
          children: [
            Icon(Iconsax.truck_outline, color: darkTheme ? GColors.grey : GColors.darkerGrey.withOpacity(0.95), size: 20),
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