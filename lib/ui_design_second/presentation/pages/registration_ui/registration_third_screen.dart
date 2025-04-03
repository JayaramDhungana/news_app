import 'package:flutter/material.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/pages/registration_ui/registration_fourth_screen.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/widgets/log_in_container_widget.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/widgets/progress_container_widget.dart';
import 'package:pinput/pinput.dart';

class RegistrationThirdScreen extends StatelessWidget {
  const RegistrationThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Column(
        children: [
          ProgressContainerWidget(width: 30),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Confirm your phone",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  "We send 6 digits code to +8811720 84 57 57",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Pinput(
            length: 6,
            defaultPinTheme: PinTheme(
              width: 40,
              height: 40,
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.blue)),
              ),
            ),
          ),

          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn't get a code?",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Resend",
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(color: Colors.blue),
                ),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: LogInContainerWidget(
              text: 'Verify Your Number',
              color: Colors.grey,
              textColor: Colors.white,
              borderColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
