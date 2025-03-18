import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/core/utils/shared_preferences_helper.dart';
import 'package:news_using_clean_architecture/features/feature_name/data/models/joke_model.dart';

class RandomJokeProvider extends ChangeNotifier {
  Dio dio = Dio();
  List<JokeModel> joke = [];
  List<String> favoriteJokesTitle = [];

  Map<String, bool> favoriteJokes = {}; // Manage favorite jokes here

  Future<void> fetchJoke() async {
    try {
      final uri = 'https://v2.jokeapi.dev/joke/Any';
      final response = await dio.get(uri);

      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200) {
        if (response.data is Map<String, dynamic>) {
          var data = response.data;
          joke = [JokeModel.fromJson(data)];
        } else {
          debugPrint("Unexpected data format");
        }
      } else {
        debugPrint("Error occurred");
      }
    } catch (e) {
      debugPrint("The error is $e");
    }
    notifyListeners();
  }

  Future<void> showFavoriteJokes() async {
    favoriteJokesTitle = await SharedPreferencesHelper.showJokes();
    notifyListeners();
  }

  Future<void> removeFavoriteJoke(String joke) async {
    await SharedPreferencesHelper.removeJokesFromFavorite(joke);
    await showFavoriteJokes();
  }

  Future<void> loadFavoriteJokes() async {
    final favoriteJokesTitles = await SharedPreferencesHelper.showJokes();
    final Map<String, bool> favoriteMap = {};

    for (final jokeTitle in favoriteJokesTitles) {
      favoriteMap[jokeTitle] = true;
    }

    favoriteJokes = favoriteMap;
    notifyListeners();
  }

  Future<void> toggleFavoriteJokes(String jokeTitle) async {
    bool isJokeFavorite = await SharedPreferencesHelper.isJokeFavorite(
      jokeTitle,
    );

    if (isJokeFavorite) {
      await SharedPreferencesHelper.removeJokesFromFavorite(jokeTitle);

      favoriteJokes.remove(jokeTitle);
    } else {
      
      await SharedPreferencesHelper.addJokeToFavorite(jokeTitle);
    
      favoriteJokes[jokeTitle] = true;
    }

    notifyListeners();
  }
}

final randomJokeProvider = ChangeNotifierProvider<RandomJokeProvider>((ref) {
  return RandomJokeProvider();
});
