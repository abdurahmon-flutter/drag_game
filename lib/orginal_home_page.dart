import 'package:drag_game/home_english_page.dart';
import 'package:drag_game/russian_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'data/global.dart';
import 'game_page.dart';

class OrHomePage extends StatefulWidget {
  static final String route = 'orginal';

  const OrHomePage({super.key});

  @override
  State<OrHomePage> createState() => _OrHomePageState();
}

class _OrHomePageState extends State<OrHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover)
        ),
        child:Column(
          children: [
            Container(
              height: 100,
              padding: EdgeInsets.all(0),
              alignment: Alignment.center,
              width: double.infinity,
              child: Text('Funny Drag Quiz',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 60,fontFamily: 'Billabong',color: Colors.white),),
            ),
            Expanded(
              child: ListView(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HomePage.route);
                    },
                    child: gameContainer('English Quiz', 'assets/images/english.jpg'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RussianPage.route);
                    },
                    child: gameContainer('Russian Quiz', 'assets/images/russian.jpg'),
                  ),
                  InkWell(
                    onTap: () {
                      Global.image = 'assets/images/background.jpg';
                      Global.list = Global.MathQuiz;
                      Navigator.pushNamed(context, GamePage.route);
                    },
                    child: gameContainer('Math Quiz', 'assets/images/math.jpg'),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
Widget gameContainer(name, image) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(25),

      ),
      child: Column(
        children: [
          SizedBox(
            height: 210,
            child: Image.asset(image),
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black54),
          )
        ],
      ),
    );
  }
}
