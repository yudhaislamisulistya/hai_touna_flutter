import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetDetailModelOne.dart';

class DetailWisataScreen extends StatefulWidget {
  final String title;
  final String image;
  final String content;
  final String tag;

  DetailWisataScreen({this.title, this.image, this.content, this.tag});
  @override
  _DetailWisataScreenState createState() => _DetailWisataScreenState();
}

class _DetailWisataScreenState extends State<DetailWisataScreen> {
  @override
  Widget build(BuildContext context) {
    return WidgetDetailModelOne(
      type: "Wisata",
      title: widget.title,
      image: widget.image,
      content: widget.content,
      tag: widget.tag,
      color: kColorSecondary,
    );
  }
}
