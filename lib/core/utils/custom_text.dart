import 'package:flutter/material.dart';

class CText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontsize;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final bool isSelectable;
  const CText(
    this.text,
    {
    super.key,
  
    this.textColor = Colors.black,
    this.fontsize = 15.0,
    this.fontWeight = FontWeight.normal,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
    this.isSelectable=true,
  });

  @override
  Widget build(BuildContext context) {
    return isSelectable? SelectableText(
      textAlign: textAlign,
      text,
      style: TextStyle(
          color: textColor,
          fontSize: fontsize,
          fontWeight: fontWeight,
          
          overflow: overflow),
    ):
    Text(
      textAlign: textAlign,
      text,
      style: TextStyle(
          color: textColor,
          fontSize: fontsize,
          fontWeight: fontWeight,
          
          overflow: overflow),
    );
  }
}
