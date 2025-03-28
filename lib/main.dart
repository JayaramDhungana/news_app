import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/pages/home_screen.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/pages/posts_showing_screen.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/pages/show_random_email.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/pages/show_random_joke.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/theme_provider.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/theme.dart';
import 'package:news_using_clean_architecture/ui_design/presentation/page/home_screen_ui_design.dart';
import 'package:news_using_clean_architecture/ui_design/presentation/widgets/members_container_widgets.dart';

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
    final themeFromProvider = ref.watch(themeProvider);

    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            //Body/Body Medium/Semibold
            textTheme: TextTheme(
              bodyMedium: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                height: 24 / 16.h,
                color: Color(0xFF262829),
                letterSpacing: 0,
              ),

              //Body/Label Small/Regular
              labelSmall: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                height: 18 / 14.h,
                color: Color(0xFF525556),
                letterSpacing: 0,
              ),
              //Body/Body Small/Semibold
              bodySmall: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                height: 22 / 14.h,
                letterSpacing: 0,
                color: Color(0xFF004CB5),
              ),
              labelLarge: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                height: 20 / 16.h,
                letterSpacing: -0.2.w,
                color: Color(0xFF838485),
              ),

              //Body/Label Medium/Medium
              labelMedium: GoogleFonts.inter(
                fontSize: 14.sp,
                height: 18 / 14.h,
                letterSpacing: -0.1.w,
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

          home: HomeScreenUiDesign(),
        );
      },
    );
  }
}
