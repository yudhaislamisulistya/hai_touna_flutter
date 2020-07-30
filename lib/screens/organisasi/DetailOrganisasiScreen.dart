import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetDetailModelOne.dart';

class DetailOrganisasiScreen extends StatefulWidget {
  final String title;
  final String image;
  final String content;
  final String tag;

  DetailOrganisasiScreen({this.title, this.image, this.content, this.tag});
  @override
  _DetailOrganisasiScreenState createState() => _DetailOrganisasiScreenState();
}

class _DetailOrganisasiScreenState extends State<DetailOrganisasiScreen> {
  @override
  Widget build(BuildContext context) {
    return WidgetDetailModelOne(
      type: "Organisasi",
      title: widget.title,
      image: widget.image,
      content: widget.content,
      tag: widget.tag,
      color: kColorThird,
    );
  }
}
