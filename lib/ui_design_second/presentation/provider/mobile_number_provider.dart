import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobileNumberProvider extends ChangeNotifier {
  String mobileNumber = '';
  String contryCode = '';

  void getMobileNumber(String mobileNumberFromUI, String contryCodeFromUI) {
    contryCode = contryCodeFromUI;
    String mobileNumberWithContryCode = contryCode + mobileNumberFromUI;
    mobileNumber = mobileNumberWithContryCode;
    debugPrint(mobileNumber);
    debugPrint("Contry Code is $contryCodeFromUI");
    notifyListeners();
  }
}

final mobileNumberProvider = ChangeNotifierProvider<MobileNumberProvider>((
  ref,
) {
  return MobileNumberProvider();
});
