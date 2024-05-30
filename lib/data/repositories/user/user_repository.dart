import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../features/personalization/models/user_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

/// Repository class for user-related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to FireStore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const GFormatException();
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Function to fetch user details based on user ID
  Future<UserModel?> fetchUserDetails(String userId) async {
    try {
      final snapshot = await _db.collection("Users").doc(userId).get();
      if (snapshot.exists) {
        return UserModel.fromSnapshot(snapshot);
      } else {
        return null;
      }
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } catch (e) {
      throw 'Failed to fetch user details. Please try again.';
    }
  }

  /// Function to update user data in Firestore
  Future<void> updateUserData(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).update(user.toJson());
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } catch (e) {
      throw 'Failed to update user data. Please try again.';
    }
  }

  /// Update any field in specific users collection
  Future<void> updateAnyField(String userId, String field, dynamic value) async {
    try {
      await _db.collection("Users").doc(userId).update({field: value});
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } catch (e) {
      throw 'Failed to update field. Please try again.';
    }
  }
}