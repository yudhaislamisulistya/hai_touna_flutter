import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/services/ApiService.dart';
import 'package:lebihdekatdengantouna/widgets/WidgetFutureBuilderModelOne.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OrganisasiScreen extends StatefulWidget {
  @override
  _OrganisasiScreenState createState() => _OrganisasiScreenState();
}

class _OrganisasiScreenState extends State<OrganisasiScreen> {
  ApiService apiService = new ApiService();
  Future<List> organisasis;
  bool isSearching = false;
  RefreshController _refreshController = RefreshController();

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
    setState(() {
      organisasis = apiService.getData("api/organisasi/all");
    });
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted)
      setState(() {
        organisasis = apiService.getData("api/organisasi/all");
      });
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    organisasis = apiService.getData("api/organisasi/all");
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
          "Organisasi",
          style: new TextStyle(
            color: Colors.grey,
          ),
        )
            : new TextField(
          onChanged: (value) {
            setState(() {
              print(value);
              if (value != "") {
                organisasis = apiService.getData("api/organisasi/search/" + value);
              } else {
                organisasis = apiService.getData("api/organisasi/all/");
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
                organisasis = apiService.getData("api/organisasi/all/");
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
                organisasis = apiService.getData("api/organisasi/orderby/" + val);
              });
            },
          ) : new Container(),
        ],
      ),
      body: WidgetFutureBuilderModelOne(
        data: organisasis,
        refreshController: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        tag: "organisasi",
      ),
    );
  }
}
