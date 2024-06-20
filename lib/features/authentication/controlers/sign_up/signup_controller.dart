import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/data/repositories/authentication/authentication_repository.dart';
import 'package:ggo/data/repositories/user/user_repository.dart';
import 'package:ggo/features/authentication/screens/sign_up/widgets/verify_email.dart';
import 'package:ggo/utils/constants/images_strings.dart';
import 'package:ggo/utils/popups/full_screen_loader.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hideCheckbox = false.obs;
  final hidePassword = true.obs;
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Sign Up
  void signup() async {
    try {

      
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        FullScreenLoader.stopLoading();
        return;
      } 

      if (signupFormKey.currentState != null && !signupFormKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
        return;
      }

      if(!hideCheckbox.value) {
        Loaders.warningSnackBar(
          title: 'Примите политику конфиденциальности и условия использования',
          message: 'Чтобы создать учетную запись, вы должны прочитать и принять Политику конфиденциальности и Условия использования.'
        );
        return;
      }

      FullScreenLoader.openLoadingDialog('Обрабатываю вашу информацию...', GImages.loading);

      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      final newUser = UserModel(
        id: userCredential.user!.uid,
        name: name.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
        balance: '0',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      FullScreenLoader.stopLoading();

      Loaders.successSnackBar(title: 'Поздравляю!', message: 'Ваша учетная запись создана! Подтвердите адрес электронной почты для продолжения');

      Get.to(() => VerifyEmailScreen(email: email.text.trim()));

    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Ошибка!', message: e.toString());
    }
  }
}
