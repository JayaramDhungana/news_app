import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:news_using_clean_architecture/features/feature_name/presentation/pages/show_favorite_jokes.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/random_joke_provider.dart';

class ShowRandomJoke extends ConsumerStatefulWidget {
  const ShowRandomJoke({super.key});

  @override
  ConsumerState<ShowRandomJoke> createState() => _ShowRandomJokeState();
}

class _ShowRandomJokeState extends ConsumerState<ShowRandomJoke> {
  @override
  void initState() {
    super.initState();
    ref.read(randomJokeProvider).fetchJoke();
    ref.read(randomJokeProvider).loadFavoriteJokes(); // Load favorites on start
  }

  Future<void> toggleFavoriteJokes(String jokeTitle) async {
    await ref.read(randomJokeProvider).toggleFavoriteJokes(jokeTitle);
  }

  @override
  Widget build(BuildContext context) {
    final jokeFromProvider = ref.watch(randomJokeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Joke"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShowFavoriteJokes()),
              );
            },
            icon: Icon(Icons.favorite_border_sharp),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: jokeFromProvider.joke.length,
        itemBuilder: (context, index) {
          final jokeToShow = jokeFromProvider.joke[index];
          bool isJokeNull = (jokeToShow.joke == null) ? true : false;

          final jokeTitle =
              isJokeNull
                  ? "Setup:${jokeToShow.setup} \n Delivery:${jokeToShow.delivery}"
                  : jokeToShow.joke.toString();

          final isJokeFavorite =
              jokeFromProvider.favoriteJokes[jokeTitle] ?? false;

          return ListTile(
            title:
                isJokeNull
                    ? Center(
                      child: Text(
                        "Setup:${jokeToShow.setup} \n Delivery:${jokeToShow.delivery}",
                      ),
                    )
                    : Center(child: Text(jokeToShow.joke.toString())),
            trailing: IconButton(
              onPressed: () {
                toggleFavoriteJokes(jokeTitle); // Toggle favorite status
              },
              icon: Icon(
                isJokeFavorite ? Icons.favorite : Icons.favorite_border,
                color: isJokeFavorite ? Colors.red : Colors.black,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(randomJokeProvider).fetchJoke(); // Fetch next joke
        },
        child: Center(child: Text("Next Joke")),
      ),
    );
  }
}
