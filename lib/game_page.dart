import 'package:drag_game/data/global.dart';
import 'package:drag_game/home_english_page.dart';
import 'package:drag_game/orginal_home_page.dart';
import 'package:flutter/material.dart';

import 'data/model-data.dart';

class GamePage extends StatefulWidget {
  static final String route = 'game';

  const GamePage({super.key});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int score = 0;
  int gameover = 0;
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
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'Drag Quiz',
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
                                        gameover++;
                                        if (gameover == Global.list.length) {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) {
                                              return AlertDialog(
                                                backgroundColor: Colors.black54,
                                                title: Container(
                                                  child: Text(
                                                    'You Win!',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Billabong'),
                                                  ),
                                                  alignment: Alignment.center,
                                                ),
                                                content: Container(
                                                  child: Text(
                                                    'Your score is $score',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Billabong'),
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator
                                                        .pushNamedAndRemoveUntil(context, OrHomePage.route, (route) => false);
                                                    },
                                                    child: Text(
                                                      'Exit',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'Billabong',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
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
                                            color: Colors.brown.shade900,
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
                                        color: Colors.yellow.shade800,
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
}
