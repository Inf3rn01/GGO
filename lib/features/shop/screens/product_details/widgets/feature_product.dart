import 'package:flutter/material.dart';

import '../../../models/product_features_model.dart';

class FeaturesProduct extends StatelessWidget {
  const FeaturesProduct({super.key, required this.features});

  final List<ProductFeaturesModel> features;

  @override
  Widget build(BuildContext context) {
    print('Features: $features');
    return Column(
      children: features.map((feature) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${feature.id}:', // id в качестве названия характеристики
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(
                  feature.features.values.first.toString(), // первое значение из Map в качестве значения характеристики
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            const SizedBox(height: 5),
          ],
        );
      }).toList(),
    );
  }
}