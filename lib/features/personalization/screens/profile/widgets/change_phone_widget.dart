import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/app_bar/auth_appbar.dart';
import 'package:ggo/utils/validators/validation.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controlers/update_phone_controller.dart';

class ChangePhoneScreen extends StatelessWidget {
  const ChangePhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdatePhoneController());
    return Scaffold(
      appBar: AuthAppBar(
        showBackArrow: true,
        title: Text('Сменить номер телефона', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(GSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Используйте ваш личный номер телефона для улучшения взаимосвязи с нами',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: GSizes.spaceBtwSections),

            Form(
              key: controller.updatePhoneFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.phone,
                    validator: (value) => GValidator.validateNumberPhone(value),
                    decoration: const InputDecoration(labelText: GTexts.phoneNum, prefixIcon: Icon(Iconsax.call_outline)),
                  )
                ],
              )
            ),

            const SizedBox(height: GSizes.spaceBtwSections),
          
            /// Save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updatePhone(), child: const Text('Сохранить')),
            )
          ],
        ),
      ),
    );
  }
}