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

  TextEditingController get nameController => name;

  void setName(String newName) {
    name.text = newName;
  }

  Future<void> updateUserName() async {
    try {
      FullScreenLoader.openLoadingDialog('We are processing your information...', GImages.loading);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (updateUserNameFormKey.currentState != null && !updateUserNameFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> nameMap = {'Name': name.text.trim()};
      await userRepository.updateSingleField(nameMap);

      userController.user.value.name = name.text.trim();

      FullScreenLoader.stopLoading();

      Loaders.successSnackBar(title: 'Congratulations!', message: 'Your name has been updated.');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
  
}