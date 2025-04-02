import 'package:flutter/material.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/pages/first_ui.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/pages/second_ui.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/pages/third_ui.dart';

class HomeScreenSecondDesign extends StatelessWidget {
  HomeScreenSecondDesign({super.key});

  final List<StatelessWidget> pages = [FirstUi(), SecondUi(), ThirdUi()];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: pages.length,
      itemBuilder: (context, index) {
        return Container(child: pages[index]);
      },
    );
    // PageView(
    //   children: [
    //     FirstUi(),
    //     SecondUi(),
    //     ThirdUi(),
    //   ],
    // );
  }
}
