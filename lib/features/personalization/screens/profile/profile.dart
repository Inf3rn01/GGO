import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/app_bar/auth_appbar.dart';
import 'package:ggo/common/widgets/images/circular_image.dart';
import 'package:ggo/common/widgets/shimmer/shimmer.dart';
import 'package:ggo/common/widgets/texts/section_heading.dart';
import 'package:ggo/features/personalization/controlers/user_controller.dart';
import 'package:ggo/features/personalization/screens/profile/widgets/change_name_widget.dart';
import 'package:ggo/features/personalization/screens/profile/widgets/profile_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../authentication/screens/login/login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const AuthAppBar(showBackArrow: true, title: Text('Profile')),
      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            children: [

              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : GImages.userImage1;
                      return controller.imageUploading.value
                          ? const ShimmerEffect(width: 80, height: 80, radius: 80)
                          : GCircularImage(image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change profile picture', style: TextStyle(fontSize: 14, color: GColors.grey))),
                  ],
                ),
              ),

              ///Details
              const SizedBox(height: GSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: GSizes.spaceBtwItems),
              const GSectionsHeading(title: 'Profile information', showActionButton: false),
              const SizedBox(height: GSizes.spaceBtwItems),

              ProfileMenu(title: 'Name', value: controller.user.value.name, onPressed: () => Get.to(() => const ChangeNameScreen())),
              ProfileMenu(title: 'E-mail', value: controller.user.value.email, onPressed: (){}),
              ProfileMenu(title: 'Phone', value: controller.user.value.phoneNumber, onPressed: (){}),
              const Divider(),
              const SizedBox(height: GSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => Get.to(() => const LoginScreen()),
                  child: const Text('Exit from account', style: TextStyle(fontSize: 14, color: Colors.red)),
                ),
              ),

              const SizedBox(height: 8),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Delete account', style: TextStyle(fontSize: 14, color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

