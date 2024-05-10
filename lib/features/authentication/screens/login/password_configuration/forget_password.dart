import 'package:ggo/features/authentication/screens/login/password_configuration/reset_password.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:ggo/utils/constants/sizes.dart';
import 'package:ggo/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(GSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Headings
            Text(GTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: GSizes.spaceBtwItems),
            Text(GTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: 35),

            /// Text Field
            TextFormField(
              decoration: const InputDecoration(labelText: GTexts.email, prefixIcon: Icon(Iconsax.direct_right_outline)),
            ),
            const SizedBox(height: GSizes.spaceBtwSections),
            
            /// Submit Button
            SizedBox(width: double.infinity ,child: ElevatedButton(onPressed: () => Get.off(() => const ResetPassword()), child: const Text(GTexts.submit)))

          ],
        ),
      ),
    );
  }
}