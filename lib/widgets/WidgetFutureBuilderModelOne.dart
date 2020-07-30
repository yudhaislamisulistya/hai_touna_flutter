import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/screens/budaya/DetailBudayaScreen.dart';
import 'package:lebihdekatdengantouna/screens/komunitas/DetailKomunitasScreen.dart';
import 'package:lebihdekatdengantouna/screens/kuliner/DetailKulinerScreen.dart';
import 'package:lebihdekatdengantouna/screens/loker/DetailLokerScreen.dart';
import 'package:lebihdekatdengantouna/screens/oleholeh/DetailOlehOlehScreen.dart';
import 'package:lebihdekatdengantouna/screens/organisasi/DetailOrganisasiScreen.dart';
import 'package:lebihdekatdengantouna/screens/wisata/DetailWisataScreen.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetListModelOne.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetListModelThree.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetListModelTwo.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetNotFound.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetFutureBuilderModelOne extends StatelessWidget {
  final Future<List> data;
  final RefreshController refreshController;
  final Function onRefresh;
  final Function onLoading;
  final String tag;

  WidgetFutureBuilderModelOne({
    this.data,
    this.refreshController,
    this.onRefresh,
    this.onLoading,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: new Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: new FutureBuilder<List>(
          future: data,
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              if (snapshot.data.length != 0) {
                return SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: WaterDropHeader(),
                  controller: refreshController,
                  onRefresh: onRefresh,
                  onLoading: onLoading,
                  child: new ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        if(tag == "kuliner"){
                          return _buildListKuliner(snapshot, index, context);
                        }else if(tag == "wisata"){
                          return _buildListWisata(snapshot, index, context);
                        }else if(tag == "loker"){
                          return _buildListLoker(snapshot, index, context);
                        }else if(tag == "budaya"){
                          return _buildListBudaya(snapshot, index, context);
                        }else if(tag == "organisasi"){
                          return _buildListOrganisasi(snapshot, index, context);
                        }else if(tag == "komunitas"){
                          return _buildListKomunitas(snapshot, index, context);
                        }else if(tag == "oleholeh"){
                          return _buildListOlehOleh(snapshot, index, context);
                        }else if(tag == "tourguide"){
                          return _buildListTourguide(snapshot, index, context);
                        }else{
                          return WidgetNotFound();
                        }
                      }),
                );
              } else {
                return new WidgetNotFound();
              }
            } else if (snapshot.hasError == true){
              return new Container(
                child: Column(
                  children: <Widget>[
                    new Container(
                      width: 300,
                      height: 300,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: AssetImage("assets/images/noconnection.png"),
                        ),
                      ),
                    ),
                    new SizedBox(
                      height: 20,
                    ),
                    new Text("Ups..Tidak Ada Koneksi Internet"),
                  ],
                ),
              );
            }else {
              return new Center(
                child: new CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildListKuliner(snapshot, index, context) {
    return WidgetListModelOne(
      title: snapshot.data[index]["judul"],
      tag: "kuliner" + snapshot.data[index]["id_kuliner"].toString(),
      color: kColorFourth,
      image: "https://hai-touna.lentera-lipuku.com/files/" +
          snapshot.data[index]["gambar"],
      press: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) {
              return new DetailKulinerScreen(
                title: snapshot.data[index]["judul"],
                content: snapshot.data[index]["keterangan"],
                tag: "kuliner" + snapshot.data[index]["id_kuliner"].toString(),
                image: "https://hai-touna.lentera-lipuku.com/files/" +
                    snapshot.data[index]["gambar"],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildListWisata(snapshot, index, context) {
    return WidgetListModelOne(
      title: snapshot.data[index]["judul"],
      tag: "wisata" + snapshot.data[index]["id_wisata"].toString(),
      color: kColorFourth,
      image: "https://hai-touna.lentera-lipuku.com/files/" +
          snapshot.data[index]["gambar"],
      press: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) {
              return new DetailWisataScreen(
                title: snapshot.data[index]["judul"],
                content: snapshot.data[index]["keterangan"],
                tag: "wisata" + snapshot.data[index]["id_wisata"].toString(),
                image: "https://hai-touna.lentera-lipuku.com/files/" +
                    snapshot.data[index]["gambar"],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildListLoker(snapshot, index, context){
    return WidgetListModelThree(
      title: snapshot.data[index]["judul"],
      tag: "loker" + snapshot.data[index]["id_loker"].toString(),
      deskripsi: snapshot.data[index]["deskripsi"],
      profil: snapshot.data[index]["profil"],
      kontak: snapshot.data[index]["kontak"],
      image: "https://hai-touna.lentera-lipuku.com/files/" + snapshot.data[index]["gambar"],
      tanggal: snapshot.data[index]["created_at"],
      press: (){
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) {
              return new DetailLokerScreen(
                title: snapshot.data[index]["judul"],
                tag: "loker" + snapshot.data[index]["id_loker"].toString(),
                deskripsi: snapshot.data[index]["deskripsi"],
                profil: snapshot.data[index]["profil"],
                kontak: snapshot.data[index]["kontak"],
                image: "https://hai-touna.lentera-lipuku.com/files/" + snapshot.data[index]["gambar"],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildListBudaya(snapshot, index, context) {
    return WidgetListModelOne(
      title: snapshot.data[index]["judul"],
      tag: "budaya" + snapshot.data[index]["id_budaya"].toString(),
      color: kColorFourth,
      image: "https://hai-touna.lentera-lipuku.com/files/" +
          snapshot.data[index]["gambar"],
      press: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) {
              return new DetailBudayaScreen(
                title: snapshot.data[index]["judul"],
                content: snapshot.data[index]["keterangan"],
                tag: "budaya" + snapshot.data[index]["id_budaya"].toString(),
                image: "https://hai-touna.lentera-lipuku.com/files/" +
                    snapshot.data[index]["gambar"],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildListOrganisasi(snapshot, index, context) {
    return WidgetListModelOne(
      title: snapshot.data[index]["judul"],
      tag: "organisasi" + snapshot.data[index]["id_organisasi"].toString(),
      color: kColorFourth,
      image: "https://hai-touna.lentera-lipuku.com/files/" +
          snapshot.data[index]["gambar"],
      press: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) {
              return new DetailOrganisasiScreen(
                title: snapshot.data[index]["judul"],
                content: snapshot.data[index]["keterangan"],
                tag: "organisasi" +
                    snapshot.data[index]["id_organisasi"].toString(),
                image: "https://hai-touna.lentera-lipuku.com/files/" +
                    snapshot.data[index]["gambar"],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildListKomunitas(snapshot, index, context) {
    return WidgetListModelOne(
      title: snapshot.data[index]["judul"],
      tag: "komunitas" + snapshot.data[index]["id_komunitas"].toString(),
      color: kColorFourth,
      image: "https://hai-touna.lentera-lipuku.com/files/" +
          snapshot.data[index]["gambar"],
      press: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) {
              return new DetailKomunitasScreen(
                title: snapshot.data[index]["judul"],
                content: snapshot.data[index]["keterangan"],
                tag: "komunitas" +
                    snapshot.data[index]["id_komunitas"].toString(),
                image: "https://hai-touna.lentera-lipuku.com/files/" +
                    snapshot.data[index]["gambar"],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildListOlehOleh(snapshot, index, context) {
    return WidgetListModelOne(
      title: snapshot.data[index]["judul"],
      tag: "oleholeh" + snapshot.data[index]["id_oleholeh"].toString(),
      color: kColorFourth,
      image: "https://hai-touna.lentera-lipuku.com/files/" +
          snapshot.data[index]["gambar"],
      press: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) {
              return new DetailOlehOlehScreen(
                title: snapshot.data[index]["judul"],
                content: snapshot.data[index]["keterangan"],
                tag:
                    "oleholeh" + snapshot.data[index]["id_oleholeh"].toString(),
                image: "https://hai-touna.lentera-lipuku.com/files/" +
                    snapshot.data[index]["gambar"],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildListTourguide(snapshot, index, context){
    return WidgetListModelTwo(
      title: snapshot.data[index]["nama"],
      subtitle: snapshot.data[index]["status"],
      image: "https://hai-touna.lentera-lipuku.com/files/" + snapshot.data[index]["gambar"],
      color: kColorSecondary,
      tag: "tourguide",
      press: () async{
        dynamic url = 'https://api.whatsapp.com/send?phone=62' + snapshot.data[index]["kontak"];
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
    );
  }
}
