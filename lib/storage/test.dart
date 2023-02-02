import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Model/ModulList.dart';
import '../../../data/api/Depth.dart';
import '../../../storage/storageUtil.dart';

class CreateProductListItemDetail extends StatefulWidget {
  AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  CreateProductListItemDetail({Key key}) : super(key: key);

  @override
  _CreateProductListItemDetailState createState() =>
      _CreateProductListItemDetailState();
}

class _CreateProductListItemDetailState
    extends State<CreateProductListItemDetail> {
  SharedPreferences sharedPreferences;
  String _myState;
  bool _loading = false;
  List<ModulList> modulLists = List<ModulList>();
  var formKey = GlobalKey<FormState>();
  var mySharedPrefences;

  @override
  void initState() {
    getModulList();
    SharedPreferences.getInstance().then((sf) {
      mySharedPrefences = sf;
    });
    super.initState();
  }

  void _onLoading() {
    setState(() {
      getModulList();
      _loading = true;
      new Future.delayed(new Duration(seconds: 1), _login);
    });
  }

  Future _login() async {
    setState(() {
      getModulList();
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: List.generate(modulLists.length, (index) {
          return Container(
            child: Card(
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ListTile(
                    trailing: Icon(Icons.keyboard_arrow_right),
                    title: Image.network(
                      modulLists[index].resim,
                      alignment: Alignment.center,
                      fit: BoxFit.fitWidth,
                    ),
                    subtitle: Text(
                      "MODÜL : " + modulLists[index].moduladi,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void getModulList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var depthhdata = prefs.getString('depthhdata');
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    var withhhdata = prefs2.getString('withhhdata');
    int derinlik = int.tryParse(depthhdata);
    int genislik = int.tryParse(withhhdata);
    int dil = 1;

    DepthApi.getCreateModulList(genislik, derinlik, dil).then((response) {
      setState(() {
        List data = jsonDecode(response.body);
        data.forEach((element) {
          Map obj = element;
          bool success = obj['success'];
          List value = obj['value'];
          print(value);
          List value1 = value;
          this.modulLists =
              value1.map((modulList) => ModulList.fromJson(modulList)).toList();
        });
        modulLists.length > 0 ? modulLists : show_massaje();
      });
    });
  }

  vericek() {
    _onLoading();
  }

  verihata() {}

  show_massaje() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Veri Bulunamadı'),
    ));
  }

  void getDepthhdata() async {
    int depthhdata;
    depthhdata = int.tryParse(StorageUtil.getString("depthhdata"));
    print(depthhdata);
  }

  void setWidth() {}
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
