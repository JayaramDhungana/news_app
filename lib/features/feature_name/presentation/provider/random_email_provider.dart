import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/core/utils/shared_preferences_helper.dart';
import 'package:news_using_clean_architecture/features/feature_name/data/models/random_email_model.dart';

class RandomEmailProvider extends ChangeNotifier {
  Dio dio = Dio();
  List<RandomEmailModel> randomEmail = [];
  List<RandomEmailModel> favoriteRandomEmail = [];
  List<String> favoriteEmailForSharedPrefrences = [];

  //To fetch the random email and store to the List
  Future<void> fetchRandomEmail() async {
    try {
      final uri = "https://jsonplaceholder.typicode.com/comments";
      final response = await dio.get(uri);
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        randomEmail =
            (response.data as List)
                .map((a) => RandomEmailModel.fromJson(a))
                .toList();
        notifyListeners();
      } else {
        debugPrint("Error is Occured");
      }
    } catch (e) {
      debugPrint("The erro is $e");
    }
    notifyListeners();
  }

  //To Store favorite Random Email
  Future<void> storeFavoriteEmail(String favoriteEmail) async {
    favoriteRandomEmail.add(
      RandomEmailModel(
        postId: null,
        id: null,
        name: null,
        email: favoriteEmail,
        body: null,
      ),
    );

    SharedPreferencesHelper.addFavoriteEmail(favoriteEmail);

    notifyListeners();
  }

  Future<void> deleteFavoriteEmail(String favoriteEmail) async {
    favoriteRandomEmail.removeWhere((a) => a.email == favoriteEmail);
    favoriteRandomEmail.toList();
    notifyListeners();

    SharedPreferencesHelper.removefavoriteEmail(favoriteEmail);

    notifyListeners();
  }

  //*****************************Shared Preferences ko use ko lagi provider ******/
  Future<void> showFavoriteEmailSharedPreferences() async {
    favoriteEmailForSharedPrefrences =
        await SharedPreferencesHelper.showfavoriteEmail();
    notifyListeners();
  }

  Future<void> removeFavoriteEmailSharedPreferences(
    String emailToRemove,
  ) async {
    favoriteEmailForSharedPrefrences =
        await SharedPreferencesHelper.removefavoriteEmail(emailToRemove);

    notifyListeners();
  }
}

final randomEmailProvider = ChangeNotifierProvider<RandomEmailProvider>((ref) {
  return RandomEmailProvider();
});
