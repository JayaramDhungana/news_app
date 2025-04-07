import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/core/utils/shared_preferences_helper.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/favourite_news_provider.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/calculate_date_difference.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/text_widget.dart';

class ShowJsonEncodedFavoriteNews extends ConsumerStatefulWidget {
  const ShowJsonEncodedFavoriteNews({super.key});

  @override
  ConsumerState<ShowJsonEncodedFavoriteNews> createState() =>
      _ShowJsonEncodedFavoriteNewsState();
}

class _ShowJsonEncodedFavoriteNewsState
    extends ConsumerState<ShowJsonEncodedFavoriteNews> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(favouriteNewsProvider).loadJsonEncodedNews();
    debugPrint("Josn Encode");
  }

  @override
  Widget build(BuildContext context) {
    final jsonEncodedNewsFromProvider = ref.watch(favouriteNewsProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Json Encoded News")),
      body: ListView.builder(
        itemCount: jsonEncodedNewsFromProvider.jsonEncodedFavoriteNews.length,
        itemBuilder: (context, index) {
          final jsonEncodedNews =
              jsonEncodedNewsFromProvider.jsonEncodedFavoriteNews[index];

          final jsonDecodedNews = jsonDecode(jsonEncodedNews);
          print(jsonDecodedNews['Favorite News'][' publishedAt']);

          return ListTile(
            leading: Image(
              image: NetworkImage(
                jsonDecodedNews['Favorite News']['urlToImage'],
              ),
              height: 80,
              width: 80,
            ),
            title: Column(
              children: [
                Row(
                  children: [
                    TextWidget(
                      text: jsonDecodedNews['Favorite News']['name'],
                      color: Colors.black,
                      size: 12,
                    ),
                  ],
                ),
                TextWidget(
                  text: jsonDecodedNews['Favorite News']['title'],
                  color: Colors.black,
                  size: 15,
                  isBold: true,
                  isOverFlow: true,
                  maxlines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: jsonDecodedNews['Favorite News']['author'],
                      color: Colors.black,
                      size: 12,
                    ),
                    Spacer(),

                    TextWidget(
                      text: calculateDateDifference(
                        publishedAt:
                            jsonDecodedNews['Favorite News'][' publishedAt'] ??
                            "No Published Date",
                      ),
                      color: Colors.black,
                      size: 15,
                    ),
                  ],
                ),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: TextWidget(
                        text: "Do you want to delete this Item",
                        color: Colors.black,
                        size: 20,
                      ),
                      children: [
                        SimpleDialogOption(
                          onPressed: () {
                            ref
                                .read(favouriteNewsProvider)
                                .deleteJsonEncodedNews(
                                  jsonDecodedNews['Favorite News']['title'],
                                );
                            Navigator.pop(context);
                            ref
                                .read(favouriteNewsProvider)
                                .deleteFavouriteNews(
                                  jsonDecodedNews['Favorite News']['title'],
                                );
                            ref
                                .read(favouriteNewsProvider)
                                .removeFavoriteNewsFromSharedPreferences(
                                  jsonDecodedNews['Favorite News']['title'],
                                );
                          },
                          child: TextWidget(
                            text: "Confirm",
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        SimpleDialogOption(
                          child: TextWidget(
                            text: "Cancel",
                            color: Colors.white,
                            size: 15,
                          ),
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
