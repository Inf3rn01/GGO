import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/app_bar/auth_appbar.dart';
import 'package:ggo/features/shop/models/category_models.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../models/product_models.dart';


class SubCategoriesScreen extends StatelessWidget {
  final CategoryModel category;
  final List<ProductModel> products;

  const SubCategoriesScreen({super.key, required this.category, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(showBackArrow: true, title: Text(category.name)),
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
                      onChanged: (value) {},
                      items: ['Name', 'Higher price', 'Lower price', 'Newest', 'Popularity']
                          .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                          .toList(),
                    )
                  ],
                ),

                const SizedBox(height: 30),

                /// Products
                Obx(
                  () {
                    if (products.isEmpty) {
                      return Center(child: Text('No data found!', style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.white)));
                    }
                    return GGridLayout(
                      itemCount: products.length,
                      itemBuiler: (_, index) => GProductCardVertical(product: products[index]),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}