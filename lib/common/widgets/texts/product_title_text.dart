import 'package:flutter/material.dart';

class GProductTitleText extends StatelessWidget {
  const GProductTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 1,
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
      style: smallSize ? const TextStyle(fontSize: 17.2, fontWeight: FontWeight.w500) :  TextStyle(fontSize: 21, fontWeight: FontWeight.w500) ,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}