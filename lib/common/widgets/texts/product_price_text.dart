import 'package:flutter/material.dart';

class GProductPriceText extends StatelessWidget {
  const GProductPriceText({
    super.key,
    this.currencySign = '\$',
    required this.price,
    this.isLarge = false,
    this.maxLines = 1,
    this.lineThrough = false,
    });

  final String currencySign, price;
  final int maxLines;
  final bool lineThrough, isLarge;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
        ? TextStyle(fontSize: 24, fontWeight: FontWeight.w600, decoration: lineThrough ? TextDecoration.lineThrough : null)
        : TextStyle(fontSize: 21, fontWeight: FontWeight.w600, decoration: lineThrough ? TextDecoration.lineThrough : null) 
    );
  }
}