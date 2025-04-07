import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/pages/registration_ui/registration_first_screen.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/widgets/next_container_widget.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/widgets/text_container_widget.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/widgets/three_container_widget.dart';

class ThirdUi extends StatelessWidget {
  const ThirdUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, toolbarHeight: 42.h),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          color: Colors.white,
          height: 646.h,
          width: 393.w,
          child: Column(
            children: [
              Image.asset("assets/Group.png", height: 260.h, width: 221.w),
              SizedBox(height: 89.h),
              //3 container
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
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
                  SizedBox(width: 6),
                  ThreeContainerWidget(
                    color: Color(0xFF304FFE),
                    height: 8.h,
                    width: 16.h,
                  ),
                ],
              ),
              SizedBox(height: 22.h),

              //text continer
              Container(
                height: 139.h,
                width: 393.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 17.5),

                  child: TextContainerWidget(
                    text: "Receive Money \n From Anywhere In \n The World",
                  ),
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => RegistrationFirstScreen(),
              //       ),
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
