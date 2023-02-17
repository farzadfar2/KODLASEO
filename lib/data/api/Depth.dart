
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Model/ModulList.dart';

class DepthApi{
  static Future getDepthListWithLanguage(int dil) async {
    Map<String, String> map = {
      "dil": dil.toString(),
         };
    return http.get(Uri.parse( 'http://seowoodapi.kodlatech.com:8180/api/Derinlik'),
        headers: map);
  }
  static Future getWidthListWithLanguage(int derinlik) async {
    Map<String, String> map = {
      "derinlik": derinlik.toString(),
    };
    return http.get(Uri.parse( 'http://seowoodapi.kodlatech.com:8180/api/Genislik'),
        headers: map);
  }

  static Future getCreateModulList(int genislik,int derinlik,int dil) async {

    Map<String, String> map = {
      "genislik": genislik.toString(),
      "derinlik": derinlik.toString(),
      "dil": dil.toString(),
    };
    return http.get(Uri.parse( 'http://seowoodapi.kodlatech.com:8180/api/Modul'),
        headers: map);
  }


  static Future PostModulList(int derinlik, int genislik ,int miktar, List moduller) async {
    final response = await http.post(
      Uri.parse(  'http://seowoodapi.kodlatech.com:8180/api/Modul'),
      headers: <String, String>{
      },
      body: jsonEncode(<dynamic, dynamic>{
        'derinlik': derinlik,
        'genislik': genislik,
        'miktar': miktar,
        'moduller': moduller,
      }),
    );
    if (response.statusCode == 201) {
      return ModulList.fromJSON(jsonDecode(response.body));

    } else {
      //throw Exception('Failed to create album.');
    }
  }


}