import 'package:flutter/material.dart';
import 'package:ggo/features/shop/models/product_features_model.dart';

class FeaturesProduct extends StatelessWidget {
  const FeaturesProduct({super.key, required this.features});
  final ProductFeaturesModel features;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: features.features.entries.map((entry) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${entry.key}:',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Text(
                  entry.value.toString(),
                  style: const TextStyle(fontSize: 15),
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