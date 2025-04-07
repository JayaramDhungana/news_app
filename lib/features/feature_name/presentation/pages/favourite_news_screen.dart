import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/core/utils/shared_preferences_helper.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/pages/show_favorite_using_shared_preference.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/favourite_news_provider.dart';

import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/text_widget.dart';

class FavouriteNewsScreen extends ConsumerStatefulWidget {
  const FavouriteNewsScreen({super.key});

  @override
  ConsumerState<FavouriteNewsScreen> createState() =>
      _FavouriteNewsScreenState();
}

class _FavouriteNewsScreenState extends ConsumerState<FavouriteNewsScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteNewsFromProvier = ref.watch(favouriteNewsProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(text: "Favourte News", color: Colors.black, size: 30),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowFavoriteUsingSharedPreference(),
                ),
              );
            },
            icon: Icon(Icons.storefront),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: favouriteNewsFromProvier.favouriteNews.length,

        itemBuilder: (context, index) {
          final favouriteNewsDetails =
              favouriteNewsFromProvier.favouriteNews[index];
          return ListTile(
            leading: Image(
              image: NetworkImage(
                favouriteNewsDetails.urlToImage ??
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRLZ85F5Fe-UW2jTPyf76BbnpmWY_a_ZBfzA&s",
              ),
              height: 80,
              width: 80,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: favouriteNewsDetails.name!,
                  color: Colors.black,
                  size: 12,
                ),
                TextWidget(
                  text: favouriteNewsDetails.title!,
                  color: Colors.black,
                  size: 15,
                  maxlines: 2,
                  isBold: true,
                ),
              ],
            ),
            subtitle: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: TextWidget(
                    text: favouriteNewsDetails.author!,
                    color: Colors.black,
                    size: 15,
                    isOverFlow: true,
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 70,
                  child: TextWidget(
                    text: favouriteNewsDetails.publishedAt!,
                    color: Colors.black,
                    size: 15,
                    maxlines: 1,
                  ),
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
                        text:
                            "Do you want to delete this news from your favourite list ?",
                        color: Colors.black,
                        size: 25,
                      ),
                      children: [
                        SimpleDialogOption(
                          child: TextWidget(
                            text: "Yes",
                            color: Colors.black,
                            size: 20,
                          ),
                          onPressed: () {
                            //Yo chai Listkp matra delete garna ko lagi
                            ref
                                .read(favouriteNewsProvider)
                                .deleteFavouriteNews(
                                  favouriteNewsDetails.title!,
                                );
                            //yo chai shared preferenceko pani delete garnako lagi
                            SharedPreferencesHelper.removeFavoriteNews(
                              favouriteNewsDetails.title!,
                            );
                            //Json Encoded Favorite News Ko lagi ho

                            ref
                                .read(favouriteNewsProvider)
                                .deleteJsonEncodedNews(
                                  favouriteNewsDetails.title!,
                                );
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Deleted Successfully"),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                        ),
                        SimpleDialogOption(
                          child: TextWidget(
                            text: "No",
                            color: Colors.black,
                            size: 20,
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
              icon: Icon(Icons.delete, size: 30),
            ),
          );
        },
      ),
    );
  }
}
