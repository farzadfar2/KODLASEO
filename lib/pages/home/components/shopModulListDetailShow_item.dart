import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kodlaseoshop/AppData.dart';
import '../../../Model/PostGiveModelList.dart';


class ShopModulListDetailShow extends StatefulWidget {
  const ShopModulListDetailShow({super.key});

  @override
  _ShopModulListDetailShowState createState() => _ShopModulListDetailShowState();
}

class _ShopModulListDetailShowState extends State<ShopModulListDetailShow> {
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

  void _onLoading() {
    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ListTile(
                    leading: Image.network(
                      "assets/icon/genis.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text("Seçilen Moduller"),
                    //  subtitle: Text("Derinlik : "),
                    tileColor: Colors.grey.shade200,
                  )),
            ),
            Column(
              children: List.generate(modullistesi.length, (index) {
                return
                  Card(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          //   Navigator.pushNamed(context, "/CreateProductListItemDetail");
                        });
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ListTile(

                            title: Text(
                              modullistesi[index].miktar.toString() + "Adet",

                            ),
                            subtitle: Text(
                                modullistesi[index].moduladi.toString()
                            ),
                          )),
                    ),

                );
              }),
            ),

            Card(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey.shade600, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    setState(() {
                      LoadData();
                    });
                  },
                  child: Text("Yazdır",
                      style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0))),
            ),
          ],
        ));
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



