import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ggo/features/shop/models/category_models.dart';

import '../../../features/shop/models/product_models.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/firebase_storage_service.dart';

/// Класс репозитория для операций, связанных с категориями.
class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Функция получения всех категорий в реальном времени
  Stream<List<CategoryModel>> getAllCategories() {
    try {
      return _db.collection('Category').snapshots().map(
            (querySnapshot) => querySnapshot.docs
                .map((documentSnapshot) => CategoryModel.fromSnapshot(documentSnapshot))
                .toList(),
          );
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Что-то пошло не так. Пожалуйста, попробуйте еще раз.';
    }
  }

  /// Функция загрузки категорий в Firebase
  Future<void> uploadCategories(List<CategoryModel> categories) async {
  try {
    final storage = Get.put(GFirebaseStorageService());

    for (var category in categories) {
      final file = await storage.getImageDataFromAssets(category.image);

      final url = await storage.uploadImageData('Categories', file, category.name);

      category.image = url;

      await _db.collection("Category").doc(category.id).set(category.toJson());
    }

  } on FirebaseException catch (e) {
    throw GFirebaseException(e.code).message;
  } on PlatformException catch (e) {
    throw GPlatformException(e.code).message;
  } catch (e) {
    throw 'Что-то пошло не так. Пожалуйста, попробуйте еще раз.';
  }
}

Future<CategoryModel> getCategoryById(String categoryId) async {
  try {
    final snapshot = await _db.collection('Category').doc(categoryId).get();
    if (snapshot.exists) {
      return CategoryModel.fromSnapshot(snapshot);
    } else {
      throw 'Category not found';
    }
  } catch (e) {
    throw 'Ошибка при получении категории: $e';
  }
}

/// Функция получения продуктов по идентификатору категории
  Future<List<ProductModel>> getProductsByCategoryId(String categoryId) async {
    try {
      final snapshot = await _db.collection('products').where('CategoryId', isEqualTo: categoryId).get();
      final list = snapshot.docs.map((document) => ProductModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Что-то пошло не так. Пожалуйста, попробуйте еще раз.';
    }
  }
}
