import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetDetailModelOne.dart';

class DetailKulinerScreen extends StatefulWidget {
  final String title;
  final String image;
  final String content;
  final String tag;

  DetailKulinerScreen({this.title, this.image, this.content, this.tag});
  @override
  _DetailKulinerScreenState createState() => _DetailKulinerScreenState();
}

class _DetailKulinerScreenState extends State<DetailKulinerScreen> {
  @override
  Widget build(BuildContext context) {
    return WidgetDetailModelOne(
      type: "Kuliner",
      title: widget.title,
      image: widget.image,
      content: widget.content,
      tag: widget.tag,
      color: kColorPrimary,
    );
  }
}
