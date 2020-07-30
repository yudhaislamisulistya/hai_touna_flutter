import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:lebihdekatdengantouna/screens/home/HomeScreen.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenApp extends StatefulWidget {
  @override
  _SplashScreenAppState createState() => _SplashScreenAppState();
}

class _SplashScreenAppState extends State<SplashScreenApp> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    return new SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new HomeScreen(),
        loadingText: new Text("Dipersembahkan Oleh Lentera Lipuku"),
        title: new Text('Mari Mengenal Touna Lebih Dekat',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0
          ),),
        image: new Image.asset("assets/images/logo.png"),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.black
    );
  }
}

