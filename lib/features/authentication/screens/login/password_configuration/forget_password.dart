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
          icon: Icon(
          FontAwesome.arrow_left_solid, color: darkTheme ? GColors.white : GColors.dark, size: 22),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(GSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///Headings
            Text(GTexts.forgetPasswordTitle, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: darkTheme ? GColors.white : GColors.dark)),
            const SizedBox(height: GSizes.spaceBtwItems/1.5),
            const Text(GTexts.forgetPasswordSubTitle, style: TextStyle(fontSize: 13, color: GColors.darkGrey), textAlign: TextAlign.center),
            const SizedBox(height: 25),

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