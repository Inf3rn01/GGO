import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/utils/constants/images_strings.dart';
import 'package:ggo/utils/popups/full_screen_loader.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Sign Up
  Future<void> signup() async {
    try {

      ///Start loading
      FullScreenLoader.openLoadingDialog('We are processing your information...', GImages.loading);

      ///Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      /// Form validation
      if(!signupFormKey.currentState!.validate()) return;

    } catch (e) {
      /// Show some generic error to the user
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      /// Remove loader
      FullScreenLoader.stopLoading();
    }


  }

  
}
