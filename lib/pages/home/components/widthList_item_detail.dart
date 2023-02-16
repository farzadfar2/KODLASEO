import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../AppData.dart';
import '../../../Model/WidthList.dart';
import '../../../data/api/Depth.dart';


class WidthListItemDetail extends StatefulWidget {
  const WidthListItemDetail({
    super.key,
  });

  @override
  _WidthListItemDetailState createState() => _WidthListItemDetailState();
}

class _WidthListItemDetailState extends State<WidthListItemDetail> {
 // bool _validate = false;
  bool _loading = false;
  List<WidthList> widthlists = [];
  var formKey = GlobalKey<FormState>();
  var mySharedPrefences;

  @override
  void initState() {
    getWithList();
    SharedPreferences.getInstance().then((sf) {
      mySharedPrefences = sf;
    });
    AppData.Zorumualanfalse=[];
    AppData.Zorumualantrue=[];
    AppData.namProductImagees=[];

  }

  void _onLoading() {
    setState(() {
      getWithList();
      _loading = true;
      new Future.delayed(new Duration(seconds: 1), _login);
    });
  }

  Future _login() async {
    setState(() {
      getWithList();
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: List.generate(widthlists.length, (index) {
          return ResponsiveWrapper(
            child: Card(
              child: InkWell(
                onTap: () {
                  setState(() {
                    AppData.Zorumualanfalse=[];
                    AppData.Zorumualantrue=[];
                    AppData.namProductImagees=[];
                    AppData.withhhdata = widthlists[index].genislik;
                    AppData.maxyukseklik = widthlists[index].maxyukseklik;
                    print(AppData.maxyukseklik );
                    AppData.Zorumualantrue = [];
                    AppData.modulLists = [];
                    Navigator.pushNamed(context, "/CreateProductListItemDetail");
                  });
                },
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListTile(

                      title: Image.network(
                        widthlists[index].resim.toString(),
                        height: 100,
                        alignment: Alignment.center,
                      ),
                      subtitle: Text(
                        "Derinlik : " +
                            widthlists[index].derinlik.toString() +
                            " cm " +
                            " Genişlik : " +
                            widthlists[index].genislik.toString() +
                            " cm",
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
            ),
          );
        }),
      ),
    );
  }

  void getWithList() async {
    //int derinlik = AppData.depthhdata;
    int derinlik = 28;
    DepthApi.getWidthListWithLanguage(derinlik).then((response) {
      setState(() {
        List data = jsonDecode(response.body);
        data.forEach((element) {
          Map obj = element;
         // bool success = obj['success'];
          List value = obj['value'];
          print(value);
          List value1 = value;
          this.widthlists = value1.map((e) => WidthList.fromJSON(e)).toList();
        });
        widthlists.length > 0 ? widthlists : show_massaje();
      });
    });
  }

  vericek() {
    _onLoading();
    getWithList();
  }

  verihata() {}

  show_massaje() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Veri Bulunamadı'),
    ));
  }
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
