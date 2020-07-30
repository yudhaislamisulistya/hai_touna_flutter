import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/services/ApiService.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetFutureBuilderModelOne.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TourGuideScreen extends StatefulWidget {
  @override
  _TourGuideScreenState createState() => _TourGuideScreenState();
}

class _TourGuideScreenState extends State<TourGuideScreen> {

  ApiService apiService = new ApiService();
  Future<List> tourguides;
  bool isSearching = false;
  RefreshController _refreshController =
  RefreshController();


  void _onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
    setState(() {
      tourguides = apiService.getData("api/tourguide/all");
    });
  }

  void _onLoading() async{
    await Future.delayed(Duration(milliseconds: 1000));
    if(mounted)
      setState(() {
        tourguides = apiService.getData("api/tourguide/all");
      });
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    tourguides = apiService.getData("api/tourguide/all");
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
          "Tour Guide",
          style: new TextStyle(
            color: Colors.grey,
          ),
        )
            : new TextField(
          onChanged: (value) {
            setState(() {
              print(value);
              if (value != "") {
                tourguides = apiService.getData("api/tourguide/search/" + value);
              } else {
                tourguides = apiService.getData("api/tourguide/all/");
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
                tourguides = apiService.getData("api/tourguide/all/");
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
                tourguides = apiService.getData("api/tourguide/orderby/" + val);
              });
            },
          ) : new Container(),
        ],
      ),
      body: WidgetFutureBuilderModelOne(
        data: tourguides,
        refreshController: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        tag: "tourguide",
      ),
    );
  }
}
