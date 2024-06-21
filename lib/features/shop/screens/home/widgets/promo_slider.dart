import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ggo/common/widgets/images/rounded_image.dart';
import 'package:ggo/utils/constants/colors.dart';

import '../../../controlers/banner_controller.dart';

class GPromoSlider extends StatefulWidget {
  const GPromoSlider({
    super.key,
    this.applyImageRadius = true,
    this.onPressed,
  });

  final bool applyImageRadius;
  final Function(int)? onPressed;

  @override
  _GPromoSliderState createState() => _GPromoSliderState();
}

class _GPromoSliderState extends State<GPromoSlider> {
  final BannerController controller = Get.put(BannerController());
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Column(
          children: [
            CarouselSlider.builder(
              itemCount: controller.banners.length,
              itemBuilder: (context, index, realIndex) {
                final banner = controller.banners[index];
                return GRoundedImage(
                  imageUrl: banner.imageUrl,
                  isNetworkImage: true,
                  onPressed: () {},
                );
              },
              options: CarouselOptions(
                viewportFraction: 1.05,
                onPageChanged: (index, _) {
                  controller.updatePageIndicator(index);
                },
                initialPage: controller.carouselCurrentIndex.value,
                pageSnapping: true,
              ),
              carouselController: _carouselController,
            ),
            const SizedBox(height: 10),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var banner in controller.banners)
                      GCircularContainer(
                        width: 17,
                        height: 6,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor: controller.carouselCurrentBannerId.value == banner.id
                            ? GColors.primary
                            : GColors.grey,
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
