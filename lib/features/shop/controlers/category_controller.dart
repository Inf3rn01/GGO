import 'dart:async';

import 'package:get/get.dart';
import 'package:ggo/data/repositories/categories/category_repository.dart';
import 'package:ggo/features/shop/models/category_models.dart';
import 'package:ggo/utils/popups/loaders.dart';

import '../models/product_models.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  Rx<CategoryModel> selectedCategory = CategoryModel(id: '', name: '', image: '', isFeatured: false).obs;
  RxList<ProductModel> categoryProducts = <ProductModel>[].obs;
  StreamSubscription<List<CategoryModel>>? _categoriesSubscription;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  @override
  void onClose() {
    _categoriesSubscription?.cancel();
    super.onClose();
  }

  /// Подписка на поток категорий в реальном времени
  void fetchCategories() {
    try {
      isLoading.value = true;

      _categoriesSubscription = _categoryRepository.getAllCategories().listen((categories) {
        allCategories.assignAll(categories);
        featuredCategories.assignAll(allCategories.where((category) => category.isFeatured).toList());
        isLoading.value = false;
      });
    } catch (e) {
      Loaders.errorSnackBar(title: 'Ошибка!', message: e.toString());
      isLoading.value = false;
    }
  }

  /// Load selected category data
  Future<void> loadSelectedCategoryData(String categoryId) async {
    try {
      isLoading.value = true;

      final category = await _categoryRepository.getCategoryById(categoryId);

      selectedCategory.value = category;
    } catch (e) {
      Loaders.errorSnackBar(title: 'Ошибка!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Get category or sub-category products
  Future<void> getCategoryOrSubCategoryProducts(String categoryId) async {
    try {
      isLoading.value = true;

      final products = await _categoryRepository.getProductsByCategoryId(categoryId);

      categoryProducts.assignAll(products);
    } catch (e) {
      Loaders.errorSnackBar(title: 'Ошибка!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}