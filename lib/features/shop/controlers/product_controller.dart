import 'package:get/get.dart';

import '../../../data/repositories/products/product_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../models/product_models.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  final isLoading = false.obs;
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final productRepository = Get.put(ProductRepository());

  RxList<ProductModel> allProducts = <ProductModel>[].obs;
  RxList<ProductModel> filteredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
     fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      final products = await productRepository.getFeaturedProducts();

      featuredProducts.assignAll(products);
      allProducts.assignAll(products);

    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  ProductModel getProductById(String productId) {
  return allProducts.firstWhere((product) => product.id == productId, orElse: () => ProductModel.empty());
}

  String getProductPrice(ProductModel product) {
    return product.price.toStringAsFixed(2);
  }

  void fetchProductsByCategory(String categoryId) async {
    try {
      isLoading.value = true;
      final products = await productRepository.getProductsByCategory(categoryId);
      allProducts.assignAll(products);
      filteredProducts.assignAll(products);
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void filterProducts(String query) {
    if (query.isEmpty) {
      // If the query is empty, show all products
      featuredProducts.assignAll(allProducts);
    } else {
      // Filter the products based on the query
      featuredProducts.assignAll(
        allProducts.where((product) =>
          product.title.toLowerCase().contains(query.toLowerCase())
        ).toList()
      );
    }
  }
  
  void filterProductsByOption(String? option) {
    if (option == null || option.isEmpty) {
      filteredProducts.assignAll(allProducts);
      return;
    }

    switch (option) {
      case 'Name':
        filteredProducts.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Higher price':
        filteredProducts.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Lower price':
        filteredProducts.sort((a, b) => a.price.compareTo(b.price));
        break;
      default:
        filteredProducts.assignAll(allProducts);
        break;
    }
  }
}