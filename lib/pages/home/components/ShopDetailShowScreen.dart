import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kodlaseoshop/AppData.dart';

import '../../../Model/PostGiveModelList.dart';


class ShopDetailShow extends StatefulWidget {
  const ShopDetailShow({super.key});

  @override
  _ShopDetailShowState createState() => _ShopDetailShowState();
}

class _ShopDetailShowState extends State<ShopDetailShow> {



  @override
  void initState() {
    setState(() {
      AppData.Zorumualanfalse = [];
      AppData.Zorumualantrue = [];
      AppData.namProductImagees = [];
      AppData.TotalUrunMaxYukseklik = [];
      AppData.TotalUrunagrlik = [];
      AppData.TotalUrunfiyat = [];
      AppData.TotalUrunDesi = [];
      AppData.ModulListId = [];


      AppData.modulLists = [];
      AppData.enablewidget = false;
    });

     }




  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ListTile(
                    leading: Image.network(
                      "assets/icon/derinlik.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    //  title: Text("Derinlik : " + AppData.depthhdata.toString()),
                    title: Text("Derinlik : " + AppData.siparisderinlik.toString()),
                    //  subtitle: Text("Derinlik : "),
                    tileColor: Colors.grey.shade200,
                  )),
            ),
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
                    title: Text("Genişlik : " + AppData.siparisgenislik.toString()),
                    //  subtitle: Text("Derinlik : "),
                    tileColor: Colors.grey.shade200,
                  )),
            ),
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ListTile(
                    leading: Image.network(
                      "assets/icon/yuksek.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                        "ÜrÜn Yükseklik : " + AppData.siparisyukseklik.toString()),
                    tileColor: Colors.grey.shade200,
                  )),
            ),
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ListTile(
                    leading: Image.network(
                      "assets/icon/ebat.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text("Koli Ebatı : " + AppData.sipariskoliebat),
                    //  subtitle: Text("Derinlik : "),
                    tileColor: Colors.grey.shade200,
                  )),
            ),
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ListTile(
                    leading: Image.network(
                      "assets/icon/fiyat.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      "Fiyat : " + AppData.siparisfiyat.toString(),
                    ),
                    // subtitle: Text("Derinlik : "),
                    tileColor: Colors.grey.shade200,
                  )),
            ),
          ],
        ));
  }


}



