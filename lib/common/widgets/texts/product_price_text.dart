import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  const ProductPriceText({
    super.key,
    this.currencySign = '\$',
    required this.price,
    this.size = 20,
    this.maxLines = 1,
    this.lineThrough = false,
    this.fontWeight = FontWeight.w500,
  });

  final String currencySign, price;
  final int maxLines;
  final double size;
  final bool lineThrough;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        decoration: lineThrough ? TextDecoration.lineThrough : null,
      ),
    );
  }
}