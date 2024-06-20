import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/shimmers/category_shimmer.dart';
import 'package:ggo/features/shop/controlers/category_controller.dart';
import 'package:ggo/features/shop/screens/sub_category/sub_categories.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';
import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/colors.dart';

class GHomeCategories extends StatelessWidget {
  const GHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    final darkTheme = GHelperFunctions.isDarkMode(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Determine if the screen is small or large
        bool isLargeScreen = constraints.maxWidth > 600;

        // Adjust height based on screen size
        double listViewHeight = isLargeScreen ? 110 : 90;

        return Obx(
          () {
            if (categoryController.isLoading.value) {
              return const CategoryShimmer();
            }

            if (categoryController.featuredCategories.isEmpty) {
              return Center(
                child: Text(
                  'Нет категорий!',
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: darkTheme ? Colors.white : GColors.dark),
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }

            return SizedBox(
              height: listViewHeight,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categoryController.featuredCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  final category = categoryController.featuredCategories[index];
                  return GVerticalImagesTexts(
                    image: category.image,
                    title: category.name,
                    onTap: () => Get.to(() => SubCategoriesScreen(category: category)),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}