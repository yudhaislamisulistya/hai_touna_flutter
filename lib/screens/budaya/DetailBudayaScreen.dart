import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetDetailModelOne.dart';

class DetailBudayaScreen extends StatefulWidget {
  final String title;
  final String image;
  final String content;
  final String tag;

  DetailBudayaScreen({
    this.title,
    this.image,
    this.content,
    this.tag,
  });

  @override
  _DetailBudayaScreenState createState() => _DetailBudayaScreenState();
}

class _DetailBudayaScreenState extends State<DetailBudayaScreen> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return WidgetDetailModelOne(
      type: "Budaya",
      title: widget.title,
      image: widget.image,
      content: widget.content,
      color: kColorFourth,
      tag: widget.tag,
    );
  }
}
