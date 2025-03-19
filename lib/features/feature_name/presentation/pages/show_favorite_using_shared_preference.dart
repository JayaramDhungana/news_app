import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/core/utils/shared_preferences_helper.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/favourite_news_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowFavoriteUsingSharedPreference extends ConsumerStatefulWidget {
  const ShowFavoriteUsingSharedPreference({super.key});

  @override
  ConsumerState<ShowFavoriteUsingSharedPreference> createState() =>
      _ShowFavoriteUsingSharedPreferenceState();
}

class _ShowFavoriteUsingSharedPreferenceState
    extends ConsumerState<ShowFavoriteUsingSharedPreference> {
  List<String> favoriteNewsFromSharedPreference = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ref.read(favouriteNewsProvider).loadFavoriteNews();
  }

  @override
  Widget build(BuildContext context) {
    final favNewsTitleFromProvider =
        ref.watch(favouriteNewsProvider).favoriteNewsTitle;
    return Scaffold(
      appBar: AppBar(title: Text("Show Favorite Using Shared Preference")),

      body: ListView.builder(
        itemCount: favNewsTitleFromProvider.length,
        itemBuilder: (context, index) {
          final favoriteNews = favNewsTitleFromProvider[index];

          return ListTile(
            // leading: Image(image: NetworkImage(favoriteNews.)),
            title: Text(favoriteNews.toString()),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: Text("Do you really want to delete this?"),
                      children: [
                        SimpleDialogOption(
                          onPressed: () {
                            SharedPreferencesHelper.removeFavoriteNews(
                              favoriteNews.toString(),
                            );
                            ref.read(favouriteNewsProvider).loadFavoriteNews();
                            ref
                                .read(favouriteNewsProvider)
                                .deleteFavouriteNews(favoriteNews.toString());
                            Navigator.pop(context);
                          },
                          child: Text("Confirm"),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
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
