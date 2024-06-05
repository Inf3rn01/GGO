import 'package:cloud_firestore/cloud_firestore.dart';

class ProductFeaturesModel {
  String id;
  Map<String, dynamic> features;

  /// Конструктор для ProductFeaturesModel
  ProductFeaturesModel({
    required this.id,
    required this.features,
  });

  /// Метод для создания пустой модели пользователя
  static ProductFeaturesModel empty() => ProductFeaturesModel(id: '', features: {});

  /// Преобразование модели в структуру JSON для хранения данных в Firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      ...features,
    };
  }

  /// Создание экземпляра ProductFeaturesModel из JSON-данных
  factory ProductFeaturesModel.fromJson(Map<String, dynamic> json) {
    var features = Map<String, dynamic>.from(json);
    features.remove('id');
    return ProductFeaturesModel(
      id: json['id'] ?? '',
      features: features,
    );
  }

  /// Отображение снимка документа, ориентированного на Json, из Firebase в ProductFeaturesModel
  factory ProductFeaturesModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return ProductFeaturesModel(
        id: document.id,
        features: data,
      );
    } else {
      return ProductFeaturesModel.empty();
    }
  }
}