
import 'package:flutter/foundation.dart';

class WidthList {
  final int id;
  final int derinlik;
  final int genislik;
  final String? aciklama;
  final String? resim;
  final String? renk;
  final dynamic maxyukseklik;
  WidthList(
      {@required this.id = 0,
        @required this.derinlik=0,
        @required this.genislik=0,
        @required this.aciklama,
        @required this.resim,
        @required this.renk,
        @required this.maxyukseklik,
      });

  factory WidthList.fromJSON(Map json) {

    return WidthList(
        id: json['id']??"0" as int,
        derinlik: json['derinlik']??"0" as int,
        genislik: json['genislik']??"0" as int,
        aciklama: (json['aciklama']??"") as String,
        resim: (json['resim']??"") as String,
      renk: (json['renk']??"") as String,
      maxyukseklik: json['maxyukseklik']??"0" as int,);

  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["derinlik"] = derinlik;
    map["aciklama"] = aciklama;
    map["genislik"] = genislik;
    map["resim"] = resim;
    map["renk"] = renk;
    map["maxyukseklik"] = maxyukseklik;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

}




