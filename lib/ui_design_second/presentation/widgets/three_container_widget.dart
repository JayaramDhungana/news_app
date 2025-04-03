import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThreeContainerWidget extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  const ThreeContainerWidget({super.key, required this.color, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(19),
      ),
      height: height,
      width: width,
    );
  }
}
