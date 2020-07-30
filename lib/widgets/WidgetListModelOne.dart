import 'package:flutter/material.dart';

class WidgetListModelOne extends StatelessWidget {
  final String title;
  final String image;
  final String tag;
  final Function press;
  final Color color;

  WidgetListModelOne({this.title, this.image, this.tag, this.press, this.color});

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(10, 10), // changes position of shadow
          ),
        ],
      ),
      child: new ListTileTheme(
        selectedColor: Colors.red,
        style: ListTileStyle.drawer,
        child: new ListTile(
          selected: true,
          onTap: press,
          leading: new Hero(
            tag: tag,
            child: new Container(
              width: 50.0,
              height: 50.0,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          title: new Text(
            title,
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: new Text(
            "Detail",
            style: new TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
