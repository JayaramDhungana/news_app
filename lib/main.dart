import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
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
  @override
  Widget build(BuildContext context) {
    final themeFromProvider = ref.watch(themeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //Body/Body Medium/Semibold
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 24 / 16,
            color: Color(0xFF262829),
            letterSpacing: 0,
          ),

          //Body/Label Small/Regular
          labelSmall: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 18 / 14,
            color: Color(0xFF525556),
            letterSpacing: 0,
          ),
          //Body/Body Small/Semibold
          bodySmall: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: 22 / 14,
            letterSpacing: 0,
            color: Color(0xFF004CB5),
          ),
          labelLarge: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 20 / 16,
            letterSpacing: -0.2,
            color: Color(0xFF838485),
          ),

          //Body/Label Medium/Medium
          labelMedium: GoogleFonts.inter(
            fontSize: 14,
            height: 18 / 14,
            letterSpacing: -0.1,
          ),

          //
          displayMedium: GoogleFonts.poppins(
            fontSize: 24,
            height: 30 / 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //light theme ra dark theme yeha define gareko ho.
      darkTheme: ThemeData.dark(), // Dark theme
      //Themne Change
      themeMode:
          themeFromProvider.themeMode == ThemeModeEnum.light
              ? ThemeMode.light
              : ThemeMode.dark,

      home: HomeScreen(),
      // FocusNodeResearch(),
      // HomeScreenSecondDesign(),
      // FirstUi(),
      // HomeScreenUiDesign(),
    );
  }
}
