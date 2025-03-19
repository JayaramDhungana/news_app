import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/pages/show_favorite_email_shared_preferences.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/random_email_provider.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/text_widget.dart';

class ShowFavoriteEmail extends ConsumerStatefulWidget {
  const ShowFavoriteEmail({super.key});

  @override
  ConsumerState<ShowFavoriteEmail> createState() => _ShowFavoriteEmailState();
}

class _ShowFavoriteEmailState extends ConsumerState<ShowFavoriteEmail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(randomEmailProvider);
  }

  @override
  Widget build(BuildContext context) {
    final favoriteEmailFromProvider =
        ref.watch(randomEmailProvider).favoriteRandomEmail;
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Email"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowFavoriteEmailSharedPreferences(),
                ),
              );
            },
            icon: Icon(Icons.dangerous),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: favoriteEmailFromProvider.length,
        itemBuilder: (context, index) {
          final favoriteEmailToShow = favoriteEmailFromProvider[index];

          return ListTile(
            leading: CircleAvatar(child: Text((index + 1).toString())),
            title: Text(favoriteEmailToShow.email.toString()),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: TextWidget(
                        text:
                            "Do you want to remove this email from your favorite List ?",
                        color: Colors.black,
                        size: 25,
                      ),
                      children: [
                        SimpleDialogOption(
                          onPressed: () {
                            ref
                                .read(randomEmailProvider)
                                .deleteFavoriteEmail(
                                  favoriteEmailToShow.email.toString(),
                                );
                            Navigator.pop(context);
                          },
                          child: Text("Confirm"),
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
