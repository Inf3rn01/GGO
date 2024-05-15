import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ggo/features/shop/controlers/product_detail_controller.dart';
import 'package:ggo/common/widgets/images/rounded_image.dart';
import 'package:ggo/utils/constants/colors.dart';

class GProductSlider extends StatelessWidget {
  const GProductSlider({
    super.key,
    required this.banners,
    this.applyImageRadius = true,
    this.onPressed,
  });

  final List<String> banners;
  final bool applyImageRadius;
  final Function(int)? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailController());
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1,
                viewportFraction: 1.03,
                onPageChanged: (index, _) => controller.updatePageIndicator(index)
              ),
              items: banners.map((url) => GestureDetector(
                onTap: () {
                  onPressed?.call(banners.indexOf(url));
                },
                child: GRoundedImage(
                  imageUrl: url,
                  applyImageRadius: applyImageRadius,
                  isNetworkImage: true,
                  fit: BoxFit.cover,
                ),
              )).toList(),
            ),
            Positioned(
                bottom: 8.0,
                left: 8.0,
                child: GRoundedContainer(
                  height: 21,
                  width: 34,
                  backgroundColor: GColors.grey.withOpacity(0.55),
                  radius: 10,
                  child: Align(
                    alignment: Alignment.center,
                    child: Obx(
                      () => RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: GColors.black,
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(text: '${controller.carouselCurrentIndex.value + 1}'),
                            TextSpan(text: '/${banners.length}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}