import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/app_bar/tab_bar.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ggo/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:ggo/utils/constants/sizes.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:ggo/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ggo/utils/constants/images_strings.dart';

import '../../../../common/widgets/app_bar/product_appbar.dart';
import 'widgets/product_slider.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 370,
                  child: GProductSlider(
                    banners: const [GImages.productImageAssault1, GImages.productImage2],
                    applyImageRadius: true,
                    onPressed: onSlidePressed,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: ProductAppBar(
                    showBackArrow: true,
                    leadingIcon: Icons.share,
                    leadingOnPressed: () {},
                  ),
                ),
              ],
            ),
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
                    SizedBox(height: 9),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            GRoundedContainer(
              showBorder: true,
              borderColor: GColors.borderPrimary.withOpacity(0.1),
              backgroundColor: darkTheme ? GColors.black : GColors.grey,
              child: const DefaultTabController(
                length: 2,
                child: GTabBar(
                  tabs: [
                    Tab(child: Text('Description')),
                    Tab(child: Text('Features')),
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