import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/features/shop/screens/sub_category/sub_categories.dart';
import 'package:ggo/utils/constants/images_strings.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';

class GHomeCategories extends StatelessWidget {
  const GHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
         return GVerticalImagesTexts(image: GImages.assault, title: 'Assault', onTap: () => Get.to(() => const SubCategoriesScreen()));
        },
      ),
    );
  }
}