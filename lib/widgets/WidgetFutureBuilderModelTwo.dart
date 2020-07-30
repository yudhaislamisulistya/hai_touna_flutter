import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/screens/budaya/DetailBudayaScreen.dart';
import 'package:lebihdekatdengantouna/screens/kuliner/DetailKulinerScreen.dart';
import 'package:lebihdekatdengantouna/screens/wisata/DetailWisataScreen.dart';

class WidgetFutureBuilderModelTwo extends StatelessWidget {
  final Future<List> data;
  final String tag;

  WidgetFutureBuilderModelTwo({this.data, this.tag});

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: tag == "kuliner" || tag == "wisata" ? 100 : 180,
      child: new FutureBuilder<List>(
        future: data,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length != 0) {
              return new ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  Color color;
                  if (index == 0) {
                    color = kColorPrimary;
                  } else if (index == 1) {
                    color = kColorSecondary;
                  } else if (index == 2) {
                    color = kColorThird;
                  } else if (index == 3) {
                    color = kColorFourth;
                  } else if (index == 4) {
                    color = kColorPrimary;
                  }

                  if (tag == "budaya") {
                    return _buildListVersiTwo(
                      snapshot.data[index]["judul"],
                      "https://hai-touna.lentera-lipuku.com/files/" +
                          snapshot.data[index]["gambar"],
                      color,
                      () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return new DetailBudayaScreen(
                                title: snapshot.data[index]["judul"],
                                content: snapshot.data[index]["keterangan"],
                                tag: "budaya" +
                                    snapshot.data[index]["id_budaya"]
                                        .toString(),
                                image:
                                    "https://hai-touna.lentera-lipuku.com/files/" +
                                        snapshot.data[index]["gambar"],
                              );
                            },
                          ),
                        );
                      },
                    );
                  } else if (tag == "wisata") {
                    return _buildListVersiOne(
                      snapshot.data[index]["judul"],
                      "https://hai-touna.lentera-lipuku.com/files/" +
                          snapshot.data[index]["gambar"],
                      color,
                      () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return new DetailWisataScreen(
                                title: snapshot.data[index]["judul"],
                                content: snapshot.data[index]["keterangan"],
                                tag: "wisata" +
                                    snapshot.data[index]["id_wisata"]
                                        .toString(),
                                image:
                                    "https://hai-touna.lentera-lipuku.com/files/" +
                                        snapshot.data[index]["gambar"],
                              );
                            },
                          ),
                        );
                      },
                    );
                  } else if (tag == "kuliner") {
                    return _buildListVersiOne(
                      snapshot.data[index]["judul"],
                      "https://hai-touna.lentera-lipuku.com/files/" +
                          snapshot.data[index]["gambar"],
                      color,
                      () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return new DetailKulinerScreen(
                                title: snapshot.data[index]["judul"],
                                content: snapshot.data[index]["keterangan"],
                                tag: "kuliner" +
                                    snapshot.data[index]["id_kuliner"]
                                        .toString(),
                                image:
                                    "https://hai-touna.lentera-lipuku.com/files/" +
                                        snapshot.data[index]["gambar"],
                              );
                            },
                          ),
                        );
                      },
                    );
                  } else {
                    return new Container();
                  }
                },
              );
            } else {
              return new Container();
            }
          } else if (snapshot.hasError == true) {
            return new Container(
              child: new Center(
                child: new Text(
                  "Ups..Tidak Ada Koneksi Internet",
                  style: new TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            );
          } else {
            return new Center(
              child: new CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildListVersiOne(title, image, color, press) {
    return new Container(
      margin: const EdgeInsets.only(right: 10.0),
      width: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image),
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new GestureDetector(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(10, 10), // changes position of shadow
                  ),
                ],
                color: color.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    title,
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListVersiTwo(title, image, color, press) {
    return new Container(
      margin: const EdgeInsets.only(left: 10.0, top: 10.0),
      width: 150.0,
      height: 100.0,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(10, 10), // changes position of shadow
          ),
        ],
      ),
      child: new GestureDetector(
        onTap: press,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Container(
              width: 150.0,
              height: 100.0,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: new BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
            ),
            new Text(
              title,
              style: new TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                decoration: TextDecoration.none,
              ),
            ),
            new Container(
              width: 150.0,
              height: 10.0,
              decoration: new BoxDecoration(
                color: color,
                borderRadius: new BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
