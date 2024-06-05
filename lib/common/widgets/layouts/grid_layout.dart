import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class GGridLayout extends StatelessWidget {
  const GGridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuiler,
    this.mainAxisExtent = 247.7,
  });

  final int itemCount;
  final double mainAxisExtent;
  final Widget Function(BuildContext, int) itemBuiler;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 8),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: mainAxisExtent,
        mainAxisSpacing: GSizes.gridViewSpacing,
        crossAxisSpacing: GSizes.gridViewSpacing,
      ),
      itemBuilder: itemBuiler,
    );
  }
}