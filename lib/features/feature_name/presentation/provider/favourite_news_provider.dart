import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/features/feature_name/data/models/favourite_news_model.dart';

class FavouriteNewsProvider extends ChangeNotifier {
  //Making a List Variable to add favourite news
  List<FavouriteNewsModel> favouriteNews = [];

  //Making a Function to to add and delete favourite News
  void addToFavouriteNews(
    String name,
    String author,
    String title,
    String description,
    String urlToImage,
    String publishdedAt,
  ) {
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
  }

  void deleteFavouriteNews(String title) {
    favouriteNews.removeWhere((a) => a.title == title);
    favouriteNews.toList();
    notifyListeners();
  }
}

final favouriteNewsProvider = ChangeNotifierProvider((ref) {
  return FavouriteNewsProvider();
});
