import 'package:flutter/material.dart';

class FeaturesProduct extends StatelessWidget {
  const FeaturesProduct({super.key, required this.features});

  final List<Map<String, String>> features;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: features.map((feature) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${feature['title']}:',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(
                  feature['value']!,
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