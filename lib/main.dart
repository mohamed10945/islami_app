import 'package:flutter/material.dart';
import 'package:islami_app/app_thame.dart';
import 'package:islami_app/home.dart';
import 'package:islami_app/tabs/hadeth/hadeth_content_screen.dart';
import 'package:islami_app/tabs/quran/sura_content_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SuraContentScreen.routeName: (context) => SuraContentScreen(),
        HadethContentScreen.routeName: (context) => HadethContentScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
