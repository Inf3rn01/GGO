import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ggo/features/shop/screens/product_reviews/widgets/raiting/raitng_bar_indicator.dart';
import 'package:ggo/utils/constants/images_strings.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    final screenWidth = GHelperFunctions.screenWidth();

    return GRoundedContainer(
      backgroundColor: GColors.darkerGrey.withOpacity(0.55),
      child: Padding(
        padding: EdgeInsets.all(screenWidth < 600 ? 9.0 : 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(GImages.user),
                      backgroundColor: GColors.grey,
                    ),
                    SizedBox(width: screenWidth < 600 ? 6.0 : GSizes.spaceBtwItems),
                    Text('Dan', style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                //IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
              ],
            ),
            SizedBox(height: screenWidth < 600 ? 6.0 : GSizes.spaceBtwItems),
            /// Review
            Row(
              children: [
                const GRaitingBarIndicator(raiting: 4),
                const SizedBox(width: 8),
                Text('24.06.2024', style: Theme.of(context).textTheme.bodyMedium)
              ],
            ),
            SizedBox(height: screenWidth < 600 ? 8.0 : 10.0),
            const ReadMoreText(
              'Это отличное оружие, мне оно нравится. RA-TA-TA-TA!!!',
              style: TextStyle(fontSize: 15.2),
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimCollapsedText: ' Показать больше',
              moreStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: GColors.primary),
              trimExpandedText: ' Скрыть',
              lessStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: GColors.primary),
            ),
            SizedBox(height: screenWidth < 600 ? 6.0 : GSizes.spaceBtwItems),

            /// Company Review
            GRoundedContainer(
              backgroundColor: darkTheme ? GColors.dark : GColors.darkerGrey,
              child: Padding(
                padding: EdgeInsets.all(screenWidth < 600 ? 10.0 : GSizes.md),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('GGO', style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(width: 8),
                        Text('24.06.2024', style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    SizedBox(height: screenWidth < 600 ? 6.0 : GSizes.spaceBtwItems),
                    const ReadMoreText(
                      'Спасибо за ваш отзыв. Мы стараемся становиться лучше для вас.',
                      style: TextStyle(fontSize: 15.2),
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' Показать больше',
                      moreStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: GColors.primary),
                      trimExpandedText: ' Скрыть',
                      lessStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: GColors.primary),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
