import 'package:flutter/material.dart';

import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/text_widget.dart';

class MoreDetailsNewsScreen extends StatefulWidget {
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
  State<MoreDetailsNewsScreen> createState() => _MoreDetailsNewsScreenState();
}
class _MoreDetailsNewsScreenState extends State<MoreDetailsNewsScreen> {
  @override
  Widget build(BuildContext context) {
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
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                      ),

                      height: 40,
                      width: 100,
                      child: Center(
                        child: TextWidget(
                          text: "Following",
                          color: Colors.white,
                          size: 20,
                          isBold: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //TO show Image
              Image(
                image:
                    widget.urlToImage != null && widget.urlToImage!.isNotEmpty
                        ? NetworkImage(
                          widget.urlToImage!,
                        ) // NetworkImage pathaune
                        : AssetImage("assets/khabar logo.jpg")
                            as ImageProvider, // AssetImage pathaune
                // NetworkImage(
                //   widget.urlToImage ?? "assets/khabar logo.jpg ",
                // ),
                // height: 300,
                // width: 500,
              ),
              //It it the author name below of the image
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
                //It is the title of the news
                text: widget.title!,
                color: Colors.black,
                size: 30,
                isBold: true,
              ),
              TextWidget(
                //It is the description of the news
                text: widget.content ?? "NO Description",
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
