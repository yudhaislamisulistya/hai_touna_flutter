import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/screens/pengaturan/AdminPengaturanScreen.dart';

class WidgetNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: new SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              width: 300,
              height: 300,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage("assets/images/error.png"),
                ),
              ),
            ),
            new Text(
              "Data Belum Ada, Jika Kalian Ingin Menambahkan Informasi Silahkan Hubungi Admin Dibawah Ini",
              style: new TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            new MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) {
                      return new AdminPengaturanScreen();
                    },
                  ),
                );
              },
              color: Colors.green,
              textColor: Colors.white,
              child: new Text("Hubungi"),
            )
          ],
        ),
      ),
    );
  }
}
