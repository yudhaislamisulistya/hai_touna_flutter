import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';

class SumberDataPengaturanScreen extends StatefulWidget {
  @override
  _SumberDataPengaturanScreenState createState() =>
      _SumberDataPengaturanScreenState();
}

class _SumberDataPengaturanScreenState
    extends State<SumberDataPengaturanScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: new AppBar(
        title: new Text(
          "Sumber Data",
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
      body: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Text(
                "Data yang diperoleh hingga diinformasikan melalui aplikasi 'Hai Touna'  berdasarkan beberapa hal",
                style: new TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
              new SizedBox(
                height: 20.0,
              ),
              _buildListSumberData("1", "Data Mandiri"),
              _buildListSumberData("2", "Data Masyarakat"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListSumberData(number, title) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(10, 10), // changes position of shadow
          ),
        ],
      ),
      child: new ListTile(
        leading: new Container(
          width: 80,
          height: 80,
          child: new Align(
            alignment: Alignment.center,
            child: new Text(
              number,
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        title: new Text(
          title,
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.0
          ),
        ),
      ),
    );
  }
}
