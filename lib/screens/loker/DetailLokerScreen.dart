import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/screens/loker/DetailLokerDeskripsiScreen.dart';
import 'package:lebihdekatdengantouna/screens/loker/DetailLokerProfilScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailLokerScreen extends StatefulWidget {
  final String title;
  final String deskripsi;
  final String profil;
  final String kontak;
  final String image;
  final String tag;

  DetailLokerScreen(
      {this.title,
      this.deskripsi,
      this.profil,
      this.kontak,
      this.image,
      this.tag});

  @override
  _DetailLokerScreenState createState() => _DetailLokerScreenState();
}

class _DetailLokerScreenState extends State<DetailLokerScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Detail",
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
      body: DefaultTabController(
        length: 2,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: new Hero(
                        tag: widget.tag,
                        child: Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(widget.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      widget.title,
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Material(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                          color: kColorPrimary.withOpacity(.2),
                        ),
                      ),
                      // borderRadius: BorderRadius.circular(12.0),
                      child: TabBar(
                        unselectedLabelColor: Colors.black,
                        indicator: BoxDecoration(
                          color: kColorPrimary,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        tabs: [
                          Tab(text: "Deksripsi"),
                          Tab(text: "Profil"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: TabBarView(
                  children: [
                    DetailLokerDeksripsiScreen(
                      konten: widget.deskripsi,
                    ),
                    DetailLokerProfilScreen(
                      konten: widget.profil,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
          padding: EdgeInsets.only(left: 18.0, bottom: 25.0, right: 18.0),
          // margin: EdgeInsets.only(bottom: 25.0),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green.withOpacity(.5)),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Icon(
                  Icons.call,
                  color: Colors.green,
                ),
              ),
              SizedBox(width: 15.0),
              Expanded(
                child: SizedBox(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () async{
                      dynamic url = 'https://api.whatsapp.com/send?phone=62' + widget.kontak + "&text=Hai Saya Ingin Informasi Pemandu Dari Anda";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      "Hubungi",
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
