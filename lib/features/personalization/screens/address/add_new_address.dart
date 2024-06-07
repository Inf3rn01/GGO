import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/app_bar/auth_appbar.dart';
import 'package:ggo/features/personalization/controlers/address_controller.dart';
import 'package:ggo/utils/validators/validation.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      appBar: const AuthAppBar(
        showBackArrow: true, 
        title: Text('Add new address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: controller.addressFormKey,
            child: ResponsiveBuilder(
              builder: (context, sizingInformation) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.country,
                            validator: (value) => GValidator.validateEmptyText('Country', value),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.global_outline), 
                              labelText: 'Country',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: GSizes.spaceBtwInputFields),

                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.city,
                            validator: (value) => GValidator.validateEmptyText('City', value),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building_outline), 
                              labelText: 'City',
                            ),
                          ),
                        ),
                        const SizedBox(width: GSizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            controller: controller.street,
                            validator: (value) => GValidator.validateEmptyText('Street', value),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(BoxIcons.bx_building), 
                              labelText: 'Street',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: GSizes.spaceBtwInputFields),

                    // House and Apartment Fields
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.house,
                            validator: (value) => GValidator.validateEmptyText('House', value),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.house_outline), 
                              labelText: 'House',
                            ),
                          ),
                        ),
                        const SizedBox(width: GSizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            controller: controller.apartament,
                            validator: (value) => GValidator.validateEmptyText('Apartament', value),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.activity_outline), 
                              labelText: 'Apartament',
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: GSizes.defaultSpace),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller.addNewAddress(), 
                        child: const Text('Save'),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}