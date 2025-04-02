import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInContainerWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Color borderColor;
  const LogInContainerWidget({
    super.key,
    required this.text,
    required this.color,
    required this.textColor, required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.5),
      child: Container(
        height: 56.h,
        width: 360.w,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: borderColor
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
