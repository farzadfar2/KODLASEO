
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kodlaseoshop/AppData.dart';
import '../../Model/PostGiveModelList.dart';
import '../../Model/PostModulList.dart';
class DepthApi{
  static Future getDepthListWithLanguage(int dil ) async {
    Map<String, String> map = {
      "dil": dil.toString(),

         };

    return http.get(Uri.parse( AppData.api + '/api/Derinlik' ), headers: map);
  }
  static Future getWidthListWithLanguage(int derinlik) async {
    Map<String, String> map = {
      "derinlik": derinlik.toString(),
    };
    return http.get(Uri.parse(  AppData.api +'/api/Genislik'), headers: map);

  }


  static Future getCreateModulList(int genislik,int derinlik,int dil , String doviz) async {

    Map<String, String> map = {
      "genislik": genislik.toString(),
      "derinlik": derinlik.toString(),
      "dil": dil.toString(),
      "doviz": doviz.toString(),
    };
    return http.get(Uri.parse( AppData.api +'/api/Modul'),
        headers: map);
  }





  static Future<String> PostModulList( ModelModul model) async {
     final response = await http.post(
      Uri.parse(  AppData.api +'/api/siparis'),
          headers: <String, String>{
        "dil":  AppData.language.toString(),
          'Content-Type': 'application/json; charset=UTF-8',
        },
       body:jsonEncode(model.toMap())
         );
    print(jsonEncode(model.toMap()) );
     print(response.body);
    if (response.statusCode == 200) {

       Iterable data = json.decode(response.body);
       data.forEach((element) {
         Map obj = element;
        // bool success = obj["success"];
         Map value = obj['value'];
         AppData.siparisresim = value['resim'];
         print( AppData.siparisresim);
         AppData.siparisgenislik = value['genislik'];
         print( "AppData.siparisresim");
         print( AppData.siparisgenislik);
         AppData.siparisyukseklik = value['yukseklik'];
         AppData.siparisderinlik = value['derinlik'];
         AppData.sipariskoliebat = value['koliebati'];
         AppData.siparisdesi = value['kutudesi'];
         AppData.siparisfiyat = value['fiyat'];
         AppData.Date = value['kaytar'];
         List modullistesi = value['modullistesi'];
         List<Modullistesi> modullistesi2 = [];
           List Listbas = modullistesi;
           print("5");
         modullistesi2=
               Listbas.map((modullistesi) => Modullistesi.fromJson(modullistesi))
                   .toList();
           AppData.siparismodullistesipassdata = modullistesi2;
         });
       print("6");
      return response.body.toString();
    } else {
    throw Exception('Failed to create album.');
    }


  }
}


