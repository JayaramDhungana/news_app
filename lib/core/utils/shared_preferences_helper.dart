import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  //favorite key for post
  static const String favoritesKey = 'favorite_posts';
  //favorite key for news
  static const String newsFavoritesKey = 'favorite_news';

  // Add post to favorites
  static Future<void> addPostToFavorites(int postId) async {
    //yo getInstance le chai file read and write garnako lagi ready xa  bhanne instance linxa
    // ra aba tyo file read and write garne instance chai prefs ma xa.
    //Shared Preference access garna ko lagi yahi instance ko abasykta parxa.

    final prefs = await SharedPreferences.getInstance();
    // Yeha getStringList le chai yadi kunai data haru store bhaisakeko xa bhane
    //tyo data tanera lyaune kam garxa ra shared preference ma chai data haru
    //key value pair ma store garne bhayekale favoriteskey use garera favorite data
    //haru nikalne kam garxa.
    List<String> favoritePosts = prefs.getStringList(favoritesKey) ?? [];

    //yedi already favorite ma xaina bhane favorite ma add gardine kam garxa.
    if (!favoritePosts.contains(postId.toString())) {
      favoritePosts.add(postId.toString());

      //aba yo code le chai shared preference ko storage ma key value pair ma key ma favorite_posts
      // ra value of favorite post ko id chai store gardine kam garxa.

      await prefs.setStringList(favoritesKey, favoritePosts);
    }
  }

  // Remove post from favorites
  static Future<void> removePostFromFavorites(int postId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoritePosts = prefs.getStringList(favoritesKey) ?? [];

    //.remove garepaxi chai postId ko value herera tyo remove hunxa.
    favoritePosts.remove(postId.toString());
    //ra last ma tyo remove garisakepaxi ko kuralai update gardinu parne hunxa.
    await prefs.setStringList(favoritesKey, favoritePosts);
  }

  // Get all favorite posts
  //Aba key value pair ko rupma bhayeko data harulai read garne ho.
  static Future<List<int>> getFavoritePosts() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoritePosts = prefs.getStringList(favoritesKey) ?? [];

    //yeha chai hamro database ma favorite post ko id chai string ko rupma store gariyeko xa.
    //aba ke hunxa bhane tyo String lai chai int nai banayera list banayera List of integer
    //chai pass gardine kam garxa.

    return favoritePosts.map((e) => int.parse(e)).toList();
  }

  // Check if a post is a favorite
  static Future<bool> isPostFavorite(int postId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoritePosts = prefs.getStringList(favoritesKey) ?? [];
    return favoritePosts.contains(postId.toString());
  }

  //*********************************************FOR NEWS**************************************************************************** */

  //favorite News Add Garna Ko Lagi
  static Future<void> addToFavoriteNews(
    String newsTitle,
    String urlToImage,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteNewses = prefs.getStringList(newsFavoritesKey) ?? [];
    if (!(favoriteNewses.contains(newsTitle))) {
      favoriteNewses.add(newsTitle);
      await prefs.setStringList(newsFavoritesKey, favoriteNewses);
    }
  }

  static Future<void> removeFavoriteNews(String newsTitle) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteNewses = prefs.getStringList(newsFavoritesKey) ?? [];
    favoriteNewses.remove(newsTitle);
    await prefs.setStringList(newsFavoritesKey, favoriteNewses);
  }

  static Future<List<String>> showFavoriteNews() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteNewses = prefs.getStringList(newsFavoritesKey) ?? [];
    return favoriteNewses;
  }

  static Future<bool> isNewsFollowed(String sourceName) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoritePosts = prefs.getStringList("sourceName") ?? [];
    return favoritePosts.contains(sourceName);
  }

  ///////////////////////////////////////////// For Joke///////////////////
  static const String keyforFavoriteJoke = "favorite_joke";

  static Future<void> addJokeToFavorite(String JokeTitle) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> fovoriteJokes = prefs.getStringList(keyforFavoriteJoke) ?? [];

    if (!(fovoriteJokes.contains(JokeTitle))) {
      fovoriteJokes.add(JokeTitle);
      await prefs.setStringList(keyforFavoriteJoke, fovoriteJokes);
    }
  }

  static Future<void> removeJokesFromFavorite(String JokeTitle) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> fovoriteJokes = prefs.getStringList(keyforFavoriteJoke) ?? [];
    fovoriteJokes.remove(JokeTitle);
    await prefs.setStringList(keyforFavoriteJoke, fovoriteJokes);
  }

  static Future<List<String>> showJokes() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteJokes = prefs.getStringList(keyforFavoriteJoke) ?? [];
    return favoriteJokes;
  }

  static Future<bool> isJokeFavorite(String jokeTitle) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteJokes = prefs.getStringList(keyforFavoriteJoke) ?? [];
    return favoriteJokes.contains(jokeTitle);
  }

  /////////////////////////////////////////////////Random Email ko Lagi///////////////////////////
  static final String favoriteEmailKey = "favoriteEmail";
  //To Store favorite Email
  static Future<void> addFavoriteEmail(String emailToStore) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favoriteEmails =
        prefs.getStringList(favoriteEmailKey) ?? [];

    if (!(favoriteEmails.contains(emailToStore))) {
      favoriteEmails.add(emailToStore);
      await prefs.setStringList(favoriteEmailKey, favoriteEmails);
    }
  }

  //To Remove favorite Email
  static Future<List<String>> removefavoriteEmail(String emailToRemove) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favoriteEmails =
        await prefs.getStringList(favoriteEmailKey) ?? [];

    favoriteEmails.remove(emailToRemove);
    await prefs.setStringList(favoriteEmailKey, favoriteEmails);
    return [];
  }

  //To Show the favorite Email
  static Future<List<String>> showfavoriteEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favoriteEmails =
        await prefs.getStringList(favoriteEmailKey) ?? [];

    return favoriteEmails;
  }

  ////////////////////////////////////////Json Encode wala Data Chai Rakhna Ko Lagi
  static String keyForStoreJsonEncodedNews = "Json_Encode_News";
  /*To add Jsonencoded News to the ShredPreferences */
  static Future<void> addJsonEncodedNews(String jsonEncodedNewsforAdd) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonEncodedNews =
        prefs.getStringList(keyForStoreJsonEncodedNews) ?? [];

    if (!(jsonEncodedNews.contains(jsonEncodedNewsforAdd))) {
      jsonEncodedNews.add(jsonEncodedNewsforAdd);
      await prefs.setStringList(keyForStoreJsonEncodedNews, jsonEncodedNews);
    }
  }

  //To Show the JsonEncoded News
  static Future<List<String>> showJsonEncodedNews() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonEncodedNews =
        prefs.getStringList(keyForStoreJsonEncodedNews) ?? [];
    return jsonEncodedNews;
  }

  //////////////////////////////////To delete the JsonEncoded News ///////////////////
  static Future<List<String>> removeJsonEncodedNews(
    String jsonEncodedNewsTitleForDelete,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonEncodedNews =
        prefs.getStringList(keyForStoreJsonEncodedNews) ?? [];
    // jsonEncodedNews.remove(jsonEncodedNewsForDelete);

    List<Map<String, dynamic>> decodedNewsList =
        jsonEncodedNews
            .map((jsonString) => jsonDecode(jsonString) as Map<String, dynamic>)
            .toList();

    //aba chai match hune kura delete garnu paryo
    decodedNewsList.removeWhere((news) {
      return news['Favorite News']['title'] == jsonEncodedNewsTitleForDelete;
    });

    //Re Encode
    // Re-encode the updated news list back into JSON strings
    List<String> updatedJsonEncodedNews =
        decodedNewsList.map((news) => jsonEncode(news)).toList();

    await prefs.setStringList(
      keyForStoreJsonEncodedNews,
      updatedJsonEncodedNews,
    );

    return updatedJsonEncodedNews;
  }

  /********************************Theme Store Garna Ko lagi*********/
  static String keyForTheme = 'key_for_theme';
  static Future<void> addThemeData(isTrue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyForTheme, isTrue);
  }

  static Future<bool> showThemeData() async {
    final prefs = await SharedPreferences.getInstance();
    final dataofTheme =  prefs.getBool(keyForTheme);
    return  dataofTheme!;
  }
}
