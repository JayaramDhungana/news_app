import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/widgets/log_in_container_widget.dart';

class RegistrationFirstScreen extends StatelessWidget {
  const RegistrationFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Container(height: 2.h, width: 15.w, color: Colors.blue),
                Container(
                  color: Colors.grey.withOpacity(0.1),
                  height: 2.h,
                  width: (MediaQuery.of(context).size.width) - 15.w,
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Image(image: AssetImage("assets/registration_first.png")),
            SizedBox(height: 30.h),
            Center(
              child: Text(
                "    \t Create your \n Coinpay account",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Coinpay is a powerful tool that allows you to easily \n\t    send, receive, and track all your transactions.",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            SizedBox(height: 20),
            LogInContainerWidget(
              text: 'Sign up',
              color: Color(0xFF304FFE),
              textColor: Colors.white,
              borderColor: Color(0xFF304FFE),
            ),
            SizedBox(height: 10),
            LogInContainerWidget(
              text: 'Sign up',
              color: Colors.white,
              textColor: Colors.blue,
              borderColor: Color(0xFF304FFE),
            ),
            SizedBox(height: 30),
            Text(
              "       By continuing you accept our\n Terms of Service and Privace Policy",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
