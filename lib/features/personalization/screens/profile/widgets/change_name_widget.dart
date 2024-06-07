import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/app_bar/auth_appbar.dart';
import 'package:ggo/utils/validators/validation.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controlers/update_user_controller.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: AuthAppBar(
        showBackArrow: true,
        title: Text('Сменить имя', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(GSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Используйте настоящее имя для облегчения проверки',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: GSizes.spaceBtwSections),

            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.name,
                    validator: (value) => GValidator.validateEmptyText('Name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: GTexts.name, prefixIcon: Icon(Iconsax.user_edit_outline)),
                  )
                ],
              )
            ),

            const SizedBox(height: GSizes.spaceBtwSections),
          
            /// Save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Сохранить')),
            )
          ],
        ),
      ),
    );
  }
}