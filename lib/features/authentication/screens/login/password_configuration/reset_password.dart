import 'package:ggo/features/authentication/controlers/forget_password/forget_password_controller.dart';
import 'package:ggo/features/authentication/screens/login/login.dart';
import 'package:ggo/utils/constants/sizes.dart';
import 'package:ggo/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {

    final darkTheme = GHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
            color: darkTheme ? GColors.white : GColors.dark)
          ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSizes.defaultSpace),
        child: Column(
          children: [
            /// Image
            //Image(image: const AssetImage(GImages.emailSend), width: GHelperFunctions.screenWidth() * 0.6),
            const SizedBox(height: GSizes.spaceBtwSections),

            /// Title & SubTitle
            Text(GTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
            const SizedBox(height: GSizes.spaceBtwItems),
            const Text(GTexts.changeYourPasswordSubTitle, style: TextStyle(fontSize: 13, color: GColors.darkGrey), textAlign: TextAlign.center),
            const SizedBox(height: 27),
            
            /// Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: ()=> Get.offAll(() => const LoginScreen()), child: const Text('Done')),
            ),
          
            SizedBox(
              width: double.infinity,
              child: TextButton(onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(GTexts.resendEmail, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 14.5)))
            ),
          ],
        ),
        ),
    );
  }
}