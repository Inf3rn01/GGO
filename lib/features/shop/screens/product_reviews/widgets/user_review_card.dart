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
    return GRoundedContainer(
      backgroundColor: GColors.darkerGrey.withOpacity(0.55),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(backgroundImage: AssetImage(GImages.userImage1), backgroundColor: GColors.grey),
                    const SizedBox(width: GSizes.spaceBtwItems),
                    Text('Dan', style: Theme.of(context).textTheme.titleMedium),         
                  ],
                ),
                IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
              ],
            ),
        
            const SizedBox(height: GSizes.spaceBtwItems),
            
            ///Review
            Row(
              children: [
                const GRaitingBarIndicator(raiting: 5),
                const SizedBox(width: 8),
                Text('19.05.2024', style: Theme.of(context).textTheme.bodyMedium)
              ]
            ),
            
            const SizedBox(height: 10),
        
            const ReadMoreText(
              'It\'s a good gun, i like him. RA-TA-TA-TA!!!',
              style: TextStyle(fontSize: 15.2),
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimCollapsedText: ' show more',
              moreStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: GColors.primary),
              trimExpandedText: ' show less',
              lessStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: GColors.primary),
            ),
        
            const SizedBox(height: GSizes.spaceBtwItems),
            
            /// Company Review
            GRoundedContainer(
              backgroundColor: darkTheme ? GColors.dark : GColors.darkerGrey,
              child: Padding(
                padding: const EdgeInsets.all(GSizes.md),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('GGO', style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(width: 8),
                        Text('19.05.2024', style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
        
                    const SizedBox(height: GSizes.spaceBtwItems),
        
                    const ReadMoreText(
                      'Thanks you for your feedback. We\'ll do our best for you',
                      style: TextStyle(fontSize: 15.2),
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' show more',
                      moreStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: GColors.primary),
                      trimExpandedText: ' show less',
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