import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  static ProductDetailController get instance => Get.find();

  final carouselCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

}