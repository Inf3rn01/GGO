import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/app_bar/auth_appbar.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../controlers/product_controller.dart';
import '../../models/category_models.dart';

class SubCategoriesScreen extends StatelessWidget {
  final CategoryModel category;
  const SubCategoriesScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());

    controller.fetchProductsByCategory(category.id);

    return Scaffold(
      appBar: AuthAppBar(showBackArrow: true, title: Text(category.name)),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Determine if the screen is small or large
          bool isLargeScreen = constraints.maxWidth > 600;

          // Adjust padding based on screen size
          EdgeInsets responsivePadding = isLargeScreen
              ? const EdgeInsets.symmetric(horizontal: 30)
              : const EdgeInsets.symmetric(horizontal: 13);

          return ListView(
            children: [
              Padding(
                padding: responsivePadding,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort_outline)),
                      onChanged: (value) {
                        controller.filterProductsByOption(value);
                      },
                      items: ['По алфавиту', 'Высокая - Низкая цена', 'Низкая - Высокая цена']
                          .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () {
                        if (controller.isLoading.value) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        if (controller.filteredProducts.isEmpty) {
                          return Center(
                            child: Text('Продукты не найдены!', style: Theme.of(context).textTheme.bodyLarge),
                          );
                        }
                        return GGridLayout(
                          itemCount: controller.filteredProducts.length,
                          itemBuilder: (_, index) => GProductCardVertical(
                            product: controller.filteredProducts[index],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}