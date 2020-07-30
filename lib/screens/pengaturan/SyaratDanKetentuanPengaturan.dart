import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetContainerModelOne.dart';

class SyaratDanKetentuan extends StatelessWidget {
  final String konten;

  SyaratDanKetentuan({this.konten});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Syarat Dan Ketentuan",
          style: new TextStyle(
            color: Colors.grey,
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
        backgroundColor: kBackgroundColor,
      ),
      body: WidgetContainerModelOne(

        konten: konten,
      ),
    );
  }
}
