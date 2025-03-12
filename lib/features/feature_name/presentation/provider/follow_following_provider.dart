import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FollowProvider extends ChangeNotifier {
  String followText = "Follow"; // Default text

  List<String> followedSourceName = [];

  //Yo shared Preference ma sourceName lai chai as a key ko rupma use gariyeko xa.
  Future<void> changeFollowAndFollowing(String sourceName) async {
    final prefs = await SharedPreferences.getInstance();
    //shared preference ma chai tyo source name key bhayera store bhako xa ki xaina
    //bhanera check garxa.
    final isFollowed = prefs.getBool(sourceName) ?? false;

    //yadi true bhaye false ra false bahye true gardinxa.
    final newFollowState = !isFollowed;

    // Update SharedPreferences
    await prefs.setBool(sourceName, newFollowState);

    // Update the followText based on the new state
    followText = newFollowState ? "Following" : "Follow";

    // Notify listeners for UI update
    notifyListeners();
  }

 
  // Method to load the initial follow state from SharedPreferences
  Future<void> loadFollowState(String sourceName) async {
    final prefs = await SharedPreferences.getInstance();
    final isFollowed = prefs.getBool(sourceName) ?? false;
    followText = isFollowed ? "Following" : "Follow";
    // Notify listeners after loading the state to ensure the UI gets updated
    notifyListeners();
  }
}

final followProvider = ChangeNotifierProvider<FollowProvider>((ref) {
  return FollowProvider();
});
