import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetDetailModelOne.dart';

class DetailKomunitasScreen extends StatefulWidget {
  final String title;
  final String image;
  final String content;
  final String tag;

  DetailKomunitasScreen({this.title, this.image, this.content, this.tag});
  @override
  _DetailKomunitasScreenState createState() => _DetailKomunitasScreenState();
}

class _DetailKomunitasScreenState extends State<DetailKomunitasScreen> {
  @override
  Widget build(BuildContext context) {
    return WidgetDetailModelOne(
      type: "Komunitas",
      title: widget.title,
      image: widget.image,
      content: widget.content,
      tag: widget.tag,
      color: kColorFourth,
    );
  }
}
