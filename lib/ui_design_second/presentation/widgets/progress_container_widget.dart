import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressContainerWidget extends StatelessWidget {
  final double width;
  const ProgressContainerWidget({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(height: 2.h, width: width.w, color: Colors.blue),
        Container(
          color: Colors.grey.withOpacity(0.1),
          height: 2.h,
          width: (MediaQuery.of(context).size.width) - width.w,
        ),
      ],
    );
  }
}
