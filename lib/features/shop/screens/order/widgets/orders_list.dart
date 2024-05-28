import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../../utils/constants/sizes.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) => const SizedBox(height: GSizes.spaceBtwItems / 1.5),
      itemBuilder: (_, index) => GRoundedContainer(
        showBorder: true,
        borderColor: GColors.borderPrimary.withOpacity(0.2),
        backgroundColor: darkTheme ? GColors.dark : GColors.light,
        padding: const EdgeInsets.only(right: GSizes.sm, left: GSizes.sm, bottom: GSizes.sm, top: GSizes.sm / 1.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
      
            /// Row 1
            Row(
              children: [
                
                ///Icon
                const Icon(Iconsax.truck_outline),
                const SizedBox(width: GSizes.spaceBtwItems / 2),
      
                ///Status & Date
                const Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing', style: TextStyle(fontSize: 15.5, color: GColors.primary, fontWeight: FontWeight.w700)),
                      Text('24 May 2024', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
      
                /// Icon Arrow
                IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_3_outline, size: 17, color: GColors.grey.withOpacity(0.65)))
              ],
            ),
      
            const SizedBox(height: GSizes.spaceBtwItems / 1.5),
      
            /// Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      
                      ///Icon
                      const Icon(Iconsax.tag_outline),
                      const SizedBox(width: GSizes.spaceBtwItems / 2),
                  
                      ///Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order', style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w500, color: GColors.grey.withOpacity(0.65))),
                            const Text('[#256f2]', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              
                Expanded(
                  child: Row(
                    children: [
                      
                      ///Icon
                      const Icon(Iconsax.calendar_1_outline),
                      const SizedBox(width: GSizes.spaceBtwItems / 2),
                  
                      ///Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping date', style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w500, color: GColors.grey.withOpacity(0.65))),
                            const Text('25 May 2024', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      
              ],
            ),
          ],
        ),
      ),
    );
  }
}