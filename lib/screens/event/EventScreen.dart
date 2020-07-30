import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/screens/event/DetailEventScreen.dart';
import 'package:lebihdekatdengantouna/services/ApiService.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetNotFound.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {

  ApiService apiService = new ApiService();
  Future<List> events;
  RefreshController _refreshController =
  RefreshController();
  bool isSearching = false;


  void _onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
    setState(() {
      events = apiService.getData("api/event/all");
    });
  }

  void _onLoading() async{
    await Future.delayed(Duration(milliseconds: 1000));
    if(mounted)
      setState(() {
        events = apiService.getData("api/event/all");
      });
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    events = apiService.getData("api/event/all");
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: !isSearching
            ? new Text(
          "Event",
          style: new TextStyle(
            color: Colors.grey,
          ),
        )
            : new TextField(
          onChanged: (value) {
            setState(() {
              print(value);
              if (value != "") {
                events = apiService.getData("api/event/search/" + value);
              } else {
                events = apiService.getData("api/event/all/");
              }
            });
          },
          decoration: new InputDecoration(
            icon: new Icon(Icons.search),
            hintText: "Cari Disini",
          ),
        ),
        automaticallyImplyLeading: !isSearching ? true : false,
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
        actions: <Widget>[
          new IconButton(
            icon: !isSearching
                ? new Icon(
              Icons.search,
              color: Colors.grey,
            )
                : new Icon(
              Icons.close,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                this.isSearching = !this.isSearching;
                events = apiService.getData("api/event/all/");
              });
            },
          ),
          !isSearching ?           PopupMenuButton<String>(
            icon: new Icon(Icons.filter_list, color: Colors.grey,),
            itemBuilder: (BuildContext context){
              return <PopupMenuEntry<String>>[
                PopupMenuItem(
                  value: "desc",
                  child: new Text("Terbaru"),
                ),
                PopupMenuItem(
                  value: "asc",
                  child: new Text("Terlama"),
                )
              ];
            },
            onSelected: (val){
              print(val);
              setState(() {
                events = apiService.getData("api/event/orderby/" + val);
              });
            },
          ) : new Container(),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: kBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: new FutureBuilder<List>(
          future: events,
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length != 0) {
                return SmartRefresher(
                  enablePullDown: true,
                  header: WaterDropHeader(),
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  child: new ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      dynamic color;
                      if(index % 1 != 0){
                        color = kColorSecondary;
                      }else if(index % 2 != 0){
                        color = kColorThird;
                      }else if(index % 3 != 0){
                        color = kColorFourth;
                      }else if(index % 4 != 0){
                        color = kColorPrimary;
                      }else{
                        color = kColorPrimary;
                      }
                      return _buildListEvent(
                        color,
                        snapshot.data[index]["judul"],
                        snapshot.data[index]["created_at"],
                        snapshot.data[index]["tanggal_event"],
                        "https://hai-touna.lentera-lipuku.com/files/" + snapshot.data[index]["gambar"],
                        snapshot.data[index]["keterangan"],
                        context,
                      );
                    },
                  ),
                );
              } else {
                return new WidgetNotFound();
              }
            } else if (snapshot.hasError == true){
              return new Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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

  Widget _buildListEvent(color, title, date, datEvent, image, desc, context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
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
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (BuildContext context) {
                return new DetailEventScreen(
                  title: title,
                  image: image,
                  date: date,
                  dateEvent: datEvent,
                  desc: desc,
                );
              },
            ),
          );
        },
        leading: new Container(
          width: 50,
          height: 80,
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: new DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.fill)),
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
        trailing: new Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
        ),
      ),
    );
  }
}
