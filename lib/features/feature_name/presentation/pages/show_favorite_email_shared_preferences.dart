import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/core/utils/shared_preferences_helper.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/random_email_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowFavoriteEmailSharedPreferences extends ConsumerStatefulWidget {
  const ShowFavoriteEmailSharedPreferences({super.key});

  @override
  ConsumerState<ShowFavoriteEmailSharedPreferences> createState() =>
      _ShowFavoriteEmailSharedPreferencesState();
}

class _ShowFavoriteEmailSharedPreferencesState
    extends ConsumerState<ShowFavoriteEmailSharedPreferences> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(randomEmailProvider).showFavoriteEmailSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteEmailFromProvider = ref.watch(randomEmailProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Email Using Sharee Preferences")),

      body: ListView.builder(
        itemCount:
            favoriteEmailFromProvider.favoriteEmailForSharedPrefrences.length,
        itemBuilder: (context, index) {
          final favoriteEmail =
              favoriteEmailFromProvider.favoriteEmailForSharedPrefrences[index];

          return ListTile(
            leading: CircleAvatar(child: Text((index + 1).toString())),
            title: Text(favoriteEmail.toString()),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: Text(
                        "Do you want to delete this from your Favorite List",
                      ),
                      children: [
                        SimpleDialogOption(
                          child: Text("Confirm"),
                          onPressed: () {
                            SharedPreferencesHelper.removefavoriteEmail(
                              favoriteEmail.toString(),
                            );
                            ref
                                .read(randomEmailProvider)
                                .deleteFavoriteEmail(favoriteEmail.toString());
                            ref
                                .read(randomEmailProvider)
                                .showFavoriteEmailSharedPreferences();
                            ref
                                .read(randomEmailProvider)
                                .deleteFavoriteEmail(favoriteEmail.toString());

                            Navigator.pop(context);
                          },
                        ),
                        SimpleDialogOption(
                          child: Text("Cancal"),
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
