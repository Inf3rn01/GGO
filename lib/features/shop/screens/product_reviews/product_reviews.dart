import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/app_bar/auth_appbar.dart';
import 'package:ggo/features/shop/screens/product_reviews/widgets/raiting/raitng_bar_indicator.dart';
import 'package:ggo/features/shop/screens/product_reviews/widgets/raiting/rating_one_star_widget.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/raiting/raiting_product_indicator.dart';
import 'widgets/user_review_card.dart';


class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      /// Appbar
      appBar: const AuthAppBar(title: Text('Отзывы'), showBackArrow: true),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth < 600 ? 16 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Оставьте свой отзыв. Мы надеемся, что вам нравится наш продукт!',
                style: TextStyle(fontSize: screenWidth < 600 ? 14.5 : 15.5),
              ),
              const SizedBox(height: GSizes.spaceBtwItems / 1.5),

              /// overall product ratings
              const OverallProductRaiting(),
              const GRaitingBarIndicator(raiting: 4),
              const SizedBox(height: 2),
              const RatingWithOneStar(showRating: false, showIcon: false, rating: 4, reviewCount: 1),
              const SizedBox(height: GSizes.spaceBtwSections / 5),
              const Divider(thickness: 1.5),
              const SizedBox(height: GSizes.spaceBtwSections / 1.5),

              /// User reviews list
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

