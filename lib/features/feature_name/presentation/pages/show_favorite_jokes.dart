import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/core/utils/shared_preferences_helper.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/random_joke_provider.dart';

class ShowFavoriteJokes extends ConsumerStatefulWidget {
  const ShowFavoriteJokes({super.key});

  @override
  ConsumerState<ShowFavoriteJokes> createState() => _ShowFavoriteJokesState();
}

class _ShowFavoriteJokesState extends ConsumerState<ShowFavoriteJokes> {
  late Future<void> favoriteJokesFuture;

  @override
  void initState() {
    super.initState();
    favoriteJokesFuture =
        ref.read(randomJokeProvider.notifier).showFavoriteJokes();
  }

  Future<void> toggleFavoriteJokes(String jokeTitle) async {
    await ref.read(randomJokeProvider).toggleFavoriteJokes(jokeTitle);
  }

  @override
  Widget build(BuildContext context) {
    final favoriteJokesFromProvider = ref.watch(randomJokeProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Favorite Jokes")),
      body:
          favoriteJokesFromProvider.favoriteJokesTitle.isEmpty
              ? Center(child: CircularProgressIndicator()) // Loading state
              : ListView.builder(
                itemCount: favoriteJokesFromProvider.favoriteJokesTitle.length,
                itemBuilder: (context, index) {
                  String joke =
                      favoriteJokesFromProvider.favoriteJokesTitle[index];
                  return ListTile(
                    title: Text(joke),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              children: [
                                SimpleDialogOption(
                                  child: Text("Confirm"),
                                  onPressed: () async {
                                    await ref
                                        .read(randomJokeProvider.notifier)
                                        .removeFavoriteJoke(joke);
                                    await SharedPreferencesHelper.removeJokesFromFavorite(
                                      joke,
                                    );

                                    Navigator.pop(context);
                                  },
                                ),
                                SimpleDialogOption(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.delete),
                    ),
                  );
                },
              ),
    );
  }
}
