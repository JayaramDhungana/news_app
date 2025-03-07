import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/features/feature_name/data/models/all_news_model.dart';

class AllNewsProvider extends ChangeNotifier {
  Dio dio = Dio();
  List<AllNewsModel> allNews = [];

  Future<void> fetchAllNews() async {
    try {
      final uri =
          "https://newsapi.org/v2/everything?q=bitcoin&apiKey=b54cfe8c6cc64318943f514f585588c2";
      final response = await dio.get(uri);
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        allNews =
            (response.data['articles'] as List)
                .map((a) => AllNewsModel.fromJson(a))
                .toList();
      }
    } catch (e) {
      debugPrint("The error is $e");
    }
    notifyListeners();
  }
}

final allNewsProvider = ChangeNotifierProvider<AllNewsProvider>((ref) {
  return AllNewsProvider();
});
