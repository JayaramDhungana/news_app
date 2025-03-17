import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/follow_following_provider.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FollowedSource extends ConsumerStatefulWidget {
  const FollowedSource({super.key});

  @override
  ConsumerState<FollowedSource> createState() => _FollowedSourceState();
}

class _FollowedSourceState extends ConsumerState<FollowedSource> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getFollowedSource();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(followProvider.notifier).getFollowedSource();
    });
  }

  @override
  Widget build(BuildContext context) {
    final followedSourceFromProvider = ref.watch(followProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Your Followed Source")),
      body: ListView.builder(
        itemCount: followedSourceFromProvider.followedSourceName.length,
        itemBuilder: (context, index) {
          final followedSourceToShow =
              followedSourceFromProvider.followedSourceName[index];
          final isloading = followedSourceToShow.isEmpty ? true : false;
          return isloading
              ? CircularProgressIndicator(color: Colors.red)
              : ListTile(
                leading: CircleAvatar(child: Text((index + 1).toString())),
                title: TextWidget(
                  text: followedSourceToShow,
                  color: Colors.black,
                  size: 25,
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text(
                            "Do you Want to delete this From your Followed Soruce",
                          ),
                          children: [
                            SimpleDialogOption(
                              child: Text("Yes"),
                              onPressed: () {
                                ref
                                    .read(followProvider)
                                    .changeFollowAndFollowing(
                                      followedSourceToShow,
                                    );
                                Navigator.pop(context);
                              },
                            ),
                            SimpleDialogOption(
                              child: Text("No"),
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
