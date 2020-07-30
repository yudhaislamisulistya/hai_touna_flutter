import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/screens/budaya/ListBudayaScreen.dart';
import 'package:lebihdekatdengantouna/services/ApiService.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetFutureBuilderModelTwo.dart';

class BudayaScreen extends StatefulWidget {
  @override
  _BudayaScreenState createState() => _BudayaScreenState();
}

class _BudayaScreenState extends State<BudayaScreen> {
  ApiService apiService = new ApiService();
  Future<List> rumahAdat;
  Future<List> sukuBangsa;

  @override
  void initState() {
    rumahAdat = apiService.getData("api/budaya/jenis/Rumah Adat/limit/5");
    sukuBangsa = apiService.getData("api/budaya/jenis/Suku Bangsa/limit/5");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: kBackgroundColor,
      child: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: ImageClipper(),
              child: Image.asset(
                "assets/images/wisata-2.jpg",
                fit: BoxFit.fill,
                width: screenWidth,
                color: Color(0x99000000),
                colorBlendMode: BlendMode.darken,
                height: screenHeight * 0.4,
              ),
            ),
          ),
          new SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: screenWidth * 0.2, right: 10.0),
                  child: new Text(
                    "Budaya\nTojo Una - Una",
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.2, right: 10.0, top: 5.0),
                  child: new Text(
                    "Rumah Adat, Pakaian Adat, Upacara Adat, Seni Musik, Seni Tari, Seni Rupa, Senjata, Suku Bangsa, Bahasa Daerah",
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: new Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Daftar",
                      style: new TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      _buildListBudaya(
                        "Rumah Adat",
                        kColorPrimary,
                      ),
                      _buildListBudaya(
                        "Pakaian Adat",
                        kColorSecondary,
                      ),
                      _buildListBudaya(
                        "Upacara Adat",
                        kColorThird,
                      ),
                      _buildListBudaya(
                        "Seni Musik",
                        kColorFourth,
                      ),
                      _buildListBudaya(
                        "Seni Rupa",
                        kColorPrimary,
                      ),
                      _buildListBudaya(
                        "Senjata",
                        kColorSecondary,
                      ),
                      _buildListBudaya(
                        "Suku Bangsa",
                        kColorThird,
                      ),
                      _buildListBudaya(
                        "Bahasa Daerah",
                        kColorFourth,
                      ),
                    ],
                  ),
                ),
                new SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: new Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Rumah Adat",
                      style: new TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                new Align(
                  alignment: Alignment.centerLeft,
                  child: new WidgetFutureBuilderModelTwo(
                    data: rumahAdat,
                    tag: "budaya",
                  ),
                ),
                new SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: new Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Suku Bangsa",
                      style: new TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                new Align(
                  alignment: Alignment.centerLeft,
                  child: new WidgetFutureBuilderModelTwo(
                    data: sukuBangsa,
                    tag: "budaya",
                  ),
                ),
                new SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }



  Widget _buildListBudaya(title, color) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
      child: ClipOval(
        child: new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (BuildContext context) {
                  return new ListBudayaScreen(title: title,);
                },
              ),
            );
          },
          child: new Container(
            width: 80,
            height: 80,
            color: color,
            child: new Center(
              child: new Text(
                title,
                style: new TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 12.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartingPoint = Offset(0, 40);
    Offset curveEndPoint = Offset(size.width, size.height * 0.95);
    path.lineTo(curveStartingPoint.dx, curveStartingPoint.dy - 5);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.85,
        curveEndPoint.dx - 60, curveEndPoint.dy + 10);
    path.quadraticBezierTo(size.width * 0.99, size.height * 0.99,
        curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
