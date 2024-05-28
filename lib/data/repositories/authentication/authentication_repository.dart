import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ggo/features/authentication/screens/login/login.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();


  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }
  
  void screenRedirect() async {
    Get.offAll(() => const LoginScreen());
  }

  

/*-------------- Email & Password Sign In ------------*/





}