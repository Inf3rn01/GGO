import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/app_bar/market_appbar.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/primary_header_containers.dart';
import 'package:ggo/common/widgets/layouts/grid_layout.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ggo/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ggo/common/widgets/texts/section_heading.dart';
import 'package:ggo/features/personalization/controlers/user_controller.dart';
import 'package:ggo/utils/constants/images_strings.dart';
import 'package:ggo/utils/constants/sizes.dart';
import 'widgets/home_categories.dart';
import 'package:ggo/features/shop/screens/home/widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      body: ListView(
        children: [
          /// Header
          const GPrimaryHeaderContainer(
            child: Column(
              children: [
                /// Appbar
                MarketAppBar(),
                
                /// Seachbar
                GSearchContainer(text: 'Seach in store'),

                /// Categories
                Padding(
                  padding: EdgeInsets.only(left: GSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        GSectionsHeading(title: 'Popular categories', textSize: 20.5, showActionButton: false),
                        
                        SizedBox(height: 8),

                        /// Categories
                        GHomeCategories(),
                        
                      ],
                    ),
                ),

                SizedBox(height: 65),
              
              ],
            ),
          ),

          /// Body
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15),
             child: Column(
              children: [
                /// Promo Slider
                const GPromoSlider(),
                const SizedBox(height: 30),

                /// Heading
                const GSectionsHeading(title: 'Selected for you', textSize: 19, showActionButton: false),

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