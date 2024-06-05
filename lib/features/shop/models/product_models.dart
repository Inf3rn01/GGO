import 'package:cloud_firestore/cloud_firestore.dart';

import 'product_features_model.dart';

class ProductModel {
  String id;
  double price;
  String? sku;
  String title;
  DateTime? date;
  bool? isFeatured;
  String? description;
  String? categoryId;
  List<String>? images;
  List<ProductFeaturesModel>? productFeatures;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    this.sku,
    this.date,
    this.images,
    this.isFeatured,
    this.description,
    this.categoryId,
    this.productFeatures,
  });

  /// Метод для создания пустой модели продукта
  static ProductModel empty() => ProductModel(
        id: '',
        title: '',
        price: 0.0,
      );

  /// Преобразование модели в структуру JSON для хранения данных в Firebase
  toJson() {
    return {
      'Title': title,
      'Price': price,
      'SKU': sku,
      'IsFeatured': isFeatured,
      'Description': description,
      'CategoryId': categoryId,
      'Images': images ?? [],
      'ProductFeatures': productFeatures?.map((feature) => feature.toJson()).toList(),
    };
  }


  /// Отображение снимка документа, ориентированного на Json, из Firebase в ProductModel
  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      title: data['Title'] ?? '',
      price: (data['Price'] as num?)?.toDouble() ?? 0.0,
      sku: data['SKU'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      description: data['Description'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productFeatures: (data['ProductFeatures'] is List)
          ? List<ProductFeaturesModel>.from(data['ProductFeatures'].map((feature) => ProductFeaturesModel.fromJson(feature as Map<String, dynamic>)))
          : null,
    );
  }

  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    List<String>? images;
    if (data['Images'] is List) {
      images = List<String>.from(data['Images'].map((e) => e.toString()));
    } else {
      // Handle the case where Images is not a list
      images = null; // or handle it as you need
    }
    return ProductModel(
      id: document.id,
      title: data['Title'] ?? '',
      price: (data['Price'] as num?)?.toDouble() ?? 0.0,
      sku: data['SKU'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      description: data['Description'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      images: images,
      productFeatures: (data['ProductFeatures'] is List)
          ? List<ProductFeaturesModel>.from(data['ProductFeatures'].map((feature) => ProductFeaturesModel.fromJson(feature as Map<String, dynamic>)))
          : null,
    );
  }

}
