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
                    title: Text("Genişlik : " + AppData.withhhdata.toString()
                    ),
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
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text("ÜrÜn Yükseklik : " +  AppData.yuksekliktotal.toString()),
                    subtitle: Text(AppData.yuksekliktotal > 200 ? " Ürün Yüksekliği Bu miktardan Fazla olamaz" :  " ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red.shade900
                      ),


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
                    title: Text("Koli Ebatı : " +  AppData.desitotal.toString() + " Desi" ),
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
                    title: Text("Koli Ağırlığı : " +  AppData.agrlkiktotal.toString() +" Gram=" + (AppData.agrlkiktotal /1000).toString() + " Kg"),
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
                    title: Text("Fiyat : " + AppData.fiyattotal.toStringAsFixed(2)
                        .toString(),),
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
                      GetModulList();
                      //  GetModulList();
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
    AppData.agrlkiktotalshowkg= AppData.agrlkiktotal/1000;


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


/*
  Future<Moduller> Modullerdata(int modulid) async {
    final response2 = await jsonEncode(<dynamic, int>{
      "modulid": modulid,

    });
    //  print(jsonDecode(response2));
    print(Moduller.fromJson(jsonDecode(response2)));
    return Moduller.fromJson(jsonDecode(response2));

  }*/

/*
Future<List<Modullerhareket>> getHaraketler() async {
  final mapList = await getHaraketlerMaps();
  List<Modullerhareket> modulList = [];


  mapList.forEach((element) {
    modulList.add(Modullerhareket.fromObject(element));
  });

  print(modulList);
  return modulList.toList();
}

Future<List> getHaraketlerMaps() async {
   List db = await  AppData.ModulListId;
  return db;
}
*/

void GetModulList() {

  List<Modullerhareket> tummodullermap =  AppData.ModulListId.map((moduls) {
    return Modullerhareket(moduls);
  }).toList();
  tummodullermap.forEach((element) {
    print(element);
  });
  print("tummodullermap");
  print(tummodullermap);
  var list = [];
  tummodullermap.forEach((element) => list.add(element));
  DepthApi.PostModulList(28,68,1, tummodullermap);



  /* List<Modullerhareket> modullerhareket = [];
    getHaraketler().then((value) {
      modullerhareket= value;
      List<Modullerhareket> ListData = modullerhareket;
      var list = [];
      ListData.forEach((element) => list.add(element.toMap()));
      //DepthApi.PostModulList(28, 68, 1, list);

      print(list);
    });
    }

*/
  /*  AppData.ModulListId.forEach((element) {print(element);});

    final jsonResponse = json.encode(AppData.ModulListId);
    print(jsonResponse);


    var map2 = {};
    AppData.ModulListId.forEach((customer) => map2[Modullerhareket.modulid] = customer.age);
    print(map2)*/;
}

/*AppData.depthhdata = 28;
    int derinlik=AppData.depthhdata;
    int genislik= AppData.withhhdata;
    int   miktar=1;
    List<Moduller> moduller;
   int zorunlu = AppData.IdZorunluTrue;
   var test = AppData.ModulListId.toString();



    final jsonResponse = json.encode(AppData.ModulListId);
    print(jsonResponse);
   print(Moduller.fromJson(jsonDecode(jsonResponse))) ;*/

/*   String jsonTags = jsonEncode(AppData.ModulListId);
    print(jsonTags);
    */

/* var value= json.encode(AppData.ModulListId);
    List<Moduller> ListData = value;
    var list = [];
   AppData.ModulListId.forEach((element) => list.add(element.()));

    DepthApi.PostModulList(28,68,1, AppData.ModulListId);
*/


//print(jsonDecode(jsonResponse)) ;
// moduller = jsonResponse as List<Moduller>;
// List<Moduller> ListData = moduller;
//var list = [];
// AppData.ModulListId.forEach((element) => list.add(element));
// print(list);
// print("jsonList: ${jsonResponse}");


/*  final mapList =  AppData.ModulListId.toList();
    List<ModulListesi> modulLists = [];

    mapList.forEach((element) {
      modulLists.add(ModulListesi.fromJson(element.));
    });
    DepthApi.PostModulList(derinlik, genislik, miktar, list);*/






/*
    AppData.ModulListId.forEach((element) {
      //modulListesi = element as List<ModulListesi>;
    //  List<ModulListesi> ListData = modulListesi;
*/


//   AppData.ModulListId.forEach((element) => list.add(element.to()));



/* Map map = {for (var item in AppData.ModulListId)  '$item' : '"modulid" : $item' };


    print(map);
    List list =  AppData.ModulListId;
    Map map3 = list.asMap();
    print(map3);
*/







