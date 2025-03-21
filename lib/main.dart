import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/pages/home_screen.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/pages/posts_showing_screen.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/pages/show_random_email.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/pages/show_random_joke.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/theme_provider.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/theme.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeFromProvider = ref.watch(themeProvider).themeToChange;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeFromProvider,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   appBarTheme: AppBarTheme(color: Colors.blue, centerTitle: true),
      //   dialogTheme: DialogTheme(backgroundColor: Colors.purple),
      // ),
      home: HomeScreen(currentTheme: themeFromProvider),
    );
  }
}
