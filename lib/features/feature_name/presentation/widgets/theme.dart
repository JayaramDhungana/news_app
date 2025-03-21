import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  appBarTheme: AppBarTheme(backgroundColor: Colors.blue),

  iconTheme: IconThemeData(color: Colors.black),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(iconColor: WidgetStateProperty.all(Colors.white)),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.grey[900],
  textTheme: TextTheme(
    titleMedium: TextStyle(color: Colors.white),
    titleSmall: TextStyle(color: Colors.white),
  ),
  tabBarTheme: TabBarThemeData(labelColor: Colors.white),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blueGrey,
    iconTheme: IconThemeData(color: Colors.white),
  ),

  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(iconColor: WidgetStateProperty.all(Colors.red)),
  ),
  iconTheme: IconThemeData(color: Colors.red),

  
);
