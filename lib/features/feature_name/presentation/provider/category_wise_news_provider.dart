import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/features/feature_name/data/models/category_wise_news_model.dart';

class CategoryWiseNewsProvider extends ChangeNotifier {
  Dio dio = Dio();

  List<CategoryWiseNewsModel> categoryWiseNews = [];

  Future<void> fetchCategoryWiseNews(String category) async {
    try {
      final uri =
          "https://newsapi.org/v2/top-headlines?category=$category&apiKey=b54cfe8c6cc64318943f514f585588c2";
      final response = await dio.get(uri);
      if (response.statusCode == 200) {
        categoryWiseNews =
            (response.data['articles'] as List)
                .map((a) => CategoryWiseNewsModel.fromJson(a))
                .toList();
      } else {
        debugPrint("The Error is occured");
      }
    } catch (e) {
      debugPrint("The error is $e");
    }

    notifyListeners();
  }
}

final categoryWiseNewsProvider = ChangeNotifierProvider((ref) {
  return CategoryWiseNewsProvider();
});
