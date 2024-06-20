import 'package:ggo/features/authentication/controlers/sign_up/signup_controller.dart';
import 'package:ggo/utils/constants/sizes.dart';
import 'package:ggo/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:ggo/utils/validators/validation.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../utils/constants/colors.dart';
import 'widgets/terms_conditions_checkbox.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final darkTheme = GHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            FontAwesome.arrow_left_solid,
            color: darkTheme ? GColors.white : GColors.dark,
            size: 22,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth > 600 ? 50 : 15,
              ),
              child: Form(
                key: controller.signupFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Title
                    Text(
                      GTexts.singupTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: GSizes.spaceBtwSections),

                    /// Name
                    TextFormField(
                      controller: controller.name,
                      validator: (value) => GValidator.validateEmptyText('Имя', value),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user_outline),
                        labelText: 'Имя',
                      ),
                    ),
                    const SizedBox(height: GSizes.spaceBtwInputFields),

                    /// Phone Number
                    TextFormField(
                      controller: controller.phoneNumber,
                      validator: (value) => GValidator.validateNumberPhone(value),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.call_outline),
                        labelText: GTexts.phoneNum,
                      ),
                    ),
                    const SizedBox(height: GSizes.spaceBtwInputFields),

                    /// Email
                    TextFormField(
                      controller: controller.email,
                      validator: (value) => GValidator.validateEmail(value),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(EvaIcons.email_outline),
                        labelText: GTexts.email,
                      ),
                    ),
                    const SizedBox(height: GSizes.spaceBtwInputFields),

                    /// Password
                    Obx(
                      () => TextFormField(
                        controller: controller.password,
                        obscureText: controller.hidePassword.value,
                        validator: (value) => GValidator.validatePassword(value),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.password_check_outline),
                          labelText: GTexts.password,
                          suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                            icon: Icon(
                              controller.hidePassword.value
                                  ? Iconsax.eye_slash_outline
                                  : Iconsax.eye_outline,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: GSizes.spaceBtwInputFields),

                    /// Terms & Conditions
                    const TermsConditionsCheckbox(),
                    const SizedBox(height: 10),

                    /// Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller.signup(),
                        child: const Text("Зарегистрироваться"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}