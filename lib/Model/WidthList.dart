
import 'package:flutter/foundation.dart';

class WidthList {
  final int id;
  final int derinlik;
  final int genislik;
  final String? aciklama;
  final String? resim;
  WidthList(
      {@required this.id = 0,
        @required this.derinlik=0,
        @required this.genislik=0,
        @required this.aciklama,
        @required this.resim,
      });

  factory WidthList.fromJSON(Map json) {

    return WidthList(
        id: json['id']??"0" as int,
        derinlik: json['derinlik']??"0" as int,
        genislik: json['genislik']??"0" as int,
        aciklama: (json['aciklama']??"") as String,
        resim: (json['resim']??"") as String);

  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["derinlik"] = derinlik;
    map["aciklama"] = aciklama;
    map["genislik"] = genislik;
    map["resim"] = resim;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

}




