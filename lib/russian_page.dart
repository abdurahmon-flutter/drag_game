import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'data/global.dart';
import 'game_page.dart';

class RussianPage extends StatefulWidget {
  static final String route='rus';
  const RussianPage({super.key});

  @override
  State<RussianPage> createState() => _RussianPageState();
}

class _RussianPageState extends State<RussianPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration:const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/background.jpg'),fit: BoxFit.cover),

        ),
        child: Column(
          children: [
            Container(
              height: 120,
              width: 120,
              child: Lottie.asset('assets/jsons/appbar.json'),

            ),
            Expanded(
              child: ListView(
                children: [
                  InkWell(
                    onTap: () {
                      Global.image = 'assets/images/background.jpg';
                      Global.list = Global.RussianAnimals;
                      Navigator.pushNamed(context, GamePage.route);
                    },
                    child: gameContainer('животные', 'assets/images/animals.jpg'),
                  ),
                  InkWell(
                    onTap: () {
                      Global.image = 'assets/images/background.jpg';
                      Global.list = Global.RussianFruits;
                      Navigator.pushNamed(context, GamePage.route);
                    },
                    child: gameContainer('фрукты', 'assets/images/fruits.jpg'),
                  ),
                  InkWell(
                    onTap: () {
                      Global.image = 'assets/images/background.jpg';
                      Global.list = Global.RussianVeg;
                      Navigator.pushNamed(context, GamePage.route);
                    },
                    child: gameContainer('овощи', 'assets/images/vegetables.jpg'),
                  ),
                  InkWell(
                    onTap: () {
                      Global.image = 'assets/images/background.jpg';
                      Global.list = Global.RussianColor;
                      Navigator.pushNamed(context, GamePage.route);
                    },
                    child: gameContainer('цвета', 'assets/images/colors.jpg'),
                  ),
                  InkWell(
                    onTap: () {
                      Global.image = 'assets/images/background.jpg';
                      Global.list = Global.RussianNumbers;
                      Navigator.pushNamed(context, GamePage.route);
                    },
                    child: gameContainer('цифры', 'assets/images/numbers.jpg'),
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
