import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../orginal_home_page.dart';

class SplashPage extends StatefulWidget {
  static final String route = 'splash_page';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.pushReplacementNamed(
            context, OrHomePage.route));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/background.jpg'),fit: BoxFit.cover)
        ),

        child: Center(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                padding: EdgeInsets.all(0),
                alignment: Alignment.center,
                width: double.infinity,
                child: Text('Funny Drag Quiz',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 60,fontFamily: 'Billabong',color: Colors.white),),
              ),
              Container(
                height: 200,
                width: 200,
                child: Lottie.asset('assets/jsons/lottie.json'),
              ),
            ],
          )
        ),    
    )
    );
  }
}
