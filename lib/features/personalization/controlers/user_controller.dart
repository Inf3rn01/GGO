import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:ggo/data/repositories/authentication/authentication_repository.dart';
import 'package:ggo/data/repositories/user/user_repository.dart';
import 'package:ggo/features/authentication/screens/login/login.dart';
import 'package:ggo/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:ggo/utils/popups/full_screen_loader.dart';
import 'package:ggo/utils/popups/loaders.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/constants/images_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/network_manager.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs; 

  final imageUploading = false.obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  CardFieldInputDetails? cardFieldInputDetails;

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }


  /// Сохранение записи пользователя из любого поставщика регистрации
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (userCredential != null && userCredential.user != null){
          final user = UserModel(
            id: userCredential.user!.uid,
            name: userCredential.user!.displayName ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            email: userCredential.user!.email ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
            balance: '0',
          );

          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      Loaders.warningSnackBar(title: 'Data not saved', message: 'Something went wrong while saving your information. You can re-save your data in your profile.');
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent(double amount) async {
    const url = 'https://api.stripe.com/v1/payment_intents';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer sk_test_51PPSpoRrGht9QPvptAB8WmXBKBMQu1GsK5e3adG2J7CH046rtwXl5xTsX5EixzdiXkxUWIGAAhIQwSD42X8jdHg300QiCOTqBJ',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'amount': (amount * 100).toInt().toString(),
        'currency': 'usd',
        'payment_method_types[]': 'card',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create PaymentIntent: ${response.body}');
    }
  }

  Future<void> confirmPayment(
      Map<String, dynamic> paymentIntent, double amount) async {
    try {
      await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: paymentIntent['client_secret'],
        data: const PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(),
        ),
      );

      await updateBalance(amount);
      Get.snackbar('Успех', 'Баланс пополнен на \$${amount.toStringAsFixed(2)}');
    } catch (e) {
      Get.snackbar('Ошибка', 'Ошибка пополнения: $e');
    }
  }

  Future<void> updateBalance(double amount) async {
  final currentBalance = double.parse(user.value.balance);
  final newBalance = currentBalance + amount;

  user.update((user) {
    if (user != null) {
      user.balance = newBalance.toString(); // Сохраняем как строку
    }
  });

  await userRepository.updateUserDetails(user.value);
}

  void topUpBalance(double amount) async {
    if (amount > 0 && cardFieldInputDetails?.complete == true) {
      try {
        final paymentIntent = await createPaymentIntent(amount);
        await confirmPayment(paymentIntent, amount);
      } catch (e) {
        Get.snackbar('Ошибка', 'Ошибка пополнения: $e');
      }
    } else {
      Get.snackbar('Ошибка', 'Пожалуйста, введите корректные данные карты.');
    }
  }

  void setCardFieldInputDetails(CardFieldInputDetails details) {
    cardFieldInputDetails = details;
  }


  /// Delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(GSizes.md),
      title: 'Delete account',
      middleText: 'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: GSizes.lg),
          child: Text('Delete', style: TextStyle(fontSize: 13.2),),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  /// Удаление аккаунта пользователя
  void deleteUserAccount () async {
    try {
      FullScreenLoader.openLoadingDialog('Processing...', GImages.loading);

      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider == 'password') {
        FullScreenLoader.stopLoading();
        Get.to(() => const ReAuthLoginForm());
      } 
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Re-authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      FullScreenLoader.openLoadingDialog('Processing...', GImages.loading);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){

        FullScreenLoader.stopLoading();
        return;
      } 

      if (reAuthFormKey.currentState != null && !reAuthFormKey.currentState!.validate()){
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      FullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
      Loaders.successSnackBar(title: 'Account deleted', message: 'Your account successfully deleted');
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Upload profile image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image != null) {
        imageUploading.value = true;

        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        Loaders.successSnackBar(title: 'Congratulations', message: 'Your profile image has been updated.');
      }
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: 'something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }   
  }
}
