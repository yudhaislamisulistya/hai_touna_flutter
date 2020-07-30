import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetDetailModelOne.dart';

class DetailOlehOlehScreen extends StatefulWidget {
  final String title;
  final String image;
  final String content;
  final String tag;

  DetailOlehOlehScreen({this.title, this.image, this.content, this.tag});
  @override
  _DetailOlehOlehScreenState createState() => _DetailOlehOlehScreenState();
}

class _DetailOlehOlehScreenState extends State<DetailOlehOlehScreen> {
  @override
  Widget build(BuildContext context) {
    return WidgetDetailModelOne(
      type: "Oleh - Oleh",
      title: widget.title,
      image: widget.image,
      content: widget.content,
      tag: widget.tag,
      color: kColorPrimary,
    );
  }
}
