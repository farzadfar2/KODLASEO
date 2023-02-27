import 'dart:js';

import 'package:flutter/material.dart';
import 'package:kodlaseoshop/AppData.dart';
import '../../../Model/PostModulList.dart';
import '../../../data/api/Depth.dart';

class CreateModulInfoDetail extends StatefulWidget {
  const CreateModulInfoDetail({super.key});

  @override
  _CreateModulInfoDetailState createState() => _CreateModulInfoDetailState();
}

class _CreateModulInfoDetailState extends State<CreateModulInfoDetail> {
  var formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      GetTotalUrunMaxYukseklik();
      GetTotalaWeigt();
      GetTotalfiyat();
      GetTotalDesi();
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
                title: Text("Derinlik : " + "28"),
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
                title: Text("Genişlik : " + AppData.withhhdata.toString()),
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
                    "Maximum Yükseklik : " + AppData.maxyukseklik.toString()),
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
                    "ÜrÜn Yükseklik : " + AppData.yuksekliktotal.toString()),
                subtitle: Text(
                  AppData.yuksekliktotal > 200
                      ? " Ürün Yüksekliği Bu miktardan Fazla olamaz"
                      : " ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red.shade900),
                ),
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
                title: Text(
                    "Koli Ebatı : " + AppData.desitotal.toStringAsFixed(2) + " Desi"),
                //  subtitle: Text("Derinlik : "),
                tileColor: Colors.grey.shade200,
              )),
        ),
        Card(
          child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: ListTile(
                leading: Image.network(
                  "assets/icon/agir.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text("Koli Ağırlığı : " +
                    AppData.agrlkiktotal.toString() +
                    " Gram=" +
                    (AppData.agrlkiktotal / 1000).toString() +
                    " Kg"),
                //subtitle: Text("Derinlik : "),
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
                  "Fiyat : " + AppData.fiyattotal.toStringAsFixed(2).toString(),
                ),
                // subtitle: Text("Derinlik : "),
                tileColor: Colors.grey.shade200,
              )),
        ),
        Card(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade600, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                setState(() {


                  if ( AppData.ModulListId != null) {
                    GetModulList();
                    Navigator.pushNamed(context, "/ShopDetailShowScreeen");
                  }
                  else{
                    print("hata");
                  }

                  //Navigator.pushNamed(context, "/CreateModulInfoShow");
                 // AppData.ModulListId != "NULL" ?   Navigator.pushNamed(context, "/ShopDetailShowScreeen") : "hata" ;
                });
              },
              child: Text("ÜRÜNÜ TAMAMLA",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0))),
        ),
      ],
    ));
  }

  void GetTotalUrunMaxYukseklik() {
    AppData.TotalUrunMaxYukseklik.forEach((element) {
      print(element);
    });
    int sum = AppData.TotalUrunMaxYukseklik.fold(
        0, (previousValue, element) => previousValue + element);
    AppData.yuksekliktotal = sum + AppData.yukseklikZorunluTrue;
  }

  void GetTotalaWeigt() {
    AppData.TotalUrunagrlik.forEach((element) {
      print(element);
    });
    int sum = AppData.TotalUrunagrlik.fold(
        0, (previousValue, element) => previousValue + element);
    AppData.agrlkiktotal = sum + AppData.AgrlikZorunluTrue;
    AppData.agrlkiktotalshowkg = AppData.agrlkiktotal / 1000;
  }

  void GetTotalfiyat() {
    AppData.TotalUrunfiyat.forEach((element) {
      print(element);
    });
    double sum = AppData.TotalUrunfiyat.fold(
        0, (previousValue, element) => previousValue + element);
    AppData.fiyattotal = sum + AppData.fiyatZorunluTrue;
  }

  void GetTotalDesi() {
    AppData.TotalUrunDesi.forEach((element) {
      print(element);
    });
    double sum = AppData.TotalUrunDesi.fold(
        0, (previousValue, element) => previousValue + element);
    AppData.desitotal = sum + AppData.fiyatZorunluTrue;
  }
}

void GetModulList() {

  var zorunlu = AppData.IdZorunluTrue;
  List<ModelModulId> modelModulIdlist = [];

  modelModulIdlist.add(new ModelModulId(modulid: zorunlu.toInt()));
  List liste = AppData.ModulListId.reversed.toList();
  liste.forEach((element) {
    modelModulIdlist.add(new ModelModulId(modulid: element));
  });
  ModelModul modelModul = new ModelModul(
      derinlik: 28, genislik: 68, miktar: 1, moduller: modelModulIdlist);
  DepthApi.PostModulList(modelModul);
  print ("ModelModulId");
print(modelModulIdlist.length);

}
