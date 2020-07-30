import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/others/FadeAnimation.dart';
import 'package:lebihdekatdengantouna/screens/budaya/BudayaScreen.dart';
import 'package:lebihdekatdengantouna/screens/komunitas/KomunitasScreen.dart';
import 'package:lebihdekatdengantouna/screens/kuliner/KulinerScreen.dart';
import 'package:lebihdekatdengantouna/screens/loker/LokerScreen.dart';
import 'package:lebihdekatdengantouna/screens/oleholeh/OlehOlehScreen.dart';
import 'package:lebihdekatdengantouna/screens/organisasi/OrganisasiScreen.dart';
import 'package:lebihdekatdengantouna/screens/tourguide/TourGuideScreen.dart';
import 'package:lebihdekatdengantouna/screens/wisata/WisataScreen.dart';
import 'package:lebihdekatdengantouna/services/ApiService.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetFutureBuilderModelTwo.dart';
import 'package:url_launcher/url_launcher.dart';

class UtamaScreen extends StatefulWidget {
  @override
  _UtamaScreenState createState() => _UtamaScreenState();
}

class _UtamaScreenState extends State<UtamaScreen> {
  ApiService apiService = new ApiService();
  Future<List> wisatas;
  Future<List> kuliners;

  @override
  void initState() {
    wisatas = apiService.getData("api/wisata/limit/5");
    kuliners = apiService.getData("api/kuliner/limit/5");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
      child: new SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new FadeAnimation(
                0.2,
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          "Selamat Datang",
                          style: new TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        new Text(
                          "di Ampana - Touna, Sulawesi Tengah",
                          style: new TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Dalam Aplikasi ",
                                style: new TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              _buildTextTitle("'", Colors.grey),
                              _buildTextTitle("H", kColorPrimary),
                              _buildTextTitle("A", kColorSecondary),
                              _buildTextTitle("I", kColorThird),
                              _buildTextTitle(" ", kColorPrimary),
                              _buildTextTitle("T", kColorFourth),
                              _buildTextTitle("O", kColorPrimary),
                              _buildTextTitle("U", kColorSecondary),
                              _buildTextTitle("N", kColorThird),
                              _buildTextTitle("A", kColorFourth),
                              _buildTextTitle("'", Colors.grey),
                            ],
                          ),
                        ),
                      ],
                    ),
                    new IconButton(
                      icon: new Icon(
                        Icons.map,
                        color: Colors.grey,
                      ),
                      onPressed: () async {
                        dynamic url =
                            'https://www.google.com/maps/place/Tojo+Una-Una+Regency,+Central+Sulawesi/@-1.1418954,121.432211,10.25z/data=!4m5!3m4!1s0x2d88a780d3568237:0x3030bfbcaf77140!8m2!3d-1.098757!4d121.5370003';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    )
                  ],
                ),
              ),
              new SizedBox(
                height: 30.0,
              ),
              new FadeAnimation(
                0.4,
                new Text(
                  "Jelajahi",
                  style: new TextStyle(
                      fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
              ),
              new SizedBox(
                height: 10.0,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new FadeAnimation(
                    0.42,
                    _buildListJelajahi(
                        kColorPrimary, "Kuliner", "assets/images/kuliner.png"),
                  ),
                  new FadeAnimation(
                    0.44,
                    _buildListJelajahi(
                        kColorSecondary, "Wisata", "assets/images/wisata.png"),
                  ),
                  new FadeAnimation(
                    0.46,
                    _buildListJelajahi(
                        kColorThird, "Loker", "assets/images/loker.png"),
                  ),
                  new FadeAnimation(
                    0.48,
                    _buildListJelajahi(
                        kColorFourth, "Budaya", "assets/images/budaya.png"),
                  ),
                ],
              ),
              new SizedBox(
                height: 10.0,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new FadeAnimation(
                    0.52,
                    _buildListJelajahi(kColorThird, "Organisasi",
                        "assets/images/organisasi.png"),
                  ),
                  new FadeAnimation(
                    0.54,
                    _buildListJelajahi(kColorFourth, "Komunitas",
                        "assets/images/komunitas.png"),
                  ),
                  new FadeAnimation(
                    0.56,
                    _buildListJelajahi(kColorPrimary, "Oleh-Oleh",
                        "assets/images/oleh-oleh.png"),
                  ),
                  new FadeAnimation(
                    0.58,
                    _buildListJelajahi(kColorSecondary, "Tourguide",
                        "assets/images/tourgate.png"),
                  ),
                ],
              ),
              new SizedBox(
                height: 30.0,
              ),
              new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (BuildContext context) {
                        return new WisataScreen();
                      },
                    ),
                  );
                },
                child: new FadeAnimation(0.6, _buildTitle("Wisata")),
              ),
              new SizedBox(
                height: 10.0,
              ),
              new FadeAnimation(
                0.7,
                new WidgetFutureBuilderModelTwo(
                  data: wisatas,
                  tag: "wisata",
                ),
              ),
              new SizedBox(
                height: 30.0,
              ),
              new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (BuildContext context) {
                        return new KulinerScreen();
                      },
                    ),
                  );
                },
                child: new FadeAnimation(0.8, _buildTitle("Kuliner")),
              ),
              new SizedBox(
                height: 10.0,
              ),
              new FadeAnimation(
                0.9,
                new WidgetFutureBuilderModelTwo(
                  data: kuliners,
                  tag: "kuliner",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(title) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new Text(
          title,
          style: new TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        new Text(
          "Lihat Selengkapnya",
          style: new TextStyle(
            color: Colors.grey,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  TextSpan _buildTextTitle(char, color) {
    return new TextSpan(
      text: char,
      style: new TextStyle(
        color: color,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildListJelajahi(color, title, icon) {
    return new Container(
      width: MediaQuery.of(context).size.width / 4.7,
      height: 50,
      decoration: new BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: new Column(
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (BuildContext context) {
                    if (title == "Kuliner") {
                      return new KulinerScreen();
                    } else if (title == "Wisata") {
                      return new WisataScreen();
                    } else if (title == "Loker") {
                      return new LokerScreen();
                    } else if (title == "Budaya") {
                      return new BudayaScreen();
                    } else if (title == "Organisasi") {
                      return new OrganisasiScreen();
                    } else if (title == "Komunitas") {
                      return new KomunitasScreen();
                    } else if (title == "Oleh-Oleh") {
                      return new OlehOlehScreen();
                    } else if (title == "Tourguide") {
                      return new TourGuideScreen();
                    } else {
                      return new LokerScreen();
                    }
                  },
                ),
              );
            },
            child: new Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              width: 30.0,
              height: 30.0,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage(
                    icon,
                  ),
                ),
              ),
            ),
          ),
          new Text(
            title,
            style: new TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
