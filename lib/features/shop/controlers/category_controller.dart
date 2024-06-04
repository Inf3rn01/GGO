import 'package:get/get.dart';
import 'package:ggo/data/repositories/categories/category_repository.dart';
import 'package:ggo/features/shop/models/category_models.dart';
//import 'package:ggo/features/shop/models/product_models.dart';
import 'package:ggo/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  Rx<CategoryModel> selectedCategory = CategoryModel(id: '', name: '', image: '', isFeatured: false).obs;
  //RxList<ProductModel> categoryProducts = <ProductModel>[].obs; // Продукты выбранной категории

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  /// Load category data
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore, API, etc.)
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
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
      // Show loader while loading the selected category
      isLoading.value = true;

      // Fetch the selected category data from the data source
      final category = await _categoryRepository.getCategoryById(categoryId);

      // Update the selected category
      selectedCategory.value = category;
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }

  // /// Get category or sub-category products
  // Future<void> getCategoryOrSubCategoryProducts(String categoryId) async {
  //   try {
  //     // Show loader while loading the category products
  //     isLoading.value = true;

  //     // Fetch the products for the selected category or sub-category
  //     final products = await _categoryRepository.getProductsByCategoryId(categoryId);

  //     // Update the category products list
  //     categoryProducts.assignAll(products);
  //   } catch (e) {
  //     Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  //   } finally {
  //     // Remove loader
  //     isLoading.value = false;
  //   }
  // }

  /// Удаление категории
  Future<void> removeCategory(String categoryId) async {
    try {
      // Show loader while deleting the category
      isLoading.value = true;

      // Delete the category from the data source
      await _categoryRepository.removeCategoryById(categoryId);

      // Refresh the categories list
      await fetchCategories();
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }

}