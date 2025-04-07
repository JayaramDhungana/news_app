import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/pages/all_news_screen.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/pages/category_wise_news_screen.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/pages/favourite_news_screen.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/pages/followed_source.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/theme_provider.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/text_widget.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/theme.dart';

class HomeScreen extends ConsumerStatefulWidget {
  // final ThemeData currentTheme;
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 8, vsync: this);

    // ref.read(themeProvider).initialTheme();
    ref.read(themeProvider).initialThemeMode();
  }

  ThemeData themeChange(ThemeData currentTheme) {
    ThemeData requestedTheme;
    if (currentTheme == darkTheme) {
      requestedTheme = lightTheme;
    } else {
      requestedTheme = darkTheme;
    }
    return requestedTheme;
  }

  @override
  Widget build(BuildContext context) {
    final themeFromProvider = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        //Mathi 3 wota kuraharu xan.Image ,notifications ra favourite news ko lagi icon
        title: Row(
          children: [
            Image(
              image: AssetImage("assets/khabar logo.jpg"),
              height: 80,
              width: 110,
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FollowedSource()),
                );
              },
              icon: Icon(Icons.account_box),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavouriteNewsScreen(),
                  ),
                );
              },
              icon: Icon(Icons.favorite, color: Colors.red, size: 40),
            ),
            // Container(child: Icon(Icons.notifications_none_sharp, size: 40)),
            IconButton(
              onPressed: () {
                themeFromProvider.toggleTheme();
                // ref
                //     .read(themeProvider.notifier)
                //     .changeThemes(themeChange(widget.currentTheme));
              },
              icon: Icon(
                themeFromProvider.themeMode == ThemeModeEnum.light
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          //Latest ra see more ko lagi Row
          Row(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              TextWidget(
                text: "Latest",
                color: Colors.black,
                size: 20,
                isBold: true,
              ),
              Spacer(),
              TextWidget(text: "See more", color: Colors.black, size: 15),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            ],
          ),
          /**
           * business
           * entertainment
           * general
           * health
           * science
           * sports
           * technology
           */
          TabBar(
            isScrollable: true,
            controller: _tabController,

            tabs: [
              TextWidget(text: "All", color: Colors.black, size: 15),
              TextWidget(text: "Business", color: Colors.black, size: 15),
              TextWidget(text: "Entertainment", color: Colors.black, size: 15),
              TextWidget(text: "General", color: Colors.black, size: 15),
              TextWidget(text: "Health", color: Colors.black, size: 15),
              TextWidget(text: "Science", color: Colors.black, size: 15),
              TextWidget(text: "Sports", color: Colors.black, size: 15),
              TextWidget(text: "Technology", color: Colors.black, size: 15),
            ],
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                AllNewsScreen(),
                CategoryWiseNewsScreen("business"),
                CategoryWiseNewsScreen("entertainment"),
                CategoryWiseNewsScreen("general"),
                CategoryWiseNewsScreen("health"),
                CategoryWiseNewsScreen("science"),
                CategoryWiseNewsScreen("sports"),
                CategoryWiseNewsScreen("technology"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
