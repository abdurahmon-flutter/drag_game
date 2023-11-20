import 'package:drag_game/game_page.dart';
import 'package:drag_game/home_english_page.dart';
import 'package:drag_game/orginal_home_page.dart';
import 'package:drag_game/russian_page.dart';
import 'package:drag_game/splash_page/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.route:(context)=>HomePage(),
        OrHomePage.route:(context)=>OrHomePage(),
        SplashPage.route:(context)=>SplashPage(),
        RussianPage.route:(context)=>RussianPage(),
        GamePage.route:(context)=>GamePage()

       }
    );
  }
}
