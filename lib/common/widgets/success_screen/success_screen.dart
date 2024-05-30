import 'package:flutter/material.dart';

import 'package:ggo/common/styles/spacing_styles.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: GSpacingStyle.paddingWithAppBarHeigth,
          child: Column(
            children: [
              /// Image
              Lottie.asset(image, width: GHelperFunctions.screenWidth() * 0.8),

              /// Title & SubTitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: GSizes.spaceBtwItems),
              Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: 27),
              
              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: onPressed, child: const Text(GTexts.gContinue))
              ),
            ],
          ),
        ),
      ),
    );
  }
}