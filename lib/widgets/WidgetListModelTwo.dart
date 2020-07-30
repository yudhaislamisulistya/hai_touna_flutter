import 'package:flutter/material.dart';

class WidgetListModelTwo extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final String tag;
  final Color color;
  final Function press;

  WidgetListModelTwo(
      {this.title, this.subtitle, this.image, this.tag, this.color, this.press});

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
            onTap: press,
            selected: true,
            leading: new Hero(
              tag: tag,
              child: new Container(
                width: 60.0,
                height: 80.0,
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
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
            subtitle: new Text(
              subtitle,
              style: new TextStyle(
                color: Colors.grey,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: tag == "tourguide" ? new Icon(
              Icons.add_call, color: Colors.green,) : new Text(
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
