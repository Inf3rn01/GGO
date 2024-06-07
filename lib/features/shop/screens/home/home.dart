import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/app_bar/market_appbar.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/primary_header_containers.dart';
import 'package:ggo/common/widgets/layouts/grid_layout.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ggo/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ggo/common/widgets/texts/section_heading.dart';
import 'package:ggo/features/personalization/controlers/user_controller.dart';
import 'package:ggo/utils/constants/sizes.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import '../../controlers/product_controller.dart';
import 'widgets/home_categories.dart';
import 'package:ggo/features/shop/screens/home/widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller = Get.put(UserController());
    final controller = Get.put(ProductController());
    final darkTheme = GHelperFunctions.isDarkMode(context);
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
             padding: const EdgeInsets.symmetric(horizontal: 10),
             child: Column(
              children: [
                /// Promo Slider
                const GPromoSlider(),
                const SizedBox(height: 30),

                /// Heading
                const GSectionsHeading(title: 'Selected for you', textSize: 20, showActionButton: false),

                /// Products
                Obx(
                  (){
                    if(controller.featuredProducts.isEmpty) {
                      return Center(child: Text('No data found!', style: TextStyle(color: darkTheme ? Colors.white.withOpacity(0.65) : Colors.white.withOpacity(0.65))));
                    }
                    return GGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuiler: (_, index) => GProductCardVertical(product: controller.featuredProducts[index])
                    );
                  }
                )
              ],
             ),
          ),
        ],
      ),
    );
  }
}