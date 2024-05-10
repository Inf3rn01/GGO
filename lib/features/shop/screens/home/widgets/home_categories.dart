import 'package:flutter/material.dart';
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
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
         return GVerticalImagesTexts(image: GImages.assault, title: 'Assault', onTap: () {});
        },
      ),
    );
  }
}