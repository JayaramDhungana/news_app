import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class FollowProvider extends ChangeNotifier {
//   String followText = "Follow"; // Default text

//   //News source name ko value haru store garna ko lagi
//   List<String> followedSourceName = [""];
//   String keyForSourceNameStore = "sourceName";

//   // Get all followed sources from SharedPreferences
//   Future<List<String>> getFollowedSource() async {
//     final prefs = await SharedPreferences.getInstance();
//     followedSourceName = prefs.getStringList(keyForSourceNameStore) ?? [];
//     return followedSourceName; // Return the list of followed sources
//   }

//   //Yo shared Preference ma sourceName lai chai as a key ko rupma use gariyeko xa.
//   Future<void> changeFollowAndFollowing(String? sourceName) async {
//     final prefs = await SharedPreferences.getInstance();
//     //shared preference ma chai tyo source name key bhayera store bhako xa ki xaina
//     //bhanera check garxa.
//     final isFollowed = prefs.getBool(sourceName!) ?? false;

//     //yadi true bhaye false ra false bahye true gardinxa.
//     final newFollowState = !isFollowed;

//     // Update SharedPreferences
//     await prefs.setBool(sourceName, newFollowState);

//     // Update the followText based on the new state
//     followText = newFollowState ? "Following" : "Follow";

//     //aba follow gareko source haru chai yeuta list ma store bhayera shared preference ma halnu
//     //paryo
//     followedSourceName = prefs.getStringList(keyForSourceNameStore) ?? [];

//     if (!(followedSourceName.contains(sourceName))) {
//       followedSourceName.add(sourceName);
//       prefs.setStringList(keyForSourceNameStore, followedSourceName);
//     } else {
//       followedSourceName.remove(sourceName);
//       prefs.setStringList(keyForSourceNameStore, followedSourceName);
//     }

//     // Notify listeners for UI update
//     notifyListeners();
//   }

//   // Method to load the initial follow state from SharedPreferences
//   Future<void> loadFollowState(String sourceName) async {
//     final prefs = await SharedPreferences.getInstance();
//     final isFollowed = prefs.getBool(sourceName) ?? false;
//     followText = isFollowed ? "Following" : "Follow";
//     // Notify listeners after loading the state to ensure the UI gets updated
//     notifyListeners();
//   }
// }
class FollowProvider extends ChangeNotifier {
  String followText = "Follow"; // Default text
  List<String> followedSourceName = [];
  String keyForSourceNameStore = "sourceName";

  // Get all followed sources from SharedPreferences
  Future<List<String>> getFollowedSource() async {
    final prefs = await SharedPreferences.getInstance();
    followedSourceName = prefs.getStringList(keyForSourceNameStore) ?? [];
    return followedSourceName; // Return the list of followed sources
  }

  // Change follow status for a source
  Future<void> changeFollowAndFollowing(String sourceName) async {
    final prefs = await SharedPreferences.getInstance();
    final isFollowed = prefs.getBool(sourceName) ?? false;

    final newFollowState = !isFollowed;
    await prefs.setBool(sourceName, newFollowState);

    // Update the followText based on the new state
    followText = newFollowState ? "Following" : "Follow";
    followedSourceName = prefs.getStringList(keyForSourceNameStore) ?? [];

    if (newFollowState) {
      followedSourceName.add(sourceName);
    } else {
      followedSourceName.remove(sourceName);
    }

    await prefs.setStringList(keyForSourceNameStore, followedSourceName);

    // Notify listeners for UI update
    notifyListeners();
  }

  // Load follow state when the app starts
  Future<void> loadFollowState(String sourceName) async {
    final prefs = await SharedPreferences.getInstance();
    final isFollowed = prefs.getBool(sourceName) ?? false;
    followText = isFollowed ? "Following" : "Follow";
    notifyListeners(); // Notify listeners for UI update
  }
}


final followProvider = ChangeNotifierProvider<FollowProvider>((ref) {
  return FollowProvider();
});
