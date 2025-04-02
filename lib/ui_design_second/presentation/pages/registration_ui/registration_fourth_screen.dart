import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/provider/mobile_number_provider.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/widgets/dialogue_widget.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/widgets/log_in_container_widget.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/widgets/progress_container_widget.dart';

class RegistrationFourthScreen extends ConsumerWidget {
  RegistrationFourthScreen({super.key});
  final TextEditingController textControllerForContryCode =
      TextEditingController();
  final TextEditingController textControllerForMobileNumber =
      TextEditingController();
  String contrycode = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProgressContainerWidget(width: 45),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Create an Account",
              style: Theme.of(
                context,
              ).textTheme.displayMedium!.copyWith(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Enter your mobile number to verify your account",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: 17,
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Phone", style: Theme.of(context).textTheme.labelSmall),
          ),
          //Contry code picker and mobile number
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 115,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black.withOpacity(0.5)),
                  ),
                  child: CountryCodePicker(
                    onChanged: (value) {
                      contrycode = value.toString();
                    },

                    onInit: (value) {
                      debugPrint(" Initially contry code is $value");
                      contrycode = value.toString();
                    },
                    initialSelection: 'np',
                    flagWidth: 25,
                    textStyle: TextStyle(
                      fontSize: 15,
                      height: 15 / 30,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black.withOpacity(0.5)),
                  ),
                  child: TextField(
                    controller: textControllerForMobileNumber,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      hintText: "Mobile number",
                      border: InputBorder.none,
                      hintStyle: Theme.of(
                        context,
                      ).textTheme.labelSmall!.copyWith(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Password",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Mobile Number can not be Null";
                } else {
                  return null;
                }
              },
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                prefixIconColor: Colors.black.withOpacity(0.5),
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                suffixIconColor: Colors.black.withOpacity(0.5),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogueWidget();
                  },
                );

                ref
                    .read(mobileNumberProvider)
                    .getMobileNumber(
                      textControllerForMobileNumber.text.toString(),
                      contrycode.isEmpty ? "+977" : contrycode,
                    );
              },
              child: LogInContainerWidget(
                text: 'Sign up',
                color: Colors.grey,
                textColor: Colors.black.withOpacity(0.6),
                borderColor: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
