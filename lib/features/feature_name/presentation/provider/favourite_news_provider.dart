import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/core/utils/shared_preferences_helper.dart';
import 'package:news_using_clean_architecture/features/feature_name/data/models/favourite_news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteNewsProvider extends ChangeNotifier {
  //Making a List Variable to add favourite news
  List<FavouriteNewsModel> favouriteNews = [];
  static const String newsFavoritesKey = 'favorite_news';
  List<String> favoriteNewsTitle = [];

  //Making a Function to to add and delete favourite News
  Future<void> addToFavouriteNews(
    String name,
    String author,
    String title,
    String description,
    String urlToImage,
    String publishdedAt,
  ) async {
    favouriteNews = [
      ...favouriteNews,
      FavouriteNewsModel(
        name: name,
        author: author,
        title: title,
        description: description,
        urlToImage: urlToImage,
        publishedAt: publishdedAt,
      ),
    ];
    notifyListeners();
    print(title);
    //Yesle chai directly  yo list shared preference ma add garauxa.
    SharedPreferencesHelper.addToFavoriteNews(title,urlToImage);
  }

  Future<void> deleteFavouriteNews(String title) async {
    favouriteNews.removeWhere((a) => a.title == title);
    favouriteNews.toList();
    notifyListeners();
  }

  //for using Shared PReference
  Future<void> loadFavoriteNews() async {
    final prefs = await SharedPreferences.getInstance();

    final favoriteNewsFromSharedPreference =
        await SharedPreferencesHelper.showFavoriteNews();
    debugPrint(favoriteNewsFromSharedPreference.toString());

    favoriteNewsTitle = favoriteNewsFromSharedPreference;
    notifyListeners();
  }
}

final favouriteNewsProvider = ChangeNotifierProvider((ref) {
  return FavouriteNewsProvider();
});
