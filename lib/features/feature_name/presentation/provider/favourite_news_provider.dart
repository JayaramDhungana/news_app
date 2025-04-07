import 'dart:convert';

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

  List<String> jsonEncodedFavoriteNews = [];

  //Making a Function to to add and delete favourite News
  Future<void> addToFavouriteNews(
    String name,
    String author,
    String title,
    String description,
    String urlToImage,
    String publishedAt,
  ) async {
    favouriteNews = [
      ...favouriteNews,
      FavouriteNewsModel(
        name: name,
        author: author,
        title: title,
        description: description,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
      ),
    ];
    notifyListeners();
    print(title);
    //Yesle chai directly  yo list shared preference ma add garauxa.
    SharedPreferencesHelper.addToFavoriteNews(title, urlToImage);

    /**Now Using JsonEncode to Store All details of News */
    FavouriteNewsModel favoriteNews = FavouriteNewsModel(
      name: name,
      author: author,
      title: title,
      description: description,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
    );

    /*****************Json Encode Garnako Lagi**************** */
    /**Json Encode le chai Hamro class wa model ko value lai chai Json ma Convert garaidiyer
   *as a String ma whole json ko value pathaudo raixa
   */
    final jsonText = jsonEncode(
      {"Favorite News": favoriteNews},
      toEncodable:
          (Object? value) =>
              value is FavouriteNewsModel
                  ? FavouriteNewsModel.toJson(value)
                  : throw UnsupportedError("Can not convert to JSON:$value"),
    );

    print(jsonText);
    SharedPreferencesHelper.addJsonEncodedNews(jsonText);

    notifyListeners();
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

  //Shared PReferences use garera Banayeko title matra show garni screen ko lagi
  Future<void> removeFavoriteNewsFromSharedPreferences(
    String newsTitleForRemove,
  ) async {
    SharedPreferencesHelper.removeFavoriteNews(newsTitleForRemove.toString());
    loadFavoriteNews();
    deleteFavouriteNews(newsTitleForRemove.toString());
  }

  ///////////////////////////For Json Encoded News////////////////////////////////
  Future<void> loadJsonEncodedNews() async {
    debugPrint("Json Encoded Favorite News Before");
    jsonEncodedFavoriteNews =
        await SharedPreferencesHelper.showJsonEncodedNews();
    debugPrint("Json Encoded Data is : $jsonEncodedFavoriteNews ");
    notifyListeners();
  }

  //Delete JsonEncoded News
  Future<void> deleteJsonEncodedNews(String jsonEncodedNewsforDelete) async {
    
    jsonEncodedFavoriteNews =
        await SharedPreferencesHelper.removeJsonEncodedNews(
          jsonEncodedNewsforDelete,
        );
    notifyListeners();
  }
}

final favouriteNewsProvider = ChangeNotifierProvider((ref) {
  return FavouriteNewsProvider();
});
