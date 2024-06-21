import 'package:get/get.dart';
import 'package:ggo/features/shop/models/banner_model.dart';

import '../../../data/repositories/banners/banner_repository.dart';
import '../../../utils/popups/loaders.dart';

import 'dart:async';

class BannerController extends GetxController {  
  final isLoading = false.obs;  
  final carouselCurrentIndex = 0.obs;  
  final carouselCurrentBannerId = ''.obs;  
  final RxList<BannerModel> banners = <BannerModel>[].obs;  
  StreamSubscription<List<BannerModel>>? _bannersSubscription;

  @override  
  void onInit() {  
    fetchBanners();  
    super.onInit();  
  }  

  @override
  void onClose() {
    _bannersSubscription?.cancel();
    super.onClose();
  }

  /// Обновляет навигационные точки страниц баннеров  
  void updatePageIndicator(int index) {  
    carouselCurrentIndex.value = index; 
    if (index < banners.length) { 
      carouselCurrentBannerId.value = banners[index].id;  
    } 
  }  
    
  /// Получение баннеров  
  void fetchBanners() {  
    try {  
      // Показывать загрузчик, пока загружается баннер  
      isLoading.value = true;  
  
      // Получение баннеров  
      final bannerRepository = Get.put(BannerRepository());  
      _bannersSubscription = bannerRepository.fetchBanners().listen((fetchedBanners) {
        // Assign banners
        banners.assignAll(fetchedBanners);

        // Обновляем текущий баннер по id, если есть 
        if (fetchedBanners.isNotEmpty) { 
          carouselCurrentBannerId.value = fetchedBanners.first.id; 
        }

        // Убирает загрузчик
        isLoading.value = false;
      });
  
    } catch (e) {  
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());  
      isLoading.value = false;  
    }  
  }  
}
