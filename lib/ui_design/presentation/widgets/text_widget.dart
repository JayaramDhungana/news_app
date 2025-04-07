import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? textColor;
  final FontWeight fontWeight;
  // final double height;

  const TextWidget({
    super.key,
    required this.text,
    this.textColor,
    required this.fontWeight,
    required this.fontSize,
    // required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: 16 / 10,
      ),
    );
  }
}
