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

      //Start loading
      FullScreenLoader.openLoadingDialog('We are processing your information...', GImages.loading);

      //Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        // Remove loader
        FullScreenLoader.stopLoading();
        return;
      } 

      // Form validation
      if (signupFormKey.currentState != null && !signupFormKey.currentState!.validate()){
        // Remove loader
        FullScreenLoader.stopLoading();
        return;
      }

      // Checkbox check
      if(!hideCheckbox.value) {
        Loaders.warningSnackBar(
          title: 'Accept Privacy Policy and Terms of use',
          message: 'In order to create account, you must have to read and accept the Privacy Policy and Terms of use.'
        );
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        name: name.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove loader
      FullScreenLoader.stopLoading();

      //Show success message
      Loaders.successSnackBar(title: 'Congratulations!', message: 'Your account has been created! Verify email to continue');

      // Move to verify email screen
      Get.to(() => const VerifyEmailScreen());

    } catch (e) {
      // Remove loader
      FullScreenLoader.stopLoading();

      // Show some generic error to the user
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
