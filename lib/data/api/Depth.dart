
import 'package:http/http.dart' as http;

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

}