import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
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


  /// Save user record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      
      // First update Rx user and then check if user data is already stored. If not store new data
      await fetchUserRecord();

      // if no record already stored
      if (user.value.id.isEmpty) {
        if (userCredential != null){
          // Map data
          final user = UserModel(
            id: userCredential.user!.uid,
            name: userCredential.user!.displayName ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            email: userCredential.user!.email ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          // Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      Loaders.warningSnackBar(title: 'Data not saved', message: 'Something went wrong while saving your information. You can re-save your data in your profile.');
    }
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

  /// Delete user account
  void deleteUserAccount () async {
    try {
      FullScreenLoader.openLoadingDialog('Processing...', GImages.loading);

      // First re-authenticate user
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

      //Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        // Remove loader
        FullScreenLoader.stopLoading();
        return;
      } 

      // Form validation
      if (reAuthFormKey.currentState != null && !reAuthFormKey.currentState!.validate()){
        // Remove loader
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
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if(image != null) {
        imageUploading.value = true;

        // Upload image
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);
      
        // Update user image record
        Map<String, dynamic> json = {'/ProfilePicture': imageUrl};
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
