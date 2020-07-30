import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:html_character_entities/html_character_entities.dart';
import 'package:lebihdekatdengantouna/contants.dart';

class WidgetDetailModelOne extends StatelessWidget {
  final String type;
  final String title;
  final String image;
  final String content;
  final String tag;
  final Color color;

  WidgetDetailModelOne(
      {this.type, this.title, this.image, this.content, this.tag, this.color});

  @override
  Widget build(BuildContext context) {
    print(content);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: new AppBar(
        title: new Text(
          "Detail $type",
          style: new TextStyle(
            color: Colors.grey,
          ),
        ),
        elevation: 0,
        backgroundColor: kBackgroundColor,
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: new SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                padding: EdgeInsets.all(6),
                height: 305,
                width: 305,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: type == "Organisasi" || type == "Komunitas"
                      ? Colors.transparent
                      : color.withOpacity(0.5),
                ),
                child: new Hero(
                  tag: tag,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n",
                          style: new TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: type,
                          style: TextStyle(
                            color: color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              new Html(
                data: HtmlCharacterEntities.decode(content),
                style: {
                  "body": Style(
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.all(0),
                      textAlign: TextAlign.justify),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
