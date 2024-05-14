import 'package:ggo/features/authentication/screens/login/password_configuration/forget_password.dart';
import 'package:ggo/features/authentication/screens/sign_up/signup.dart';
import 'package:ggo/navigation_menu.dart';
import 'package:ggo/utils/constants/sizes.dart';
import 'package:ggo/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class GLoginForm extends StatelessWidget {
  const GLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: GSizes.spaceBtwSections),
          child: Column(
            children: [
              /// Email
              TextFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right_outline), labelText: GTexts.email),
              ),
              const SizedBox(height: GSizes.spaceBtwInputFields),
                
              /// Password
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check_outline),
                  labelText: GTexts.password,
                  suffixIcon: Icon(Iconsax.eye_slash_outline),
                ),
              ),
              const SizedBox(height: 5),
                
              /// Remember Me & Forget Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Remember Me
                  Row(
                    children: [
                      SizedBox(height: 20, width: 25, child: Checkbox(value: true, onChanged: (value) {})),
                      const Text (GTexts.rememberMe, style: TextStyle(fontWeight: FontWeight.w400)),
                    ],
                  ),

                  /// Forget Password
                  TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child: const Text('Forget Password?', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 14)),)
                ],
              ),
              const SizedBox(height: 8),
                  
              /// Sing In Button
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () => Get.to(() => const NavigationMenu()), child: const Text(GTexts.signIn))), 
              const SizedBox(height: 4),
                    
              /// Not a member & Register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a member?', style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w400)),
                  TextButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text('Register now', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 15))),
                ],
              )
            ],
          ),
      )
    );
  }
}