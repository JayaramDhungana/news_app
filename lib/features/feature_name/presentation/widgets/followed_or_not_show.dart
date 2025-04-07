import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/core/utils/shared_preferences_helper.dart';

import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/follow_following_provider.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FollowedOrNotWidget extends ConsumerStatefulWidget {
  final String sourceName;

  const FollowedOrNotWidget({super.key, required this.sourceName});

  @override
  ConsumerState<FollowedOrNotWidget> createState() =>
      _FollowedOrNotWidgetState();
}

class _FollowedOrNotWidgetState extends ConsumerState<FollowedOrNotWidget> {
  @override
  void initState() {
    super.initState();
    ref.read(followProvider).loadFollowState(widget.sourceName);
  }

  @override
  Widget build(BuildContext context) {
    // Watching for followText change for the specific source
    final followText = ref.watch(followProvider);
    final isFollowed = followText.followedSourceName.contains(
      widget.sourceName,
    );

    return InkWell(
      onTap: () {
        ref.read(followProvider).changeFollowAndFollowing(widget.sourceName);
        debugPrint("pressed");
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: TextWidget(
            text: isFollowed ? "Following" : "Follow",
            color: Colors.white,
            size: 15,
            isBold: true,
          ),
        ),
      ),
    );
  }    
}
