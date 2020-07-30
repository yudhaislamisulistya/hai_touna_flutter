import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/services/ApiService.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetFutureBuilderModelOne.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class KulinerScreen extends StatefulWidget {
  @override
  _KulinerScreenState createState() => _KulinerScreenState();
}

class _KulinerScreenState extends State<KulinerScreen> {
  ApiService apiService = new ApiService();
  Future<List> kuliners;
  bool isSearching = false;
  RefreshController _refreshController = RefreshController();

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
    setState(() {
      kuliners = apiService.getData("api/kuliner/all");
    });
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted)
      setState(() {
        kuliners = apiService.getData("api/kuliner/all");
      });
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    kuliners = apiService.getData("api/kuliner/all");
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
          "Kuliner",
          style: new TextStyle(
            color: Colors.grey,
          ),
        )
            : new TextField(
          onChanged: (value) {
            setState(() {
              print(value);
              if (value != "") {
                kuliners = apiService.getData("api/kuliner/search/" + value);
              } else {
                kuliners = apiService.getData("api/kuliner/all/");
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
                kuliners = apiService.getData("api/kuliner/all/");
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
                kuliners = apiService.getData("api/kuliner/orderby/" + val);
              });
            },
          ) : new Container(),
        ],
      ),
      body: WidgetFutureBuilderModelOne(
        data: kuliners,
        refreshController: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        tag: "kuliner",
      ),
    );
  }
}
