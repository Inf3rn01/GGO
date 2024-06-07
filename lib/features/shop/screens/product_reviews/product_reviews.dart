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
    return const Scaffold(

      /// Appbar
      appBar: AuthAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Leave your feedback. We hope you like our product!', style: TextStyle(fontSize: 14.5)),
              SizedBox(height: GSizes.spaceBtwItems / 1.5),

              /// overall product ratings
              OverallProductRaiting(),
              GRaitingBarIndicator(raiting: 4),
              SizedBox(height: 2),
              RatingWithOneStar(showRating: false, showIcon: false, rating: 4, reviewCount: 1),
              SizedBox(height: GSizes.spaceBtwSections / 5),
              Divider(thickness: 1.5),
              SizedBox(height: GSizes.spaceBtwSections / 1.5),

              /// User reviews list
              UserReviewCard(),
              
            ],
          ),
        ),
      ),
    );
  }
}
