import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:html_character_entities/html_character_entities.dart';
import 'package:lebihdekatdengantouna/contants.dart';

class DetailEventScreen extends StatelessWidget {
  final String title;
  final String date;
  final String dateEvent;
  final String desc;
  final String image;

  DetailEventScreen(
      {this.title, this.date, this.dateEvent, this.desc, this.image});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: new AppBar(
        title: new Text(
          "Detail Event",
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(20.0),
        child: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                width: 150.0,
                height: 200.0,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular(
                    10.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(10, 10), // changes position of shadow
                    ),
                  ],
                ),
                child: new Container(
                  width: 150.0,
                  height: 200.0,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(
                      10.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(10, 10), // changes position of shadow
                      ),
                    ],
                    image: new DecorationImage(
                        image: new NetworkImage(image), fit: BoxFit.cover),
                  ),
                ),
              ),
              new SizedBox(
                height: 5.0,
              ),
              new Text(
                title,
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              new SizedBox(
                height: 10.0,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "Tanggal Upload",
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      new Text(
                        date,
                        style: new TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      new Text(
                        "Tanggal Event",
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      new Text(
                        dateEvent,
                        style: new TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
              new SizedBox(
                height: 10.0,
              ),
              new Align(
                alignment: Alignment.centerLeft,
                child: new Text(
                  "Keterangan",
                  style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0),
                ),
              ),
              new Align(
                alignment: Alignment.centerLeft,
                child: new Html(
                  data: HtmlCharacterEntities.decode(desc),
                  style: {
                    "body": Style(
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.all(0),
                      textAlign: TextAlign.justify,
                    ),
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
