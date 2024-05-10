import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/app_bar/auth_appbar.dart';
import 'package:ggo/common/widgets/images/circular_image.dart';
import 'package:ggo/common/widgets/texts/section_heading.dart';
import 'package:ggo/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../authentication/screens/login/login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(showBackArrow: true, title: Text('Profile')),
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
                    const GCircularImage(image: GImages.userImage, width: 80, height: 80),
                    TextButton(onPressed: () {}, child: const Text('Change profile picture')),
                  ],
                ),
              ),

              ///Details
              const SizedBox(height: GSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: GSizes.spaceBtwItems),
              const GSectionsHeading(title: 'Profile information', showActionButton: false),
              const SizedBox(height: GSizes.spaceBtwItems),

              ProfileMenu(title: 'Name', value: 'Danil', onPressed: (){}),
              ProfileMenu(title: 'E-mail;', value: 'PASS', onPressed: (){}),
              ProfileMenu(title: 'Phone number', value: '+7682834638', onPressed: (){}),
              ProfileMenu(title: 'Date of Birth', value: '25.05.2004', onPressed: (){}),
              const Divider(),
              const SizedBox(height: GSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: (){},
                  child: const Text('Exit from account', style: TextStyle(color: Colors.red)),
                ),
              ),

              const SizedBox(height: 8),

              Center(
                child: TextButton(
                  onPressed: () => Get.to(() => const LoginScreen()),
                  child: const Text('Delete account', style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

