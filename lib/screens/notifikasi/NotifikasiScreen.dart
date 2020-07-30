import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/services/ApiService.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetNotFound.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NotifikasiScreen extends StatefulWidget {
  @override
  _NotifikasiScreenState createState() => _NotifikasiScreenState();
}

class _NotifikasiScreenState extends State<NotifikasiScreen> {
  ApiService apiService = new ApiService();
  Future<List> notifikasis;
  RefreshController _refreshController = RefreshController();

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
    setState(() {
      notifikasis = apiService.getData("api/notifikasi/all");
    });
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted)
      setState(() {
        notifikasis = apiService.getData("api/notifikasi/all");
      });
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    notifikasis = apiService.getData("api/notifikasi/all");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: new Text(
          "Notifikasi",
          style: new TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: kBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: new FutureBuilder<List>(
          future: notifikasis,
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length != 0) {
                return SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: WaterDropHeader(),
                  footer: CustomFooter(
                    builder: (BuildContext context, LoadStatus mode) {
                      Widget body;
                      if (mode == LoadStatus.idle) {
                        body = Text("pull up load");
                      } else if (mode == LoadStatus.loading) {
                        body = CupertinoActivityIndicator();
                      } else if (mode == LoadStatus.failed) {
                        body = Text("Load Failed!Click retry!");
                      } else if (mode == LoadStatus.canLoading) {
                        body = Text("release to load more");
                      } else {
                        body = Text("No more Data");
                      }
                      return Container(
                        height: 55.0,
                        child: Center(child: body),
                      );
                    },
                  ),
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  child: new ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      dynamic color;
                      if (index / 1 == 1) {
                        color = kColorSecondary;
                      } else if (index / 2 == 1) {
                        color = kColorThird;
                      } else if (index / 3 == 1) {
                        color = kColorFourth;
                      } else if (index / 4 == 1) {
                        color = kColorPrimary;
                      } else {
                        color = kColorPrimary;
                      }
                      return _buildListNotifikasi(
                        snapshot.data[index]["judul"],
                        snapshot.data[index]["created_at"],
                        color,
                      );
                    },
                  ),
                );
              }else {
                return new WidgetNotFound();
              }
            } else if (snapshot.hasError == true){
              return new Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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

  Widget _buildListNotifikasi(title, date, color) {
    return new Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(10, 10), // changes position of shadow
          ),
        ],
      ),
      child: new ListTile(
        leading: new Icon(
          Icons.notifications,
          color: color,
          size: 36,
        ),
        title: new Text(
          title,
          style: new TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: new Text(
          date,
          style: new TextStyle(
            color: Colors.grey,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
