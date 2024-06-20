import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/data/repositories/user/user_repository.dart';
import 'package:ggo/features/personalization/controlers/user_controller.dart';
import 'package:ggo/utils/helpers/network_manager.dart';
import 'package:ggo/utils/popups/full_screen_loader.dart';

import '../../../utils/constants/images_strings.dart';
import '../../../utils/popups/loaders.dart';
import '../screens/profile/profile.dart';

class UpdatePhoneController extends GetxController {
  static UpdatePhoneController get instance => Get.find();

  final phone = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updatePhoneFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializePhone();
    super.onInit();
  }

  Future<void> initializePhone() async {
    phone.text = userController.user.value.phoneNumber;
  }

  TextEditingController get phoneController => phone;

  void setPhone(String newPhone) {
    phone.text = newPhone;
  }

  Future<void> updatePhone() async {
    try {
      FullScreenLoader.openLoadingDialog('Обрабатываю ваши данные...', GImages.loading);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (updatePhoneFormKey.currentState != null && !updatePhoneFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> phoneMap = {'Phone': phone.text.trim()};
      await userRepository.updateSingleField(phoneMap);

      userController.user.value.phoneNumber = phone.text.trim();

      FullScreenLoader.stopLoading();

      Loaders.successSnackBar(title: 'Поздравляю!', message: 'Ваш номер телефона был изменен.');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Ошибка!', message: e.toString());
    }
  }
}