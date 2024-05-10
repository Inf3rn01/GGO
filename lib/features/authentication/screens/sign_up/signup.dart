import 'package:ggo/features/authentication/screens/sign_up/widgets/verify_email.dart';
import 'package:ggo/utils/constants/sizes.dart';
import 'package:ggo/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../utils/constants/colors.dart';
import 'widgets/terms_conditions_checkbox.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final darkTheme = GHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Iconsax.arrow_left_outline, color: darkTheme ? GColors.white : GColors.dark),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Title
              Text(GTexts.singupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: GSizes.spaceBtwSections),

              /// Name
              TextFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user_outline), labelText: 'Name')),
              const SizedBox(height: GSizes.spaceBtwInputFields),

              // /// Surname
              // TextFormField(
              //   decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user_outline), labelText: 'Surname')),
              // const SizedBox(height: GSizes.spaceBtwInputFields),

              // /// Patronymic
              // TextFormField(
              //   decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user_outline), labelText: 'Patronymic')),
              // const SizedBox(height: GSizes.spaceBtwInputFields),

              ///Phone Number
              TextFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.call_outline), labelText: GTexts.phoneNum)),
              const SizedBox(height: GSizes.spaceBtwInputFields),

              /// Email
              TextFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_outline), labelText: GTexts.email)),
              const SizedBox(height: GSizes.spaceBtwInputFields),
           
              /// Password
              TextFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.password_check_outline), labelText: GTexts.password, suffixIcon: Icon(Iconsax.eye_slash_outline))),
              const SizedBox(height: GSizes.spaceBtwInputFields),

              // TODO: Birth of date

              /// Terms & Conditions
              const GTermsAndConditions(),
              const SizedBox(height: 10),
                  
              /// Sign Up Button
              SizedBox(width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const VerifyEmailScreens()),
                child: const Text("Sign Up"))), 
            ],
          ),
        ),
      ),
    );
  }
}
