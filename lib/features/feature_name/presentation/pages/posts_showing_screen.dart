import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/core/utils/shared_preferences_helper.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/pages/favourite_posts_screen.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/posts_provider.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/text_widget.dart';

// Define a state provider to manage the favorite status of posts
final favoritePostsProvider = StateProvider<Map<int, bool>>((ref) => {});

class PostsShowingScreen extends ConsumerStatefulWidget {
  const PostsShowingScreen({super.key});

  @override
  ConsumerState<PostsShowingScreen> createState() => _PostsShowingScreenState();
}

class _PostsShowingScreenState extends ConsumerState<PostsShowingScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(postsProvider).fetchPosts();

    // Load favorite posts from SharedPreferences and update the provider
    _loadFavoritePosts();
  }

  // Load the favorite posts from SharedPreferences and update the state provider
  Future<void> _loadFavoritePosts() async {
    final favoritePostIds = await SharedPreferencesHelper.getFavoritePosts();

    // Update the provider state with the favorite posts
    final Map<int, bool> favoriteMap = {};
    for (var postId in favoritePostIds) {
      favoriteMap[postId] = true; // Mark each post as favorite
    }

    // Update the favoritePostsProvider with the correct favorite status
    ref.read(favoritePostsProvider.notifier).state = favoriteMap;
  }

  // Toggle favorite status for a post
  Future<void> toggleFavorite(int postId) async {
    bool isFavorite = await SharedPreferencesHelper.isPostFavorite(postId);

    if (isFavorite) {
      await SharedPreferencesHelper.removePostFromFavorites(postId);
    } else {
      await SharedPreferencesHelper.addPostToFavorites(postId);
    }

    // After updating SharedPreferences, update the state of the post
    ref.read(favoritePostsProvider.notifier).update((state) {
      // Copy the current state and toggle the favorite status
      final updatedState = Map<int, bool>.from(state);
      updatedState[postId] = !isFavorite;
      return updatedState;
    });
  }

  @override
  Widget build(BuildContext context) {
    final postsFromProvider = ref.watch(postsProvider);
    final favoritePosts = ref.watch(favoritePostsProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritePostsScreen()),
              );
            },
            icon: Icon(Icons.favorite),
          ),
        ],
        title: TextWidget(text: "Random Posts", color: Colors.black, size: 20),
      ),
      body: ListView.builder(
        itemCount: postsFromProvider.posts.length,
        itemBuilder: (context, index) {
          final postsToShow = postsFromProvider.posts[index];
          final isFavorite = favoritePosts[postsToShow.id!] ?? false;

          return ListTile(
            leading: CircleAvatar(
              child: TextWidget(
                text: postsToShow.id.toString(),
                color: Colors.black,
                size: 15,
              ),
            ),
            title: TextWidget(
              text: postsToShow.title ?? "No Title",
              color: Colors.black,
              size: 20,
            ),
            subtitle: TextWidget(
              text: postsToShow.body ?? "No body",
              color: Colors.black,
              size: 15,
            ),
            trailing: IconButton(
              onPressed: () {
                toggleFavorite(postsToShow.id!); // Toggle favorite status
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
