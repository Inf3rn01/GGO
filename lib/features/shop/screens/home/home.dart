// ignore_for_file: library_private_types_in_public_api
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userController = Get.put(UserController());
  final controller = Get.put(ProductController());
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: ListView(
        children: [
          /// Header
          GPrimaryHeaderContainer(
            child: Column(
              children: [
                /// Appbar
                const MarketAppBar(),

                const SizedBox(height: 10),

                /// Seachbar
                SearchContainer(
                  text: 'Поиск',
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                      controller.filterProducts(searchQuery);
                    });
                  },
                ),

                /// Categories
                const Padding(
                  padding: EdgeInsets.only(left: GSizes.defaultSpace),
                  child: Column(
                    children: [
                      /// Heading
                      GSectionsHeading(title: 'Популярные категории', textSize: 23.5, showActionButton: false),
                      SizedBox(height: 8),
                      /// Categories
                      GHomeCategories(),
                    ],
                  ),
                ),

                const SizedBox(height: 65),
              ],
            ),
          ),

          /// Body
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                /// Promo Slider
                const GPromoSlider(),
                const SizedBox(height: 30),

                /// Heading
                const GSectionsHeading(title: 'Выбрали для вас', textSize: 23, showActionButton: false),

                /// Products
                Obx(
                  () {
                    if (controller.product.isEmpty) {
                      return Center(child: Text('Товары не найдены!', style: TextStyle(color: darkTheme ? Colors.white.withOpacity(0.65) : Colors.white.withOpacity(0.65))));
                    }
                    return GGridLayout(
                      itemCount: controller.product.length,
                      itemBuilder: (_, index) => GProductCardVertical(product: controller.product[index]),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}