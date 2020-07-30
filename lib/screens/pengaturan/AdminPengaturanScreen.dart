import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminPengaturanScreen extends StatefulWidget {
  @override
  _AdminPengaturanScreenState createState() => _AdminPengaturanScreenState();
}

class _AdminPengaturanScreenState extends State<AdminPengaturanScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: new AppBar(
        title: new Text(
          "Admin",
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
                "Admin aplikasi 'Hai Touna' yang ada dapat hubungi melalui daftar dibawah ini. anda bisa menginformasikan kepada admin perihal penambahan informasi kedalam aplikasi maupun informasi lebih lanjut yang ingin diketahui mengenai aplikasi",
                style: new TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
              new SizedBox(
                height: 20.0,
              ),
              _buildListAdmin("Nurkhalifa Lantu", "082292918002", "assets/images/ucy.jpg"),
              _buildListAdmin("Sattura Dafa Tilanata", "082136365478", "assets/images/daffa.jpg"),
              _buildListAdmin("Zulfikri", "082271433942", "assets/images/pakar.jpg"),
              _buildListAdmin("Magfira Malongi", "082292513310", "assets/images/fira.jpg"),
              _buildListAdmin("Moh. Risky Lahay", "082291493137", "assets/images/iki.jpg"),
              _buildListAdmin("Vina Sulaeman", "082292251446", "assets/images/vina.jpg"),
              _buildListAdmin("Rifaldi A. Way", "082290043739", "assets/images/adi.jpg"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListAdmin(title, number, image){
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
        onTap: () async{
          dynamic url = 'https://api.whatsapp.com/send?phone=62' + number + '&text=Halo Saya Ingin Bertanya Admin $title Mengenai Aplikasi Hai Touna \n\n*Hai Touna*';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        leading: new Container(
          width: 60,
          height: 80,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
            ),
            shape: BoxShape.circle
          ),
        ),
        title: new Text(
          title,
          style: new TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: new Text(
          number,
          style: new TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 10.0),
        ),
        trailing: new Icon(
          Icons.call,
          color: Colors.green,
        ),
      ),
    );
  }
}
