import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_using_clean_architecture/ui_design/data/members_model.dart';
import 'package:news_using_clean_architecture/ui_design/presentation/provider/members_provider.dart';

class MembersContainerWidget extends ConsumerStatefulWidget {
  const MembersContainerWidget({super.key});

  @override
  ConsumerState<MembersContainerWidget> createState() =>
      _MembersContainerWidgetState();
}

class _MembersContainerWidgetState
    extends ConsumerState<MembersContainerWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(trailingIconProvider).loadMembersData();
  }

  @override
  Widget build(BuildContext context) {
    final membersDataListFromProvider = ref.watch(trailingIconProvider);
    final iconChangedFromProvider = ref.watch(trailingIconProvider).changedIcon;
    return SingleChildScrollView(
      child: Container(
        height: 400.h,
        child: ListView.builder(
          itemCount: membersDataListFromProvider.membersData.length,
          itemBuilder: (context, index) {
            final membersDataforShow =
                membersDataListFromProvider.membersData[index];

            bool isIconChanged = iconChangedFromProvider.contains(
              membersDataforShow.id,
            );
            return Container(
              color: Colors.white,
              height: 60.h,
              width: 393.w,

              child: Row(
                children: [
                  //Image,name ra number wala container
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 10,
                      bottom: 10,
                      // right: 135,
                    ),
                    child: InkWell(
                      onTap: () {
                        debugPrint("pressed in Icon");
                        ref
                            .read(trailingIconProvider)
                            .changeIcon(
                              AssetImage(membersDataforShow.trailingIcon),
                              membersDataforShow.id,
                            );
                      },
                      child: Container(
                        height: 40.h,
                        // color: Colors.black,
                        width: 330.w,
                        child: Row(
                          children: [
                            //agadiko image
                            CircleAvatar(
                              child: Image.asset(
                                membersDataforShow.memberImageLocation,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            //Aba Name ra Contact,
                            Container(
                              width: 118.w,
                              height: 38.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //name ko lagi sized box
                                children: [
                                  //name ko lagi sized box
                                  SizedBox(
                                    height: 18.h,
                                    width: 100.w,
                                    child: Text(
                                      membersDataforShow.memberName,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelMedium!.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2.h),

                                  //number ko lagi Sized Box
                                  SizedBox(
                                    height: 18.h,
                                    width: 118.w,
                                    child: Text(
                                      membersDataforShow.memberContact,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelMedium!.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF838485),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //Trailing Icon
                            Padding(
                              padding: const EdgeInsets.only(
                                // top: 14,
                                // bottom: 14,
                                right: 20,
                                left: 135,
                              ),
                              child: InkWell(
                                onTap: () {
                                  debugPrint("pressed in Icon");
                                  ref
                                      .read(trailingIconProvider)
                                      .changeIcon(
                                        AssetImage(
                                          membersDataforShow.trailingIcon,
                                        ),
                                        membersDataforShow.id,
                                      );
                                },

                                child: Image(
                                  image:
                                      isIconChanged
                                          ? AssetImage(
                                            'assets/_Toggle base.png',
                                          )
                                          : AssetImage('assets/Toggle.png'),
                                  //  AssetImage(membersDataforShow.trailingIcon),
                                  // trailingIconFromProvider.trailingIcon,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // //Trailing Icon
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     top: 14,
                  //     bottom: 14,
                  //     right: 20,
                  //   ),
                  //   child: InkWell(
                  //     onTap: () {
                  //       debugPrint("pressed in Icon");
                  //       ref
                  //           .read(trailingIconProvider)
                  //           .changeIcon(
                  //             AssetImage(membersDataforShow.trailingIcon),
                  //             membersDataforShow.id,
                  //           );
                  //     },

                  //     child: Image(
                  //       image:
                  //           isIconChanged
                  //               ? AssetImage('assets/_Toggle base.png')
                  //               : AssetImage('assets/Toggle.png'),
                  //       //  AssetImage(membersDataforShow.trailingIcon),
                  //       // trailingIconFromProvider.trailingIcon,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            );

            // return ListTile(
            //   leading: CircleAvatar(
            //     backgroundImage: AssetImage(
            //       membersDataforShow.memberImageLocation,
            //     ),
            //   ),
            //   title: Text(membersDataforShow.memberName),
            //   subtitle: Text(membersDataforShow.memberContact),
            //   trailing: Image.asset(membersDataforShow.trailingIcon),
            // );
          },
        ),
      ),
    );
  }
}
