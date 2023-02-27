
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kodlaseoshop/AppData.dart';
import '../../Model/PostModulList.dart';
class DepthApi{
  static Future getDepthListWithLanguage(int dil ) async {
    Map<String, String> map = {
      "dil": dil.toString(),

         };
    return http.get(Uri.parse( 'http://seowoodapi2.kodlatech.com:8180/api/Derinlik'),
        headers: map);
  }
  static Future getWidthListWithLanguage(int derinlik) async {
    Map<String, String> map = {
      "derinlik": derinlik.toString(),
    };
    return http.get(Uri.parse( 'http://seowoodapi2.kodlatech.com:8180/api/Genislik'),
        headers: map);
  }

  static Future getCreateModulList(int genislik,int derinlik,int dil , String doviz) async {

    Map<String, String> map = {
      "genislik": genislik.toString(),
      "derinlik": derinlik.toString(),
      "dil": dil.toString(),
      "doviz": doviz.toString(),
    };
    return http.get(Uri.parse( 'http://seowoodapi2.kodlatech.com:8180/api/Modul'),
        headers: map);
  }




  static Future<String> PostModulList( ModelModul model) async {
     final response = await http.post(
      Uri.parse( 'http://seowoodapi2.kodlatech.com:8180/api/siparis'),
        headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        },
       body:jsonEncode(model.toMap())
         );
    if (response.statusCode == 200) {
         AppData.moduldataresponse = response.body;
       //  print(  AppData.moduldataresponse['resim']);
      return response.body;
    } else {
    throw Exception('Failed to create album.');
    }
  }
}


