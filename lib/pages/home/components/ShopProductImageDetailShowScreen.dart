import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kodlaseoshop/AppData.dart';
import '../../../Model/PostGiveModelList.dart';


class ShopProductImageDetailShow extends StatefulWidget {
  const ShopProductImageDetailShow({super.key});

  @override
  _ShopProductImageDetailShowState createState() => _ShopProductImageDetailShowState();
}

class _ShopProductImageDetailShowState extends State<ShopProductImageDetailShow> {
  List<Value> value = [];
  List<Modullistesi> modullistesi = [];

  @override
  void initState() {
    LoadData();
    AppData.Zorumualanfalse = [];
    AppData.Zorumualantrue = [];
    AppData.namProductImagees = [];
    AppData.TotalUrunMaxYukseklik = [];
    AppData.TotalUrunagrlik = [];
    AppData.TotalUrunfiyat = [];
    AppData.TotalUrunDesi = [];
    AppData.ModulListId = [];

    AppData.Zorumualantrue = [];
    AppData.modulLists = [];
    AppData.enablewidget = false;
  }




  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.network(
          AppData.siparisresim,
          fit: BoxFit.contain,
        ),);
  }

  void LoadData() {
    //print(AppData.moduldataresponse);
    //print(json.decode(AppData.moduldataresponse));
    Iterable data = json.decode(AppData.moduldataresponse);
    data.forEach((element) {
      Map obj = element;
      bool success = obj["success"];

      Map value = obj['value'];
      AppData.siparisresim = value['resim'];
      AppData.siparisgenislik = value['genislik'];
      AppData.siparisyukseklik = value['yukseklik'];
      AppData.siparisderinlik = value['derinlik'];
      AppData.sipariskoliebat = value['koliebati'];
      AppData.siparisfiyat = value['fiyat'];

      List modullistesi = value['modullistesi'];

      print("value");

      print(value);
      print("success");
      print(success);
      setState(() {
        List Listbas = modullistesi;
        this.modullistesi =
            Listbas.map((modullistesi) => Modullistesi.fromJson(modullistesi))
                .toList();
      });
    });
  }
}



