import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/success_screen/success_screen.dart';
import 'package:ggo/utils/constants/images_strings.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instace => Get.find();

  /// Send email whenever verify screen appears & set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    sentTimerForAutoRedirect();
    super.onInit();
  }

  /// Send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(title: 'Электронное письмо отправлено', message: 'Пожалуйста, проверьте свою почту и подтвердите её');
    } catch (e) {
      Loaders.errorSnackBar(title: 'Ошибка!', message: e.toString());
    }
  }

  /// Timer to automatically redirect on email verificatoin
  sentTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false){
        timer.cancel();
        Get.off(()=>SuccessScreen(
          image: GImages.checkRegister,
          title: GTexts.yourAccountCreatedTitle,
          subTitle: GTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect())
        );
      }
    });
  }

  /// Manually check if email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        ()=>SuccessScreen(
          image: GImages.checkRegister,
          title: GTexts.yourAccountCreatedTitle,
          subTitle: GTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        )
      );
    }
  }
  
}