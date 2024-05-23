import 'package:flutter/material.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final  bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    return GRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(16),
      backgroundColor: selectedAddress ? GColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor:  selectedAddress
        ? Colors.transparent 
        : darkTheme
          ? GColors.darkerGrey
          : GColors.grey,
      margin: const EdgeInsets.only(bottom: GSizes.spaceBtwItems),
      child: Stack(
        children: [
          Icon(
            selectedAddress ? Iconsax.tick_circle_bold : null,
            color: selectedAddress
              ? darkTheme
                ? GColors.light
                :GColors.dark
              : null,
            ),
          Positioned(
            top: 3,
            right: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Russia, Volgograd, 64-Army, 63',
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: GSizes.sm / 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}