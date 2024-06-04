import 'package:get/get.dart';
import 'package:ggo/features/shop/models/banner_model.dart';

import '../../../data/repositories/banners/banner_repository.dart';
import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController {

  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }


  /// Обновляет навигационные точки страниц баннеров
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }
  
  /// Получение баннеров
  Future<void> fetchBanners() async {
    try {
      // Показывать загрузчик, пока загружается баннер
      isLoading.value = true;

      // Получение баннеров
      final bannerRepository = Get.put(BannerRepository());
      final banners = await bannerRepository.fetchBanners();

      // Assign banners
      this.banners.assignAll(banners);

    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Уберает загрузчик
      isLoading.value = false;
    }
  }

}