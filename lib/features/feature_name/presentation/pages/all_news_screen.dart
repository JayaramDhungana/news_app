import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/pages/more_details_news_screen.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/all_news_provider.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/favourite_news_provider.dart';
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
    final favouriteNewsFromProvider = ref.watch(favouriteNewsProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: allNewsFromProvider.allNews.length,
        itemBuilder: (context, index) {
          final allNewsDetails = allNewsFromProvider.allNews[index];
          //if news is already added to the favourte then this fucntion check the
          //title is added or not. then it return true if news is added to the favorite
          //otherwise it return false values.
          bool isFavourite = favouriteNewsFromProvider.favouriteNews.any(
            (element) => element.title == allNewsDetails.title,
          );

          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => MoreDetailsNewsScreen(
                        name: allNewsDetails.name,
                        publishedAt: allNewsDetails.publishedAt,
                        urlToImage: allNewsDetails.urlToImage,
                        author: allNewsDetails.author,
                        title: allNewsDetails.title,
                        description: allNewsDetails.description,
                        content: allNewsDetails.content,
                      ),
                ),
              );
            },
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  isBold: true,
                ),
              ],
            ),
            //List Tile ko last row ma author ko name dekhanue ra
            //publsihed data dekhayeko overflow handle sahit
            subtitle: Row(
              children: [
                SizedBox(
                  width: 100,

                  child: TextWidget(
                    text: allNewsDetails.author ?? "No Author",
                    color: Colors.black,
                    size: 12,
                    isOverFlow: true,
                    maxlines: 1,
                  ),
                ),
                Spacer(),

                SizedBox(
                  width: 75,
                  child: TextWidget(
                    text:
                        allNewsDetails.publishedAt ??
                        "No published date Details",
                    color: Colors.black,
                    size: 12,
                    isOverFlow: true,
                    maxlines: 1,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                //add to the favourite news List if not added to the favorite
                if (isFavourite == false) {
                  ref
                      .read(favouriteNewsProvider)
                      .addToFavouriteNews(
                        allNewsDetails.name ?? "No name",
                        allNewsDetails.author ?? "No author",
                        allNewsDetails.title ?? "No title",
                        allNewsDetails.description ?? "No Description",
                        allNewsDetails.urlToImage ??
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRLZ85F5Fe-UW2jTPyf76BbnpmWY_a_ZBfzA&s",
                        allNewsDetails.publishedAt ?? "No Published Date",
                      );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Added Successfully"),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 1),
                    ),
                  );
                } else {
                  ref
                      .read(favouriteNewsProvider)
                      .deleteFavouriteNews(allNewsDetails.title ?? " No title");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Deleted Successfully"),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              icon: Icon(
                isFavourite ? Icons.favorite : Icons.favorite_outline,
                color: isFavourite ? Colors.red : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
