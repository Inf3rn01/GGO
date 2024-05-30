import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ggo/features/authentication/screens/login/login.dart';
import 'package:ggo/features/authentication/screens/sign_up/widgets/verify_email.dart';
import 'package:ggo/navigation_menu.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }
  
  /// Function to show relevant screen
  void screenRedirect() async {
    final user = _auth.currentUser;
    if(user != null) {
      if(user.emailVerified){
        Get.offAll(()=>const NavigationMenu());
      } else {
        Get.offAll(()=> VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }

  

/*-------------- Email & Password Sign In ------------*/

  ///[EmailAuthentication] - SignIn
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.signInUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw GFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const GFormatException();
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Somethink went wrong. Please try again';
    }
  }

  ///[EmailAuthentication] - SignUp
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw GFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const GFormatException();
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Somethink went wrong. Please try again';
    }
  }

  ///[EmailVerification] - Mail verification
  Future<void> sendEmailVerification() async {
    try{
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw GFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const GFormatException();
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Somethink went wrong. Please try again';
    }
  }

  ///[ReAuthenticate] - ReAuthenticate yser


  ///[EmailAuthentication] - Forget password



  ///[LogoutUser] - Valid for any authentication
  Future<void> logout() async {
    try{
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw GFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const GFormatException();
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Somethink went wrong. Please try again';
    }
  }

  ///[DeleteUser] - Remove user Auth and Firestore account


}