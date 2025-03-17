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

  //News ko lagi
  static Future<bool> isNewsFollowed(String sourceName) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoritePosts = prefs.getStringList("sourceName") ?? [];
    return favoritePosts.contains(sourceName);
  }
}
