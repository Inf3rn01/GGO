import 'package:flutter/material.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        
        /// Основной контейнер
        Container(
          padding: const EdgeInsets.symmetric(horizontal: GSizes.defaultSpace / 2, vertical: GSizes.defaultSpace / 3.5),
          decoration: BoxDecoration(
            color: darkTheme ? GColors.dark : GColors.grey,
            // borderRadius: const BorderRadius.only(
            //   topLeft: Radius.circular(GSizes.cardRadiusLg),
            //   topRight: Radius.circular(GSizes.cardRadiusLg),
            // ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(EvaIcons.minus, color: Colors.blue, size: 28)),
                  const SizedBox(width: 10),
                  const Text('1', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  const SizedBox(width: 10),
                  IconButton(onPressed: () {}, icon: Icon(EvaIcons.plus, color: Colors.red.withOpacity(0.9), size: 26)),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: GColors.primary.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.all(14),
                ),
                child: const Row(
                  children: [
                    Text('Add', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    SizedBox(width: 12),
                    Text('|'),
                    SizedBox(width: 12),
                    ProductPriceText(price: '1000', size: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Полоска наверху контейнера
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 1, // Высота полоски
            decoration: BoxDecoration(
              color: GColors.borderPrimary.withOpacity(0.2),
            ),
          ),
        ),
      ],
    );
  }
}