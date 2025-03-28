import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_using_clean_architecture/ui_design/data/members_model.dart';

class MembersContainerWidget extends StatelessWidget {
  const MembersContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<MembersModel> membersData = [
      MembersModel(
        memberImageLocation: 'assets/AF.png',
        memberName: 'Ranjit Shrestha',
        memberContact: '+977 9814017327',
        trailingIcon: 'assets/_Toggle base.png',
      ),
      MembersModel(
        memberImageLocation: 'assets/AF.png',
        memberName: 'Ranjit Shrestha',
        memberContact: '+977 9814017327',
        trailingIcon: 'assets/_Toggle base.png',
      ),
      MembersModel(
        memberImageLocation: 'assets/AF (1).png',
        memberName: 'Jean Bonds',
        memberContact: '+1 46545645645',
        trailingIcon: 'assets/_Toggle base.png',
      ),
      MembersModel(
        memberImageLocation: 'assets/AF (1).png',
        memberName: 'Jean Bonds',
        memberContact: '+1 46545645645',
        trailingIcon: 'assets/_Toggle base.png',
      ),
      MembersModel(
        memberImageLocation: 'assets/AF (2).png',
        memberName: 'Raily Hopes',
        memberContact: '+61 314017327',
        trailingIcon: 'assets/Toggle.png',
      ),
      MembersModel(
        memberImageLocation: 'assets/AF (2).png',
        memberName: 'Raily Hopes',
        memberContact: '+61 314017327',
        trailingIcon: 'assets/Toggle.png',
      ),
      MembersModel(
        memberImageLocation: 'assets/AF (3).png',
        memberName: 'Andy Thomas',
        memberContact: '+45 4017327',
        trailingIcon: 'assets/Toggle.png',
      ),
      MembersModel(
        memberImageLocation: 'assets/AF (3).png',
        memberName: 'Andy Thomas',
        memberContact: '+45 4017327',
        trailingIcon: 'assets/Toggle.png',
      ),
    ];
    return Container(
      child: ListView.builder(
        itemCount: membersData.length,
        itemBuilder: (context, index) {
          final membersDataforShow = membersData[index];
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
                    right: 135,
                  ),
                  child: Container(
                    height: 40.h,

                    width: 170.w,
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(fontWeight: FontWeight.w500),
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
                      ],
                    ),
                  ),
                ),

                //Trailing Icon
                Padding(
                  padding: const EdgeInsets.only(
                    top: 14,
                    bottom: 14,
                    right: 20,
                  ),
                  child: Image(
                    image: AssetImage(membersDataforShow.trailingIcon),
                  ),
                ),
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
    );
  }
}
