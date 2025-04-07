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
   PostsModel getPostById(int postId) {
    return posts.firstWhere((post) => post.id == postId, orElse: () => throw Exception('Post not found'));
  }
}

final postsProvider = ChangeNotifierProvider<PostsProvider>((e) {
  return PostsProvider();
});

// favoritePostsProvider ko declaration
final favoritePostsProvider = StateProvider<Map<int, bool>>((ref) {
  return {}; // Initial empty map
});

