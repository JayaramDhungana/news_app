import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/posts_provider.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/text_widget.dart';

class PostsShowingScreen extends ConsumerStatefulWidget {
  const PostsShowingScreen({super.key});

  @override
  ConsumerState<PostsShowingScreen> createState() => _PostsShowingScreenState();
}

class _PostsShowingScreenState extends ConsumerState<PostsShowingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(postsProvider).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    final postsFromProvider = ref.watch(postsProvider);
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(text: "Random Posts", color: Colors.black, size: 20),
      ),
      body: ListView.builder(
        itemCount: postsFromProvider.posts.length,
        itemBuilder: (context, index) {
          final postsToShow = postsFromProvider.posts[index];
          return ListTile(
            leading: CircleAvatar(
              child: TextWidget(
                text: postsToShow.id.toString() ?? "0",
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
          );
        },
      ),
    );
  }
}
