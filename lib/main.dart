import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lebihdekatdengantouna/screens/splash/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lebih Dekat Dengan Touna',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreenApp()
    );
  }
}

