import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/category_wise_news_provider.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/favourite_news_provider.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/text_widget.dart';

class CategoryWiseNewsScreen extends ConsumerStatefulWidget {
  final String category;
  const CategoryWiseNewsScreen(this.category, {super.key});

  @override
  ConsumerState<CategoryWiseNewsScreen> createState() =>
      _CategoryWiseNewsScreenState();
}

class _CategoryWiseNewsScreenState
    extends ConsumerState<CategoryWiseNewsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(categoryWiseNewsProvider).FetchCategoryWiseNews(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    final categoryWiseNewsFromProvider = ref.watch(categoryWiseNewsProvider);
    final favouriteNewsFromProvider = ref.watch(favouriteNewsProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: categoryWiseNewsFromProvider.categoryWiseNews.length,
        itemBuilder: (context, index) {
          final categoryWiseNewsDetails =
              categoryWiseNewsFromProvider.categoryWiseNews[index];
          bool isFavourite = favouriteNewsFromProvider.favouriteNews.any(
            (element) => element.title == categoryWiseNewsDetails.title,
          );
          return ListTile(
            //News ko Image
            leading: Image(
              image: NetworkImage(
                categoryWiseNewsDetails.urlToImage ??
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRLZ85F5Fe-UW2jTPyf76BbnpmWY_a_ZBfzA&s",
              ),
              height: 90,
              width: 90,
            ),

            // Sources of news and Title of the news
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: categoryWiseNewsDetails.name ?? "No Name",
                  color: Colors.black,
                  size: 12,
                ),
                TextWidget(
                  text: categoryWiseNewsDetails.title ?? "No title",
                  color: Colors.black,
                  size: 15,
                  maxlines: 2,
                  isBold: true,
                ),
              ],
            ),

            //Author and Published Date
            subtitle: Row(
              children: [
                SizedBox(
                  width: 90,
                  child: TextWidget(
                    text: categoryWiseNewsDetails.author ?? "No Author",
                    color: Colors.black,
                    size: 12,
                    isOverFlow: true,
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 65,
                  child: TextWidget(
                    text:
                        categoryWiseNewsDetails.publishedAt ??
                        "No Published date",
                    color: Colors.black,
                    size: 12,
                    isOverFlow: true,
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
                        categoryWiseNewsDetails.name ?? "No name",
                        categoryWiseNewsDetails.author ?? "No author",
                        categoryWiseNewsDetails.title ?? "No title",
                        categoryWiseNewsDetails.description ?? "No Description",
                        categoryWiseNewsDetails.urlToImage ??
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRLZ85F5Fe-UW2jTPyf76BbnpmWY_a_ZBfzA&s",
                        categoryWiseNewsDetails.publishedAt ??
                            "No Published Date",
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
                      .deleteFavouriteNews(
                        categoryWiseNewsDetails.title ?? " No title",
                      );
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
