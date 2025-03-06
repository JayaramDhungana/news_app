import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final bool isBold;
  final bool isOverFlow;
  final int? maxlines;
  const TextWidget({
    super.key,
    required this.text,
    required this.color,
    required this.size,
    this.isBold = false,
    this.isOverFlow = false,
    this.maxlines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),

      overflow: isOverFlow ? TextOverflow.ellipsis : null,
      maxLines: isOverFlow ? maxlines : null,
    );
  }
}
