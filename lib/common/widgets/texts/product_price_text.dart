import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  const ProductPriceText({
    super.key,
    this.currencySign = '\$',
    required this.price,
    this.size = 20,
    this.maxLines = 1,
    this.lineThrough = false,
    });

  final String currencySign, price;
  final int maxLines;
  final double size;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: size, fontWeight: FontWeight.w600, decoration: lineThrough ? TextDecoration.lineThrough : null)
    );
  }
}