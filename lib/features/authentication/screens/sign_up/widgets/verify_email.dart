import 'package:ggo/common/widgets/success_screen/success_screen.dart';
import 'package:ggo/features/authentication/screens/login/login.dart';
import 'package:ggo/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/utils/constants/images_strings.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final darkTheme = GHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LoginScreen()),
          icon: const Icon(CupertinoIcons.clear),
          color: darkTheme ? GColors.white : GColors.dark)
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(GSizes.defaultSpace),
              child: Column(
                children: [
                  /// Image
                  //Image(image: const AssetImage(GImages.emailSend), width: GHelperFunctions.screenWidth() * 0.6),
                  const SizedBox(height: GSizes.spaceBtwSections),

                  /// Title & SubTitle
                  Text(GTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
                  const SizedBox(height: 13),
                  const Text('YourEmail.com', style: TextStyle(fontSize: 12.3), textAlign: TextAlign.center),
                  const SizedBox(height: 13),
                  Text(GTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
                  const SizedBox(height: 35),
                  
                  /// Buttons
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Get.to(
                        () => SuccessScreen(
                          image: GImages.successSticker,
                          title: GTexts.yourAccountCreatedTitle,
                          subTitle: GTexts.yourAccountCreatedSubTitle,
                          onPressed: () => Get.to(() => const LoginScreen()),
                        ),
                      ),
                    child: const Text(GTexts.gContinue)),
                  ),
                  const SizedBox(height: 5),
                  
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(onPressed: (){},child: const Text(GTexts.resendEmail, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 13.5)))),
                ],
              ),
          ),
      ),
    );
  }
}
