import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_using_clean_architecture/ui_design/presentation/widgets/container_widget.dart';
import 'package:news_using_clean_architecture/ui_design/presentation/widgets/members_container_widgets.dart';

import 'package:news_using_clean_architecture/ui_design/presentation/widgets/text_widget.dart';

class HomeScreenUiDesign extends StatelessWidget {
  const HomeScreenUiDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64.h,

        backgroundColor: Color(0xFFFFFFFF),
        leading: Padding(
          padding: REdgeInsets.only(top: 12, bottom: 12, left: 0, right: 8),
          child: InkWell(
            onTap: () {
              debugPrint("pressed on leading icon");
            },

            child: Container(
              height: 40.h,
              width: 40.w,
              //appbarko side ko
              child: Image.asset('assets/Icon.png', height: 12.h, width: 6.w),
            ),
          ),
        ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Group",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '10 of 50 chats',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: REdgeInsets.only(right: 20, top: 8, bottom: 8),
            child: SizedBox(
              height: 48.h,
              width: 48.w,

              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        children: [
                          SimpleDialogOption(child: Text("Thank You !!!")),
                        ],
                      );
                    },
                  );
                },
                child: Center(
                  child: Text(
                    "Next",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(255, 245, 243, 243),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.h),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 64.h,
                  width: 353.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        //'G' ko lagi
                        padding: REdgeInsets.only(
                          top: 12,
                          left: 12,
                          bottom: 8,
                          right: 8,
                        ),
                        child: SizedBox(
                          height: 44.h,
                          width: 44.w,
                          child: Stack(
                            children: [
                              Container(
                                height: 40.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD3F2D5),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: TextWidget(
                                    text: "G",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    textColor: Color(
                                      0xFF163317,
                                    ).withOpacity(0.5),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  height: 20.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF004CB5),
                                  ),
                                  child: Image.asset('assets/Fill.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Group Name ko
                      SizedBox(
                        height: 20.h,
                        width: 240.w,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Group Name",
                            hintStyle: Theme.of(context).textTheme.labelLarge,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),

                            // enabled: true,
                            isCollapsed: true,
                          ),
                          showCursor: true,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              //this is second Container
              Padding(
                padding: EdgeInsets.only(
                  top: 12,
                  bottom: 16,
                  left: 20,
                  right: 20,
                ),
                child: Container(
                  width: 353.w,
                  height: 113.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Color(0xFFFFFFFF),
                  ),
                  child: Column(
                    children: [
                      ContainerWidget(
                        leadingIcon: Image.asset(
                          'assets/stopwatch-svgrepo-com 1.png',
                          height: 17.92.h,
                          width: 16.25.h,
                        ),
                        titleText: 'Auto-Delete Message',
                        subtitleText: 'Off',
                        inerContainerHeight: 36.h,
                        textContainerHeight: 36.h,
                        titleTextHeight: 18.h,
                        titleTextWidth: 145.w,
                        leadingIconPadding: EdgeInsets.only(
                          top: 8,
                          bottom: 8,
                          right: 12,
                        ),
                      ),
                      Container(color: Colors.black, height: 0.5),

                      ContainerWidget(
                        leadingIcon: Image.asset(
                          'assets/Vector.png',
                          height: 17.92.h,
                          width: 16.25.h,
                        ),
                        titleText: 'Group Permission',
                        subtitleText: '',
                        inerContainerHeight: 20.h,
                        textContainerHeight: 30.h,
                        titleTextHeight: 20.h,
                        titleTextWidth: 117.w,
                        leadingIconPadding: EdgeInsets.only(right: 12, top: 2),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Color(0xFFFFFFFF),
                height: 752.h,
                width: 393.w,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SizedBox(
                        height: 16.h,
                        width: 393.w,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            child: Text(
                              "Members",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(child: MembersContainerWidget()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
