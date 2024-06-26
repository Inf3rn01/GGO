import 'package:ggo/features/authentication/controlers/login/login_controller.dart';
import 'package:ggo/features/authentication/screens/login/password_configuration/forget_password.dart';
import 'package:ggo/features/authentication/screens/sign_up/signup.dart';
import 'package:ggo/utils/constants/sizes.dart';
import 'package:ggo/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/utils/validators/validation.dart';
import 'package:icons_plus/icons_plus.dart';

class GLoginForm extends StatelessWidget {
  const GLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: GSizes.spaceBtwSections),
          child: Column(
            children: [
              /// Email
              TextFormField(
                controller: controller.email,
                validator: (value) => GValidator.validateEmail(value),
                decoration: const InputDecoration(prefixIcon: Icon(EvaIcons.email_outline), labelText: GTexts.email),
              ),
              const SizedBox(height: GSizes.spaceBtwInputFields),
                
              /// Password
              Obx(
                  () => TextFormField(
                    controller: controller.password,
                    obscureText: controller.hidePassword.value,
                    validator: (value) => GValidator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check_outline),
                      labelText: GTexts.password,
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash_outline : Iconsax.eye_outline)
                      )
                    )
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
                      SizedBox(height: 20, width: 25, 
                        child: Obx(()=> Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value)
                        ),
                      ),
                      const Text (GTexts.rememberMe, style: TextStyle(fontWeight: FontWeight.w400)),
                    ],
                  ),

                  /// Forget Password
                  TextButton(onPressed: () => Get.to(() => ForgetPasswordScreen()), child: const Text('Забыли пароль?', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 14.3)))
                ],
              ),
              const SizedBox(height: 8),
                  
              /// Sing In Button
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () => controller.signIn(), child: const Text(GTexts.signIn))), 
              const SizedBox(height: 4),
                    
              /// Not a member & Register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Ещё не зарегистрировались?', style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w400)),
                  TextButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text('Зарегистрироваться сейчас', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 15))),
                ],
              )
            ],
          ),
      )
    );
  }
}