import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ggo/data/repositories/authentication/authentication_repository.dart';
import 'package:ggo/utils/constants/images_strings.dart';
import 'package:ggo/utils/helpers/network_manager.dart';
import 'package:ggo/utils/popups/full_screen_loader.dart';
import 'package:ggo/utils/popups/loaders.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // Проверяем, выбрана ли галочка "Remember Me" перед извлечением данных
    if (localStorage.read('REMEMBER_ME_EMAIL') != null && localStorage.read('REMEMBER_ME_PASSWORD') != null) {
      email.text = localStorage.read('REMEMBER_ME_EMAIL');
      password.text = localStorage.read('REMEMBER_ME_PASSWORD');
      rememberMe.value = true; // Устанавливаем rememberMe в true, если данные есть в хранилище
    }
    super.onInit();
  }

  /// SignIn
  void signIn() async {
    try {
      //Start loading
      FullScreenLoader.openLoadingDialog('Logging you in...', GImages.loading);

      //Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove loader
        FullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (loginFormKey.currentState != null && !loginFormKey.currentState!.validate()) {
        // Remove loader
        FullScreenLoader.stopLoading();
        return;
      }

      // Save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      } else {
        // Remove saved data if remember me is not selected
        localStorage.remove('REMEMBER_ME_EMAIL');
        localStorage.remove('REMEMBER_ME_PASSWORD');
      }

      // Login user using email & password authentication
      final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove loader
      FullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      // Remove loader
      FullScreenLoader.stopLoading();

      // Show some generic error to the user
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}