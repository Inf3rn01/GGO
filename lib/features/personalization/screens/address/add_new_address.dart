import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/app_bar/auth_appbar.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../utils/constants/sizes.dart';


class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar(showBackArrow: true, title: Text('Add new address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Form( 
            child: Column(
              children: [
        
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global_outline), labelText: 'Country'))),
                  ],
                ),

                const SizedBox(height: GSizes.spaceBtwInputFields),

                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_outline), labelText: 'City'))), 
                    const SizedBox(width: GSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(BoxIcons.bx_building), labelText: 'Street'))),
                  ],
                ),

                const SizedBox(height: GSizes.spaceBtwInputFields),
                
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.house_outline), labelText: 'house'))),
                    const SizedBox(width: GSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity_outline), labelText: 'Apartment'))),
                  ],
                ),

                const SizedBox(height: GSizes.defaultSpace),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){}, child: const Text('Save')),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}