import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/app_bar/auth_appbar.dart';
import 'package:ggo/features/personalization/controlers/user_controller.dart';
import 'package:ggo/utils/validators/validation.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const AuthAppBar(showBackArrow: true, title: Text('Re-authenticate user')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                /// Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: GValidator.validateEmail,
                  decoration: const InputDecoration(labelText: GTexts.email, prefixIcon: Icon(EvaIcons.email_outline)),
                ),

                const SizedBox(height: 12),

                /// Password
                Obx(
                  () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) => GValidator.validateEmptyText('Password',value),
                    decoration: InputDecoration(
                      labelText: GTexts.password,
                      prefixIcon: const Icon(Iconsax.password_check_outline),
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash_outline : Iconsax.eye_outline),
                      )
                    ),
                  )
                ),

                const SizedBox(height: 17),

                /// Login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                    child: const Text('verify') 
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}