import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/services/ApiService.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetFutureBuilderModelOne.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class KomunitasScreen extends StatefulWidget {
  @override
  _KomunitasScreenState createState() => _KomunitasScreenState();
}

class _KomunitasScreenState extends State<KomunitasScreen> {

  ApiService apiService = new ApiService();
  Future<List> komunitas;
  bool isSearching = false;
  RefreshController _refreshController =
  RefreshController();


  void _onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
    setState(() {
      komunitas = apiService.getData("api/komunitas/all");
    });
  }

  void _onLoading() async{
    await Future.delayed(Duration(milliseconds: 1000));
    if(mounted)
      setState(() {
        komunitas = apiService.getData("api/komunitas/all");
      });
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    komunitas = apiService.getData("api/komunitas/all");
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
          "Komunitas",
          style: new TextStyle(
            color: Colors.grey,
          ),
        )
            : new TextField(
          onChanged: (value) {
            setState(() {
              print(value);
              if (value != "") {
                komunitas = apiService.getData("api/komunitas/search/" + value);
              } else {
                komunitas = apiService.getData("api/komunitas/all/");
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
                komunitas = apiService.getData("api/komunitas/all/");
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
                komunitas = apiService.getData("api/komunitas/orderby/" + val);
              });
            },
          ) : new Container(),
        ],
      ),
      body: WidgetFutureBuilderModelOne(
        data: komunitas,
        refreshController: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        tag: "komunitas",
      ),
    );
  }
}
