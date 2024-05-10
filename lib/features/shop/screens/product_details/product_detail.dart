import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/app_bar/auth_appbar.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ggo/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ggo/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:ggo/utils/constants/sizes.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:ggo/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ggo/utils/constants/images_strings.dart';
import 'package:icons_plus/icons_plus.dart';

import 'widgets/rating_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  void onSlidePressed(int index) {
    print('Изображение $index было нажато');
  }

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: GAppBar(showBackArrow: true, leadingIcon: Icons.share, leadingOnPressed: () {}),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 230,
              child: GRoundedContainer(
                showBorder: true,
              borderColor: GColors.borderPrimary.withOpacity(0.1),
                backgroundColor: GColors.black,
                child: GPromoSlider(
                  banners: const [GImages.promoBanner1, GImages.promoBanner2, GImages.promoBanner3],
                  viewportFraction: 1.025,
                  applyImageRadius: true,
                  onPressed: onSlidePressed,
                ),
              ),
            ),

            const SizedBox(height: 10),

            GRoundedContainer(
              showBorder: true,
              borderColor: GColors.borderPrimary.withOpacity(0.1),
              backgroundColor: darkTheme ? GColors.black : GColors.grey,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 0),
                child: Column(
                  children: [
                    RaitingAndShare(),
                    ProductMetaData(),
                    SizedBox(height: 9)
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // GRoundedContainer(
            //   showBorder: true,
            //   borderColor: GColors.borderPrimary.withOpacity(0.1),
            //   backgroundColor: darkTheme ? GColors.black : GColors.grey,

            // ),
          ],
        ),
      ),
    );
  }
}