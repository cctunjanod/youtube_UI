import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:youtube_app/pages/home_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: AnimatedSplashScreen(
        centered: true,
        nextScreen: HomePage(),
        splash: Image.asset('assets/images/play-youtube-Icon.png',height: 60,width: 120,),
        pageTransitionType: PageTransitionType.fade,
        duration: 3000,
        backgroundColor: Colors.white,
      ),
    );
  }
}

