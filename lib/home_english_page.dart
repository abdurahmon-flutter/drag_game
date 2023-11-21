import 'package:drag_game/data/global.dart';
import 'package:drag_game/game_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  static final String route = 'home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
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
                      Global.image = 'assets/images/background.jpg';
                      Global.list = Global.EnglishAnimals;
                      Navigator.pushNamed(context, GamePage.route);
                    },
                    child:
                        gameContainer('Animals', 'assets/images/animals.jpg'),
                  ),
                  InkWell(
                    onTap: () {
                      Global.image = 'assets/images/background.jpg';
                      Global.list = Global.EnglishFruits;
                      Navigator.pushNamed(context, GamePage.route);
                    },
                    child: gameContainer('Fruits', 'assets/images/fruits.jpg'),
                  ),
                  InkWell(
                    onTap: () {
                      Global.image = 'assets/images/background.jpg';
                      Global.list = Global.EnglishVeg;
                      Navigator.pushNamed(context, GamePage.route);
                    },
                    child: gameContainer(
                        'Vagetables', 'assets/images/vegetables.jpg'),
                  ),
                  InkWell(
                    onTap: () {
                      Global.image = 'assets/images/background.jpg';
                      Global.list = Global.EnglishColor;
                      Navigator.pushNamed(context, GamePage.route);
                    },
                    child: gameContainer('Colors', 'assets/images/colors.jpg'),
                  ),
                  InkWell(
                    onTap: () {
                      Global.image = 'assets/images/background.jpg';
                      Global.list = Global.EnglishNumbers;
                      Navigator.pushNamed(context, GamePage.route);
                    },
                    child:
                        gameContainer('Numbers', 'assets/images/numbers.jpg'),
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