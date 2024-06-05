import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/app_bar/tab_bar.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ggo/features/shop/models/product_models.dart';
import 'package:ggo/features/shop/screens/product_details/widgets/feature_product.dart';
import 'package:ggo/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../common/widgets/app_bar/product_appbar.dart';
import 'widgets/bottom_add_to_cart.dart';
import 'widgets/product_slider.dart';
import '../product_reviews/widgets/raiting/rating_all_stars_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    //final controller = ProductController.instance;
    final darkTheme = GHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                GProductSlider(
                  product: product.images!,
                  applyImageRadius: true,
                ),
                ProductAppBar(
                  leadingIcon: OctIcons.arrow_left,
                  leadingOnPressed: () => Get.back(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GRoundedContainer(
              showBorder: true,
              borderColor: GColors.borderPrimary.withOpacity(0.1),
              backgroundColor: darkTheme ? GColors.black : GColors.grey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    ProductMetaData(product: product),
                    const SizedBox(height: 4),
                    const RatingWithAllStars(rating: 4.5, reviewCount: 199, showRating: false),
                    const SizedBox(height: 9),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            GRoundedContainer(
              showBorder: true,
              borderColor: GColors.borderPrimary.withOpacity(0.1),
              backgroundColor: darkTheme ? GColors.black : GColors.grey,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    height: 250,
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          const GTabBar(
                            tabs: [
                              Tab(text: 'Description'),
                              Tab(text: 'Features'),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                ///Description
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: GRoundedContainer(
                                    backgroundColor: darkTheme ? Colors.black.withOpacity(0.28) : GColors.grey,
                                    padding: const EdgeInsets.only(left: 11, right: 11, top: 6, bottom: 6),
                                    child: SingleChildScrollView(
                                      child: Text(
                                        product.description ?? '',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                                
                                /// Feature
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: GRoundedContainer(
                                    backgroundColor: darkTheme ? Colors.black.withOpacity(0.28) : GColors.grey,
                                    padding: const EdgeInsets.all(13.0),
                                    child: SingleChildScrollView(
                                      child: FeaturesProduct(
                                        features: product.productFeatures ?? [],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}