import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/app_bar/tab_bar.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ggo/features/shop/screens/product_details/widgets/feature_product.dart';
import 'package:ggo/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:ggo/utils/constants/images_strings.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../common/widgets/app_bar/product_appbar.dart';
import 'widgets/product_slider.dart';
import 'widgets/rating_all_stars_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  void onSlidePressed(int index) {
    print('Изображение $index было нажато');
  }

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                GProductSlider(
                  banners: const [GImages.productImageAssault1, GImages.productImage2],
                  applyImageRadius: true,
                  onPressed: onSlidePressed,
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
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    
                    ProductMetaData(),
                    SizedBox(height: 4),
                    
                    RatingWithAllStars(rating: 4, reviewCount: 199),
                    SizedBox(height: 9),
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
                                    child: const SingleChildScrollView(
                                      child: Text(
                                        'Автомат АК-47, официально известный как Автомат Калашникова, представляет собой газовую штурмовую винтовку под патрон 7,62×39 мм. Популярность этой модели и ее модификаций во всем мире объясняется их надежностью в суровых условиях эксплуатации, низкой стоимостью производства, доступностью практически в любом географическом регионе и простотой использования.',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                                // Feature
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: GRoundedContainer(
                                    backgroundColor: darkTheme ? Colors.black.withOpacity(0.28) : GColors.grey,
                                    padding: const EdgeInsets.all(13.0),
                                    child: const SingleChildScrollView(
                                      child: FeaturesProduct(
                                        features: [
                                          {'title': 'Country of manufacture', 'value': 'Russia'},
                                          {'title': 'Weight', 'value': '5 kg'},
                                          {'title': 'length', 'value': '870 mm'},
                                          {'title': 'cartridge', 'value': '7,62x39 mm'},
                                          {'title': 'departure speed', 'value': '715 m/s'},
                                          {'title': 'firing range', 'value': '800 m'},
                                        ],
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