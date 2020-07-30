import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/screens/pengaturan/AdminPengaturanScreen.dart';
import 'package:lebihdekatdengantouna/screens/pengaturan/KebijakanPrivasiPengaturan.dart';
import 'package:lebihdekatdengantouna/screens/pengaturan/SumberDataPengaturanScreen.dart';
import 'package:lebihdekatdengantouna/screens/pengaturan/SyaratDanKetentuanPengaturan.dart';
import 'package:url_launcher/url_launcher.dart';

class PengaturanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: new Text(
          "Pengaturan",
          style: new TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
        child: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Container(
                width: 200.0,
                height: 200.0,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: AssetImage(
                      "assets/images/logo.png",
                    ),
                  ),
                ),
              ),
              new SizedBox(
                height: 10.0,
              ),
              new Text(
                "Aplikasi 'Hai Touna' dibuat dan dikembangkan oleh Lentera Lipuku sebagai Organisasi Pemuda Daerah yang mewadahi para Pemuda, Mahasiswa, dan Pelajar di Daerah untuk Sama - Sama membantu Pemerintah Dalam Pengembangan Sumber Daya Manusia Demi Kemaslahatan Masyarakat Tojo Una - Una Terkhusus di Daerah Tertinggal",
                style: new TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
                textAlign: TextAlign.justify,
              ),
              new SizedBox(
                height: 20.0,
              ),
              _buildListPengaturan(
                  new Icon(Icons.priority_high), "Kebijakan Privasi", context),
              _buildListPengaturan(
                  new Icon(Icons.announcement), "Syarat & Ketentuan", context),
              _buildListPengaturan(
                  new Icon(Icons.verified_user), "Sumber Data", context),
              _buildListPengaturan(new Icon(Icons.people), "Admin", context),
              new Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                padding: const EdgeInsets.all(2.0),
                decoration: new BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: new ListTile(
                  onTap: () async {
                    dynamic url = 'https://play.google.com/store/apps/details?id=com.leadevs.haitouna';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  leading: new Icon(Icons.feedback),
                  title: new Text("Beri Masukkan / Rating"),
                ),
              ),
              new SizedBox(
                height: 10.0,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "Dipersembahkan Oleh Lentera Lipuku",
                    style: new TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  new Image(
                    image: AssetImage(
                      "assets/images/lentera-lipuku.png",
                    ),
                    width: 20,
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListPengaturan(icon, title, context) {
    return new Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.all(2.0),
      decoration: new BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: new ListTile(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (BuildContext context) {
                if (title == "Kebijakan Privasi") {
                  return new KebijakanPrivasiPengaturan(
                    konten: kontenKebijakanPrivasi,
                  );
                } else if (title == "Syarat & Ketentuan") {
                  return new SyaratDanKetentuan(
                    konten: kontentSyaratDanKetentuan,
                  );
                } else if (title == "Sumber Data") {
                  return new SumberDataPengaturanScreen();
                } else if (title == "Admin") {
                  return new AdminPengaturanScreen();
                } else if (title == "Beri Masukkan / Rating") {
                  return new AdminPengaturanScreen();
                } else {
                  return new AdminPengaturanScreen();
                }
              },
            ),
          );
        },
        leading: icon,
        title: new Text(title),
      ),
    );
  }
}
