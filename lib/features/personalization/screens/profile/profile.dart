import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/app_bar/auth_appbar.dart';
import 'package:ggo/common/widgets/images/circular_image.dart';
import 'package:ggo/common/widgets/shimmers/shimmer.dart';
import 'package:ggo/common/widgets/texts/section_heading.dart';
import 'package:ggo/features/personalization/controlers/user_controller.dart';
import 'package:ggo/features/personalization/screens/profile/widgets/change_name_widget.dart';
import 'package:ggo/features/personalization/screens/profile/widgets/change_phone_widget.dart';
import 'package:ggo/features/personalization/screens/profile/widgets/profile_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const AuthAppBar(showBackArrow: true, title: Text('Профиль')),
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
                      final image = networkImage.isNotEmpty ? networkImage : GImages.user;
                      return controller.imageUploading.value
                          ? const ShimmerEffect(width: 90, height: 90, radius: 90)
                          : GCircularImage(image: image, width: 90, height: 90, padding: 4.5, isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Изменить фотографию', style: TextStyle(fontSize: 14, color: GColors.grey))),
                  ],
                ),
              ),

              ///Details
              const SizedBox(height: GSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: GSizes.spaceBtwItems),
              const GSectionsHeading(title: 'Информация профиля', showActionButton: false),
              const SizedBox(height: GSizes.spaceBtwItems),

              ProfileMenu(title: 'Имя', value: controller.user.value.name, onPressed: () => Get.to(() => const ChangeNameScreen())),
              //ProfileMenu(title: 'Почта', value: controller.user.value.email, onPressed: (){}),
              ProfileMenu(title: 'Телефон', value: controller.user.value.phoneNumber, onPressed: () => Get.to(() => const ChangePhoneScreen())),
              
              const Divider(),
              const SizedBox(height: GSizes.spaceBtwItems + 3),

              Center(
                child: TextButton(
                  onPressed: controller.logout,
                  child: const Text('Выйти из аккаунта', style: TextStyle(fontSize: 14, color: Colors.red)),
                ),
              ),

              const SizedBox(height: 6),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Удалить аккаунт', style: TextStyle(fontSize: 14, color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

