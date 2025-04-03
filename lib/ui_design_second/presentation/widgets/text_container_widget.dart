import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextContainerWidget extends StatelessWidget {
  final String text;
  const TextContainerWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123.h,
      width: 357.w,
      child: Center(
        child: Text(
          text,

          textAlign: TextAlign.center,
          textHeightBehavior: TextHeightBehavior(
            applyHeightToFirstAscent: true,
          ),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
