import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/features/shop/models/product_models.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../common/widgets/app_bar/product_appbar.dart';
import '../../../../common/widgets/app_bar/tab_bar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../controlers/cart_controller.dart';
import '../../controlers/product_controller.dart';
import '../product_reviews/widgets/raiting/rating_all_stars_widget.dart';
import 'widgets/feature_product.dart';
import 'widgets/product_meta_data.dart';
import 'widgets/product_slider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final CartController cartController = Get.put(CartController());
    final darkTheme = GHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: darkTheme ? GColors.dark : GColors.softGrey,
          border: Border(
            top: BorderSide(color: GColors.borderPrimary.withOpacity(0.3), width: 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(FontAwesome.minus_solid, size: 22, color: darkTheme ? GColors.softGrey : GColors.dark),
                    onPressed: () {
                      if (cartController.productQuantityCart.value > 1) {
                        cartController.productQuantityCart.value--;
                      }
                    },
                  ),
                  Obx(() => Text(cartController.productQuantityCart.value.toString(), style: const TextStyle(fontSize: 18))),
                  IconButton(
                    icon: Icon(FontAwesome.plus_solid, size: 21, color: darkTheme ? GColors.softGrey : GColors.dark),
                    onPressed: () {
                      cartController.productQuantityCart.value++;
                    },
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                ),
                onPressed: () {
                  cartController.addToCart(product);
                },
                child: const Text('Добавить'),
              ),
            ],
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    GProductSlider(
                      product: product.images!,
                      showCounter: false,
                    ),
                    ProductAppBar(
                      leadingIcon: OctIcons.arrow_left,
                      leadingOnPressed: () => Get.back(),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
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
                        const RatingWithAllStars(rating: 4.0, reviewCount: 1, showRating: false),
                        const SizedBox(height: 9),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
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
                                  Tab(text: 'Описание'),
                                  Tab(text: 'Особенности'),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    // Description
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
                                    // Features
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: GRoundedContainer(
                                        backgroundColor: darkTheme ? Colors.black.withOpacity(0.28) : GColors.grey,
                                        padding: const EdgeInsets.all(13.0),
                                        child: SingleChildScrollView(
                                          child: FeaturesProduct(features: product.productFeatures ?? []),
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

              const SizedBox(height: 8),
              
              ],
            ),
          );
        },
      ),
    );
  }
}
