import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class SuccessOrderScreen extends StatelessWidget {
  const SuccessOrderScreen({super.key, required this.title, required this.subTitle, required this.onPressed});

  final String title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 250, horizontal: 50),
          child: Column(
            children: [

              /// Image
              const Icon(Iconsax.truck_outline, color: GColors.grey, size: 42),
              const SizedBox(height: 6),

              /// Title & SubTitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: GSizes.spaceBtwItems / 2),
              Text(subTitle, style: const TextStyle(fontSize: 14, color: GColors.darkGrey), textAlign: TextAlign.center),
              const SizedBox(height: 18),
              
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