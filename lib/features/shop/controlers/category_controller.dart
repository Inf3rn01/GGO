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

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  /// Load category data
  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();

      allCategories.assignAll(categories);

      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(5).toList());
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove loader
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
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
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
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }

  /// Удаление категории
  Future<void> removeCategory(String categoryId) async {
    try {

      isLoading.value = true;

      await _categoryRepository.removeCategoryById(categoryId);

      await fetchCategories();
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }

}