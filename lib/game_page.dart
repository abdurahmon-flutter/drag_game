import 'package:drag_game/data/global.dart';
import 'package:drag_game/home_english_page.dart';
import 'package:drag_game/orginal_home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'data/model-data.dart';

class GamePage extends StatefulWidget {
  static final String route = 'game';

  const GamePage({super.key});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int score = 0;
  int gameOver = 0;
  List<Content> list2 = [];

  @override
  void initState() {
    super.initState();
    for (var e in Global.list) {
      list2.add(e);
    }
    list2.shuffle();
    for (var e in Global.list) {
      e.isDropped = false;
    }
    for (var e in list2) {
      e.isDropped = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.16;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Global.image),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'Funny Drag Quiz',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Billabong',
                  ),
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: Global.list.map((e) {
                          int i = list2.indexOf(e);
                          return Global.list[i].isDropped == true
                              ? Container(
                                  height: height,
                                )
                              : Draggable(
                                  data: Global.list[i].value,
                                  childWhenDragging: Container(
                                    height: height,
                                    padding: EdgeInsets.all(10),
                                    child: Image.asset(
                                      Global.list[i].image,
                                    ),
                                  ),
                                  feedback: SizedBox(
                                    height: height,
                                    child: Image.asset(Global.list[i].image),
                                  ),
                                  child: Container(
                                    height: height,
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(Global.list[i].image),
                                  ),
                                );
                        }).toList(),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: list2.map((e) {
                          int i = list2.indexOf(e);
                          return list2[i].isDropped == true
                              ? Container(
                                  height: height,
                                )
                              : DragTarget(
                                  onAccept: (data) {
                                    if (list2[i].value == data) {
                                      setState(() {
                                        for (var e in Global.list) {
                                          if (e.value == list2[i].value) {
                                            e.isDropped = true;
                                          }
                                        }
                                        list2[i].isDropped = true;
                                        score += 10;
                                        gameOver++;
                                        if (gameOver == Global.list.length) {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return dialog();
                                            },
                                          );
                                        }
                                      });
                                    } else {
                                      setState(() {
                                        score -= 5;
                                      });
                                    }
                                  },
                                  builder: (context, a, r) => Container(
                                    height: height,
                                    alignment: Alignment.center,
                                    child: Text(
                                      list2[i].value,
                                      style: TextStyle(
                                        shadows: [
                                          Shadow(
                                            color: Colors.white,
                                            blurRadius: 30,
                                          ),
                                          Shadow(
                                            color: Colors.black87,
                                            blurRadius: 30,
                                          ),
                                          Shadow(
                                            color: Colors.black,
                                            blurRadius: 30,
                                          ),
                                        ],
                                        letterSpacing: 1.5,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'Score: $score',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Billabong',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  dialog() {
    return AlertDialog(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: Colors.white.withOpacity(0.6),
      title: Center(child: Lottie.asset('assets/jsons/text.json')),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              child: Lottie.asset('assets/jsons/winner.json'),
            ),
            Container(
              padding: EdgeInsets.zero,
              height: 50,
              child: Text(
                textAlign: TextAlign.center,
                "Your score:$score",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            )
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(vertical: 12)),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      OrHomePage.route, (route) => false);
                },
                child: Icon(
                  Icons.home,
                  color: Colors.brown.shade700,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 12)),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    Global.list.shuffle();
                    list2.shuffle();
                    for (var e in Global.list) {
                      e.isDropped = false;
                    }
                    for (var e in list2) {
                      e.isDropped = false;
                    }
                    score = 0;
                    gameOver = 0;
                  });
                },
                child: Text(
                  "Restart",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.brown.shade700,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
