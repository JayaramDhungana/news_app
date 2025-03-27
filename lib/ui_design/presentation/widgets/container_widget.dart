import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_using_clean_architecture/ui_design/presentation/widgets/text_widget.dart';

class ContainerWidget extends StatelessWidget {
  final Image leadingIcon;
  final String titleText;
  final String? subtitleText;
  final double inerContainerHeight;

  const ContainerWidget({
    super.key,
    required this.leadingIcon,
    required this.titleText,
    this.subtitleText,
    required this.inerContainerHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353.w,
      height: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFFFFFFFF),
      ),
      child:
      //first row ko left side ko
      Row(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 10),
            //Icon ra text ko
            child: Container(
              height: inerContainerHeight,
              width: 283.w,
              child: Row(
                children: [
                  //Imageko ko lagi
                  Padding(
                    padding: REdgeInsets.only(top: 8, bottom: 8, right: 12),
                    child: SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: Center(child: leadingIcon),
                    ),
                  ),

                  //Image sakiyo aba text
                  SizedBox(
                    height: 99.h,
                    width: 250.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titleText,
                          style: Theme.of(
                            context,
                          ).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1D1E1F),
                          ),
                        ),
                        Text(
                          subtitleText ?? '',
                          style: Theme.of(
                            context,
                          ).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF525556),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //last ko back icon
          Padding(
            padding: REdgeInsets.only(
              top: 18,
              bottom: 18,
              // left: 10,
              // right: 20,
            ),
            child: SizedBox(
              height: 20.h,
              width: 20.w,
              child: Center(
                child: Image.asset(
                  'assets/back_icon.png',
                  height: 10.h,
                  width: 5.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
