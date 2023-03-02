import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kodlaseoshop/AppData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Model/PostModulList.dart';
import '../../../data/api/Depth.dart';

class CreateModulInfoDetail extends StatefulWidget {
  const CreateModulInfoDetail({super.key});

  @override
  _CreateModulInfoDetailState createState() => _CreateModulInfoDetailState();
}

class _CreateModulInfoDetailState extends State<CreateModulInfoDetail> {
  var formKey = GlobalKey<FormState>();
  late SharedPreferences sharedPreferences;
  TextEditingController _controller = TextEditingController();

  @override
  void initState()  {

    loaddata();
    GetTotalUrunMaxYukseklik();
    GetTotalaWeigt();
    GetTotalfiyat();
    GetTotalDesi();
    super.initState();
    setState(() {
      loaddata();
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
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
          children :[
            Text( AppData.language ==1 ? "Ekle": "Insert",
              style: GoogleFonts.alata(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(   AppData.language ==1 ?  "Lütfen ürününüzü oluşturmak için\nGsağ taraftaki modüllerden seçerek ortadaki karenin içine sürükleyiniz." : "Please select modules from\nright side and drag them into middle square for create your product.",
              style: GoogleFonts.alata(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                height: 1.4,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
        ]
        ),

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
                title: Text(   AppData.language ==1 ?"Derinlik : " + "28 cm" :"Depth : " + "28 cm"),
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
                //  title: Text("Genişlik : " + AppData.withhhdata.toString()),
                title: Text(   AppData.language ==1 ?"Genişlik : " + AppData.withhhdata.toString()+" cm": "Width : " + AppData.withhhdata.toString()+ "cm"),
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
                title: Text(  AppData.language ==1 ? "Yükseklik : " + AppData.yuksekliktotal.toString()+ "cm": "Height : " + AppData.yuksekliktotal.toString()+ "cm"),
                subtitle: Text(   AppData.language ==1 ? AppData.yuksekliktotal >   AppData.maxyukseklik ? " Ürün Yüksekliği Bu miktardan Fazla olamaz" : " " :AppData.yuksekliktotal >   AppData.maxyukseklik ? " Product Height cannot be more than this amount" : " "  ,
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
                title: Text(   AppData.language ==1 ? "Koli Ebatı : " + AppData.desitotal.toStringAsFixed(2) + " Desi" :"CBM : " + AppData.desitotal.toStringAsFixed(2) ),
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
                title: Text(AppData.language ==1 ?"Koli Ağırlığı : " + AppData.agrlkiktotal.toString() + " Gram= "  : " Gram= " + (AppData.agrlkiktotal / 1000).toString() ),
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
                title: Text(   AppData.language ==1? "Fiyat : " + AppData.fiyattotal.toStringAsFixed(2).toString() + " TL"  :"Price  : " + AppData.fiyattotalusd.toStringAsFixed(2).toString() + " USD"),
                // subtitle: Text("Derinlik : "),
                tileColor: Colors.grey.shade200,
              )),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Container(
            width: 400,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey.shade600, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () async {
                  if (AppData.ModulListId[0] != null) {
                    await PostModulList();
                    setState(() {
                      print("ok");
                      Navigator.pushNamed(context, "/ShopDetailShowScreeen");
                    });
                  } else if (AppData.ModulListId[0] == null) {
                    print("hata");
                  }
                },
                child: Text(   AppData.language ==1 ? "ÜRÜNÜ TAMAMLA" :"COMPLETE PRODUCT",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0))),
          ),
        ),
      ],
    ));
  }

  void GetTotalUrunMaxYukseklik() {
    AppData.TotalUrunMaxYukseklik.forEach((element) {});
    int sum = AppData.TotalUrunMaxYukseklik.fold(
        0, (previousValue, element) => previousValue + element);
    AppData.yuksekliktotal = sum + AppData.yukseklikZorunluTrue;
  }

  void GetTotalaWeigt() {
    AppData.TotalUrunagrlik.forEach((element) {});
    int sum = AppData.TotalUrunagrlik.fold(
        0, (previousValue, element) => previousValue + element);
    AppData.agrlkiktotal = sum + AppData.AgrlikZorunluTrue;
    AppData.agrlkiktotalshowkg = AppData.agrlkiktotal / 1000;
  }

  void GetTotalfiyat() {
    AppData.TotalUrunfiyat.forEach((element) {});
    double sum = AppData.TotalUrunfiyat.fold(
        0, (previousValue, element) => previousValue + element);
    AppData.fiyattotal = sum + AppData.fiyatZorunluTrue;

    AppData.TotalUrunfiyatusd.forEach((element) {});
    double sumusd = AppData.TotalUrunfiyatusd.fold(
        0, (previousValue, element) => previousValue + element);
    AppData.fiyattotalusd = sum + AppData.fiyatZorunluTrueusd;
  }

  void GetTotalDesi() {
    AppData.TotalUrunDesi.forEach((element) {});
    double sum = AppData.TotalUrunDesi.fold(
        0, (previousValue, element) => previousValue + element);
    AppData.desitotal = sum + AppData.desiZorunluTrue;
  }

  void loaddata() async{
    sharedPreferences = await SharedPreferences.getInstance();
    AppData.withhhdata = sharedPreferences.getInt("withhhdata")!;

  }
}

Future<void> PostModulList() async {
  var zorunlu = AppData.IdZorunluTrue;
  List<ModelModulId> modelModulIdlist = [];
  modelModulIdlist.add(new ModelModulId(modulid: zorunlu.toInt()));
  List liste = AppData.ModulListId.reversed.toList();
  liste.forEach((element) {
    modelModulIdlist.add(new ModelModulId(modulid: element));
  });

  ModelModul modelModul = new ModelModul(
      derinlik: 28, genislik: 68, miktar: 1, moduller: modelModulIdlist);

  await DepthApi.PostModulList(modelModul);
  print("7");
}
