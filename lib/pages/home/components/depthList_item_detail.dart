import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kodlaseoshop/AppData.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/DepthList.dart';
import '../../../data/api/Depth.dart';

class DepthListItemDetail extends StatefulWidget {
  const DepthListItemDetail({super.key});

  @override
  _DepthListItemDetailState createState() => _DepthListItemDetailState();
}

class _DepthListItemDetailState extends State<DepthListItemDetail> {
  bool _loading = false;
  List<DepthList> depthlists = [];

  var formKey = GlobalKey<FormState>();
  var mySharedPrefences;

  @override
  void initState() {
    getDepthList();
    SharedPreferences.getInstance().then((sf) {
      mySharedPrefences = sf;
    });
    AppData.Zorumualanfalse=[];
    AppData.Zorumualantrue=[];
    AppData.namProductImagees=[];
  }

  void _onLoading() {
    setState(() {
      getDepthList();
      _loading = true;
      new Future.delayed(new Duration(seconds: 1), _login);
    });
  }

  Future _login() async {
    setState(() {
      getDepthList();
      setDepth();
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // crossAxisCount:1 ,
        children: List.generate(depthlists.length, (index) {
          return ResponsiveWrapper(
            child: Card(
              child: InkWell(
                onTap: () {
                  setState(() {
                    //AppData.depthhdata = depthlists[index].derinlik;
                    AppData.depthhdata = 28;
                    setDepth();
                    Navigator.pushNamed(context, "/WidthScreen");
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListTile(

                      title: (Image.network(
                        depthlists[index].resim.toString(),
                        height: 100,
                        alignment: Alignment.center,
                      )),
                      subtitle: Text(
                        "Derinlik : " +
                            depthlists[index].derinlik.toString() +
                            " cm",
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void getDepthList() {
    int dil = AppData.language;
    DepthApi.getDepthListWithLanguage(dil).then((response) {
      setState(() {
        List data = jsonDecode(response.body);
        data.forEach((element) {
          Map obj = element;
       //   bool success = obj['success'];
          List value = obj['value'];
          print(value);
          List value1 = value;
          this.depthlists = value1.map((e) => DepthList.fromJSON(e)).toList();
        });
        depthlists.length > 0 ? depthlists : show_massaje();
      });
    });
  }

  vericek() {
    _onLoading();
    getDepthList();
  }

  verihata() {}

  show_massaje() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Veri Bulunamadı'),
    ));
  }

  void setDepth() async {}
}

var bodyProgress = new Container(
  child: new Stack(
    children: <Widget>[
      new Container(
        alignment: AlignmentDirectional.center,
        decoration: new BoxDecoration(
          color: Colors.white70,
        ),
        child: new Container(
          decoration:
              new BoxDecoration(borderRadius: new BorderRadius.circular(10.0)),
          alignment: AlignmentDirectional.center,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Center(
                child: new SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: new CircularProgressIndicator(
                    value: null,
                    strokeWidth: 7.0,
                  ),
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(top: 25.0),
                child: new Center(
                  child: new Text(
                    "Lütfen Bekleyin...",
                    style: new TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);
