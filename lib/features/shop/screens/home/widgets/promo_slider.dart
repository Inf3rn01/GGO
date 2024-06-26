import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ggo/common/widgets/images/rounded_image.dart';
import 'package:ggo/utils/constants/colors.dart';

import '../../../controlers/banner_controller.dart';

class GPromoSlider extends StatelessWidget {
  const GPromoSlider({
    super.key,
    this.applyImageRadius = true,
    this.onPressed,
  });

  final bool applyImageRadius;
  final Function(int)? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(viewportFraction: 1.05, onPageChanged: (index, _) => controller.updatePageIndicator(index)),
                items: controller.banners.map((banner) => GRoundedImage(imageUrl: banner.imageUrl, isNetworkImage: true, onPressed: () {})).toList(),
              ),
              const SizedBox(height: 10),
              Center(
                child: Obx(
                  () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++)
                        GCircularContainer(
                          width: 17,
                          height: 6,
                          margin: const EdgeInsets.only(right: 10),
                          backgroundColor: controller.carouselCurrentIndex.value == i ? GColors.primary : GColors.grey,
                        ),
                    ],
                  ),
                ),
              )
            ],
          );
        }
    );
  }
}