import 'package:flutter/material.dart';

class WidgetListModelThree extends StatelessWidget {
  final String title;
  final String tag;
  final String deskripsi;
  final String profil;
  final String kontak;
  final String image;
  final String tanggal;
  final Function press;

  WidgetListModelThree({
    this.title,
    this.tag,
    this.deskripsi,
    this.profil,
    this.kontak,
    this.image,
    this.tanggal,
    this.press
  });
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
            color: Colors.grey.withOpacity(0.1),
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
                    fit: BoxFit.cover
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
            "Tanggal Upload : $tanggal",
            style: new TextStyle(
              color: Colors.grey,
              fontSize: 10.0,
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
