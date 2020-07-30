import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:html_character_entities/html_character_entities.dart';

class DetailLokerProfilScreen extends StatelessWidget {
  final String konten;
  DetailLokerProfilScreen({this.konten});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          new Html(
            data: HtmlCharacterEntities.decode(konten),
            style: {
              "body": Style(
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(0),
                  textAlign: TextAlign.justify
              ),
            },
          ),
        ],
      ),
    );
  }
}
