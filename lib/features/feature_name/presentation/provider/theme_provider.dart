import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/core/utils/shared_preferences_helper.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData themeToChange = lightTheme;

  Future<void> changeThemes(ThemeData themeToChangeRequest) async {
    themeToChange = themeToChangeRequest;

    if (themeToChange == darkTheme) {
      SharedPreferencesHelper.addThemeData(true);
    } else {
      SharedPreferencesHelper.addThemeData(false);
    }

    notifyListeners();
  }

  Future<void> initialTheme() async {
    themeToChange =
        await SharedPreferencesHelper.showThemeData() ? darkTheme : lightTheme;
    notifyListeners();
  }
}

final themeProvider = ChangeNotifierProvider<ThemeProvider>(((ref) {
  return ThemeProvider();
}));
