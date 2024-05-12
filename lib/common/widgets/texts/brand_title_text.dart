import 'package:flutter/material.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
    super.key,
    this.color,
    this.maxLines = 1,
    required this.title,
    this.textAlign = TextAlign.center,
    this.brandTextSizeSmall = false,
    });

    final Color? color;
    final String title;
    final int maxLines;
    final TextAlign? textAlign;
    final bool brandTextSizeSmall;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: brandTextSizeSmall ? TextStyle(fontSize: 15.7, color: color) : TextStyle(fontSize: 20, color: color),
    );
  }
}