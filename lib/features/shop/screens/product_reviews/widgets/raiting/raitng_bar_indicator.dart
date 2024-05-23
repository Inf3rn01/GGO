import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../../utils/constants/colors.dart';

class GRaitingBarIndicator extends StatelessWidget {
  const GRaitingBarIndicator({super.key, required this.raiting});

  final double raiting;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
            rating: raiting,
            itemSize: 17,
            unratedColor: GColors.grey,
            itemBuilder: (_, __) => const Icon(HeroIcons.star, color: Colors.amber)
    );
  }
}