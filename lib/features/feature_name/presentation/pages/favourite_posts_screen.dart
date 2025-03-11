import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/core/utils/shared_preferences_helper.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/posts_provider.dart';
import 'package:news_using_clean_architecture/features/feature_name/data/models/posts_model.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/text_widget.dart';

class FavoritePostsScreen extends ConsumerStatefulWidget {
  const FavoritePostsScreen({super.key});

  @override
  _FavoritePostsScreenState createState() => _FavoritePostsScreenState();
}

class _FavoritePostsScreenState extends ConsumerState<FavoritePostsScreen> {
  late Future<List<int>> favoritePostIds;

  @override
  void initState() {
    super.initState();
    // Get the list of favorite post IDs from SharedPreferences
    favoritePostIds = SharedPreferencesHelper.getFavoritePosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(text: 'Favorite Posts', color: Colors.black, size: 20),
      ),
      body: FutureBuilder<List<int>>(
        future: favoritePostIds,
        builder: (context, snapshot) {
          // Check for loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Handle error state
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Handle empty favorite posts
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No favorite posts yet.'));
          }

          // Get the favorite post IDs
          List<int> favoritePosts = snapshot.data!;

          // Access the posts from the postsProvider
          final postsState = ref.watch(postsProvider);
          final posts = postsState.posts;

          return ListView.builder(
            itemCount: favoritePosts.length,
            itemBuilder: (context, index) {
              final postId = favoritePosts[index];

              // Find the post using the post ID
              final post = posts.firstWhere(
                (post) => post.id == postId,
                orElse: () => PostsModel(id: postId, title: 'No Title', body: 'No Body'),
              );

              return ListTile(
                leading: CircleAvatar(
                  child: Text(post.id.toString()),
                ),
                title: TextWidget(
                  text: post.title ?? 'No Title',
                  color: Colors.black,
                  size: 20,
                ),
                subtitle: TextWidget(
                  text: post.body ?? 'No body',
                  color: Colors.black,
                  size: 15,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
