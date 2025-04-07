import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/follow_following_provider.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/text_widget.dart';

class MoreDetailsNewsScreen extends ConsumerStatefulWidget {
  final String? name;
  final String? publishedAt;
  final String? urlToImage;
  final String? author;
  final String? title;
  final String? description;
  final String? content;

  const MoreDetailsNewsScreen({
    required this.name,
    required this.publishedAt,
    required this.urlToImage,
    required this.author,
    required this.title,
    required this.description,
    required this.content,
    super.key,
  });

  @override
  ConsumerState<MoreDetailsNewsScreen> createState() =>
      _MoreDetailsNewsScreenState();
}

class _MoreDetailsNewsScreenState extends ConsumerState<MoreDetailsNewsScreen> {
  @override
  void initState() {
    super.initState();
    // Load initial state from SharedPreferences when the widget is created

    //Flutter ma rendering process  complete bhayepachi code execute garna ko lagi, addPostFrameCallback() use garincha.
    /**
     *  Yo gariyena bhane ke hunxa?
     State Load Bhayena: SharedPreferences bata data load garne bela, Flutter ko UI
     frame render bhayepachi garne cha bhanera addPostFrameCallback() use garincha.
     Yadi yo addPostFrameCallback() use nagarni ho bhane
     widget render bhayepachi state load garne timing miss hunchha, ani screen ko
    first render ma follow state correctly display nagarne sakcha.
     * 
     * 
     * WidgetsBinding le Flutter ko UI rendering cycle ra app lifecycle manage garxa.
     * 
     * addPostFrameCallback() le callback register garne garxa, jo frame render bhayepachi execute garincha.
     */
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(followProvider).loadFollowState(widget.name ?? "null");
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch the followProvider to get the followText
    final followTextFromProvider = ref.watch(followProvider);
    final textfromProvider = followTextFromProvider.followText;
    final isSourceNameNull = widget.name!.isEmpty ? true : false;
    return Scaffold(
      appBar: AppBar(actions: [Icon(Icons.share)]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //The part which is above the News Picture
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Image(
                        image: AssetImage("assets/khabar logo.jpg"),
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: widget.name ?? "No Name",
                            color: Colors.black,
                            size: 15,
                            isBold: true,
                          ),
                          TextWidget(
                            text: widget.publishedAt ?? "No Published Date",
                            color: Colors.black,
                            size: 13,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    //yadi source name aayena bhane kei pani nadekhaune
                    isSourceNameNull?Text(""):InkWell(
                      onTap: () {
                        // Change the follow state when tapped
                        ref
                            .read(followProvider)
                            .changeFollowAndFollowing(
                              widget.name ?? "No Value",
                            );
                        debugPrint("pressed");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 40,
                        width: 100,
                        child: Center(
                          child: TextWidget(
                            text:
                                textfromProvider, // Directly use the followText
                            color: Colors.white,
                            size: 20,
                            isBold: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              // Show Image
              Image(
                image:
                    widget.urlToImage != null && widget.urlToImage!.isNotEmpty
                        ? NetworkImage(widget.urlToImage!)
                        : AssetImage("assets/khabar logo.jpg") as ImageProvider,
              ),
              // Author and content
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    text: widget.author ?? "No Author",
                    color: Colors.black,
                    size: 14,
                    isBold: true,
                  ),
                ],
              ),
              TextWidget(
                text: widget.title!,
                color: Colors.black,
                size: 30,
                isBold: true,
              ),
              TextWidget(
                text: widget.content ?? "No Description",
                color: Colors.black,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
