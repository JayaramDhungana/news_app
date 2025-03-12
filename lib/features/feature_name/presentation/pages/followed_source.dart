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
    final FollowedSourceFromProvider = ref.watch(followProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Your Followed Source")),
      body: ListView.builder(
        itemCount: FollowedSourceFromProvider.followedSourceName.length,
        itemBuilder: (context, index) {
          final followedSourceToShow =
              FollowedSourceFromProvider.followedSourceName[index];
          return ListTile(
            title: TextWidget(
              text: followedSourceToShow,
              color: Colors.black,
              size: 25,
            ),
          );
        },
      ),
    );
  }
}
