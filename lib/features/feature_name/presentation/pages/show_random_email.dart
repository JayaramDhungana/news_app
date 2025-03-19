import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/pages/show_favorite_email.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/random_email_provider.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/text_widget.dart';

class ShowRandomEmail extends ConsumerStatefulWidget {
  const ShowRandomEmail({super.key});

  @override
  ConsumerState<ShowRandomEmail> createState() => _ShowRandomEmailState();
}

class _ShowRandomEmailState extends ConsumerState<ShowRandomEmail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ref.read(randomEmailProvider.notifier).fetchRandomEmail();
  }

  @override
  Widget build(BuildContext context) {
    final randomEmailFromProvider = ref.watch(randomEmailProvider).randomEmail;
    final favoriteEmailFromProvider = ref.watch(randomEmailProvider);
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(text: "Random Email", color: Colors.black, size: 15),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShowFavoriteEmail()),
              );
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: randomEmailFromProvider.length,
        itemBuilder: (context, index) {
          final emailToShow = randomEmailFromProvider[index];
          final isfavorite = favoriteEmailFromProvider.favoriteRandomEmail.any(
            (a) => a.email == emailToShow.email,
          );
          return ListTile(
            leading: CircleAvatar(child: Text((index + 1).toString())),
            title: Text(emailToShow.email ?? "No Email"),
            trailing: IconButton(
              onPressed: () {
                isfavorite
                    ? (
                      ref
                          .read(randomEmailProvider.notifier)
                          .deleteFavoriteEmail(emailToShow.email ?? "No Email"),
                    )
                    : (
                      ref
                          .read(randomEmailProvider.notifier)
                          .storeFavoriteEmail(emailToShow.email ?? "No Email"),
                    );
              },
              icon: Icon(isfavorite ? Icons.favorite : Icons.favorite_outline),
            ),
          );
        },
      ),
    );
  }
}
