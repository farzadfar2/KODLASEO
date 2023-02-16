import 'package:flutter/material.dart';
import 'package:kodlaseoshop/AppData.dart';

import 'falseDataList_detail.dart';



class CreateModulInfoDetail extends StatefulWidget {
  final yuksekliktotal;
  const CreateModulInfoDetail(this.yuksekliktotal,   {super.key});

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
                title: Text("Derinlik : " + AppData.depthhdata.toString()),
                subtitle: Text("Derinlik : "),
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
                title: Text("Genişlik : " + AppData.withhhdata.toString()
                ),
                subtitle: Text("Derinlik : "),
                tileColor: Colors.grey.shade200,
              )),
        ),
        Card(
          child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: ListTile(
                leading: Image.network(
                  "assets/icon/yuksek.png",
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                title: Text("Maximum Yükseklik : " + AppData.maxyukseklik.toString()),

                tileColor: Colors.grey.shade200,
              )),
        ),
        Card(
          child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: ListTile(
                leading: Image.network(
                  "assets/icon/yuksek.png",
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                title: Text("ÜrÜn Yükseklik : " +  AppData.yuksekliktotal.toString()),
                subtitle: Text("Derinlikhgh : "),
                tileColor: Colors.grey.shade200,
              )),
        ),
        Card(
          child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: ListTile(
                leading: Image.network(
                  "assets/icon/ebat.png",
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                title: Text("Koli Ebatı : "),
                subtitle: Text("Derinlik : "),
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
                title: Text("Koli Ağırlığı : " ),
                subtitle: Text("Derinlik : "),
                tileColor: Colors.grey.shade200,
              )),
        ),
        Card(
          child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: ListTile(
                leading: Image.network(
                  "assets/icon/fiyat.png",
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                title: Text("Fiyat : "),
                subtitle: Text("Derinlik : "),
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
                  GetTotalUrunMaxYukseklik();
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

}
