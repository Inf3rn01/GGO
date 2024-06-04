import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/app_bar/auth_appbar.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../utils/constants/images_strings.dart';
import '../home/widgets/promo_slider.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar(showBackArrow: true, title: Text('Assault')),
      body: ListView(
        children: [
          /// Body
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15),
             child: Column(
              children: [

                const SizedBox(height: 10),
                
                /// Dropdown
                Column(
                  children: [
                    DropdownButtonFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort_outline)),
                      onChanged: (value){},
                      items:['Name', 'Higher price', 'Lower price', 'Newest', 'Popularity'].map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),
                    )
                  ],
                ),

                const SizedBox(height: 30),

                // /// Promo Slider
                // const GPromoSlider(banners: [GImages.promoBanner1, GImages.productImageAssault2]),
                // const SizedBox(height: 15),

                /// Products
                GGridLayout(itemCount: 6, mainAxisExtent: 248, itemBuiler: (_, index) => const GProductCardVertical())
              ],
             ),
          ),
        ],
      ),
    );
  }
}