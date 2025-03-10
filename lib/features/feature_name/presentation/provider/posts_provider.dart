import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/features/feature_name/data/models/posts_model.dart';

class PostsProvider extends ChangeNotifier {
  List<PostsModel> posts = [];

  Future<void> fetchPosts() async {
    try {
      Dio dio = Dio();
      final uri = 'https://jsonplaceholder.typicode.com/posts';
      final response = await dio.get(uri);
      if (response.statusCode == 200) {
        posts =
            (response.data as List).map((a) => PostsModel.fromJson(a)).toList();
      } else {
        debugPrint(
          "There is error and statuscode is ${response.statusCode.toString}",
        );
      }
    } catch (e) {
      debugPrint("The errror is $e");
    }
    notifyListeners();
  }
}

final postsProvider = ChangeNotifierProvider<PostsProvider>((e) {
  return PostsProvider();
});
