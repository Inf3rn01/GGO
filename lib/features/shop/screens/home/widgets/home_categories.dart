import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/shimmers/category_shimmer.dart';
import 'package:ggo/features/shop/controlers/category_controller.dart';
import 'package:ggo/features/shop/screens/sub_category/sub_categories.dart';
import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';

class GHomeCategories extends StatelessWidget {
  const GHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    
    return Obx(
      () {
        if(categoryController.isLoading.value) return const CategoryShimmer();

        if(categoryController.featuredCategories.isEmpty){
          return Center(child: Text('No data found!', style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.white)));
        }

        return SizedBox(
          height: 90,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return GVerticalImagesTexts(image: category.image, title: category.name, onTap: () => Get.to(() => SubCategoriesScreen(category: category)));
            },
          ),
        );
      }
    );
  }
}