import 'package:flutter/material.dart';

class GProductTitleText extends StatelessWidget {
  const GProductTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
    });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize ? const TextStyle(fontSize: 15, fontWeight: FontWeight.w500) : const TextStyle(fontSize: 21, fontWeight: FontWeight.w500) ,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}