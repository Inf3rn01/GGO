import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/data/repositories/user/user_repository.dart';
import 'package:ggo/features/personalization/controlers/user_controller.dart';
import 'package:ggo/utils/helpers/network_manager.dart';
import 'package:ggo/utils/popups/full_screen_loader.dart';

import '../../../utils/constants/images_strings.dart';
import '../../../utils/popups/loaders.dart';
import '../screens/profile/profile.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();

  final name = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    name.text = userController.user.value.name;
  }

  // Добавлен геттер для name
  TextEditingController get nameController => name;

  // Добавлен метод для изменения текста в name
  void setName(String newName) {
    name.text = newName;
  }

  Future<void> updateUserName() async {
    try {
      //Start loading
      FullScreenLoader.openLoadingDialog('We are processing your information...', GImages.loading);

      //Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove loader
        FullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (updateUserNameFormKey.currentState != null && !updateUserNameFormKey.currentState!.validate()) {
        // Remove loader
        FullScreenLoader.stopLoading();
        return;
      }

      // Update user's name in the Firebase Firestore
      Map<String, dynamic> nameMap = {'Name': name.text.trim()};
      await userRepository.updateSingleField(nameMap);

      // Update the Rx user value
      userController.user.value.name = name.text.trim();

      // Remove loader
      FullScreenLoader.stopLoading();

      //Show success message
      Loaders.successSnackBar(title: 'Congratulations!', message: 'Your name has been updated.');

      // Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      // Remove loader
      FullScreenLoader.stopLoading();

      // Show some generic error to the user
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
  
}