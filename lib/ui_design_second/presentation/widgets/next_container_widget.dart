import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextContainerWidget extends StatelessWidget {
  final String text;
  final int width;
  const NextContainerWidget({super.key, required this.text, required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.5),
      child: Container(
        height: 56.h,
        width: width.w,
        decoration: BoxDecoration(
          color: Color(0xFF304FFE),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
