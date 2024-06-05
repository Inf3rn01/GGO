import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ggo/features/shop/models/category_models.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/firebase_storage_service.dart';

/// Класс репозитория для операций, связанных с категориями.
class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Функция получения всех категорий
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Category').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // /// Функция загрузки категорий в Firebase
  // Future<void> uploadDummyData(List<CategoryModel> categories) async {
  //   try {
      
  //     // Загрузка всех категорий вместе с их изображениями
  //     final storage = Get.put(GFirebaseStorageService());

  //     for (var category in categories) {

  //       // Получение ссылки ImageData из локальных ассетов
  //       final file = await storage.getImageDataFromAssets(category.image);

  //       // Загрузить изображение и получить его url
  //       final url = await storage.uploadImageData('Category', file, category.name);

  //       // Присвоение url атрибуту category.image
  //       category.image = url;

  //       // Store category in firestore
  //       await _db.collection("Category").doc(category.id).set(category.toJson());
  //     }

  //   } on FirebaseException catch (e) {
  //     throw GFirebaseException(e.code).message;
  //   } on PlatformException catch (e) {
  //     throw GPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again.';
  //   }
  // }

  /// Функция загрузки категорий в Firebase
  Future<void> uploadCategories(List<CategoryModel> categories) async {
  try {
    // Загрузка всех категорий вместе с их изображениями
    final storage = Get.put(GFirebaseStorageService());

    for (var category in categories) {
      // Получение ссылки ImageData из локальных ассетов
      final file = await storage.getImageDataFromAssets(category.image);

      // Загрузить изображение и получить его url
      final url = await storage.uploadImageData('Categories', file, category.name);

      // Присвоение url атрибуту category.image
      category.image = url;

      // Store category in firestore
      await _db.collection("Categories").doc(category.id).set(category.toJson());
    }

  } on FirebaseException catch (e) {
    throw GFirebaseException(e.code).message;
  } on PlatformException catch (e) {
    throw GPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again.';
  }
}

Future<CategoryModel> getCategoryById(String categoryId) async {
  try {
    final snapshot = await _db.collection('Categories').doc(categoryId).get();
    if (snapshot.exists) {
      return CategoryModel.fromSnapshot(snapshot);
    } else {
      throw 'Category not found';
    }
  } catch (e) {
    throw 'Error fetching category: $e';
  }
}

//----------------------- Для панели админа -----------------------//

  /// Удаление категорий по id
  Future<void> removeCategoryById(String categoryId) async {
    try {
      await _db.collection('Categories').doc(categoryId).delete();
    } catch (e) {
      throw 'Error deleting category: $e';
    }
  }

}
