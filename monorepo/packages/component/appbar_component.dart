import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppbarComponent extends StatelessWidget {
  final String appBarText;
  final Color appBarColor;
  const AppbarComponent({
    super.key,
    required this.appBarText,
    required this.appBarColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appBarText),
      backgroundColor: appBarColor,
    );
  }
}
