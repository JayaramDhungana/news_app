import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/pages/second_ui.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/widgets/next_container_widget.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/widgets/text_container_widget.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/widgets/three_container_widget.dart';

//https://www.figma.com/design/dyFZ6v9PgtFu3qp1O6eK6T/Coinpay-Fintech-Finance-Mobile-App-UI-kit-(Community)-(Community)?node-id=255-6065&t=FMbkkWLolwWcqMwb-0
class FirstUi extends StatelessWidget {
  const FirstUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, toolbarHeight: 42.h),
      body: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: Container(
          color: Colors.white,
          height: 646.h,
          width: 393.w,
          child: Column(
            children: [
              //mathiko
              Image.asset("assets/Trust.png", height: 260.h, width: 181.92.w),
              //Image ko Tala Khali
              SizedBox(height: 89.h),
              //tyo bhanda talako
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ThreeContainerWidget(
                    color: Color(0xFF304FFE),
                    height: 8.h,
                    width: 16.w,
                  ),

                  SizedBox(width: 6),
                  ThreeContainerWidget(
                    color: Colors.grey[200]!,
                    height: 8.h,
                    width: 37.w,
                  ),

                  SizedBox(width: 6),
                  ThreeContainerWidget(
                    color: Colors.grey[200]!,
                    height: 8.h,
                    width: 37.w,
                  ),
                ],
              ), //3 ta container sakiyo
              SizedBox(height: 24.h),
              Container(
                height: 139.h,
                width: 393.w,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  child: TextContainerWidget(
                    text:
                        "Trusted by millions\n \t of people, part of \n one part",
                  ),
                ),
              ),

              // InkWell(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => SecondUi()),
              //     );
              //   },
              //   child: NextContainerWidget(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
