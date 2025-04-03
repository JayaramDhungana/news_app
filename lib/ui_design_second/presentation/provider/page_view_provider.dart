import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageViewProvider extends ChangeNotifier {
  int page = 0;

  void changePage(int pageFromUI) {
    page = pageFromUI;
    notifyListeners();
  }
}

final pageViewProvider = ChangeNotifierProvider((ref) {
  return PageViewProvider();
});
