import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/features/personalization/controlers/address_controller.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/address_model.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final darkTheme = GHelperFunctions.isDarkMode(context);

    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;
        return InkWell(
          onTap: onTap,
          child: GRoundedContainer(
            height: 70,
            width: double.infinity,
            showBorder: true,
            padding: const EdgeInsets.all(10),
            backgroundColor: selectedAddress ? GColors.primary.withOpacity(0.5) : Colors.transparent,
            borderColor: selectedAddress
                ? Colors.transparent
                : darkTheme
                    ? GColors.darkerGrey
                    : GColors.grey,
            margin: const EdgeInsets.only(bottom: GSizes.spaceBtwItems),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (selectedAddress)
                  Icon(
                    Iconsax.tick_circle_bold,
                    color: darkTheme ? GColors.light : GColors.dark,
                  ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    address.toString(),
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
