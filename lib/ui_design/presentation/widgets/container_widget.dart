import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_using_clean_architecture/ui_design/presentation/widgets/text_widget.dart';

class ContainerWidget extends StatelessWidget {
  final Image leadingIcon;
  final String titleText;
  final String subtitleText;
  final double inerContainerHeight;
  final double textContainerHeight;
  final double titleTextHeight;
  final double titleTextWidth;
  final EdgeInsetsGeometry leadingIconPadding;

  const ContainerWidget({
    super.key,
    required this.leadingIcon,
    required this.titleText,
    required this.subtitleText,
    required this.inerContainerHeight,
    required this.textContainerHeight,
    required this.titleTextHeight,
    required this.titleTextWidth,
    required this.leadingIconPadding,
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
                    padding: leadingIconPadding,
                    child: SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: Center(child: leadingIcon),
                    ),
                  ),

                  //Image sakiyo aba text
                  //yo text ko ho
                  SizedBox(
                    height: textContainerHeight.h,
                    width: 250.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: titleTextHeight,
                          width: titleTextWidth,
                          child: Text(
                            titleText,
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1D1E1F),
                            ),
                          ),
                        ),
                        //yo chai off bhanne text ho,
                        subtitleText.isNotEmpty
                            ? SizedBox(
                              height: 18.h,
                              width: 25.h, //21 le pugena
                              child: Text(
                                subtitleText,
                                style: Theme.of(
                                  context,
                                ).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF525556),
                                ),
                              ),
                            )
                            : SizedBox(height: 0, width: 0),
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
