import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/all_news_provider.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/text_widget.dart';

class AllNewsScreen extends ConsumerStatefulWidget {
  const AllNewsScreen({super.key});

  @override
  ConsumerState<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends ConsumerState<AllNewsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(allNewsProvider).fetchAllNews();
  }

  @override
  Widget build(BuildContext context) {
    final allNewsFromProvider = ref.watch(allNewsProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: allNewsFromProvider.allNews.length,
        itemBuilder: (context, index) {
          final allNewsDetails = allNewsFromProvider.allNews[index];
          return ListTile(
            leading: Image(
              image: NetworkImage(
                allNewsDetails.urlToImage ??
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRLZ85F5Fe-UW2jTPyf76BbnpmWY_a_ZBfzA&s",
              ),
              height: 80,
              width: 80,
            ),
            //Title ma news ko name ra Title dekhauna ko la
            title: Column(
              children: [
                TextWidget(
                  text: allNewsDetails.name ?? "No Name",
                  color: Colors.black,
                  size: 13,
                ),
                TextWidget(
                  text: allNewsDetails.title ?? "No title",
                  color: Colors.black,
                  size: 15,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
