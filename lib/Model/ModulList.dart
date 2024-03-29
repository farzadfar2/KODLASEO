

import 'package:flutter/foundation.dart';

class ModulList {
  int id;
  int modulno;
  String moduladi;
  String modulaciklama;
  int derinlik;
  int genislik;
  int yukseklik;
  int agirlik;
  double kutudesi;
  dynamic fiyat;
  String resim;
  dynamic seviye;
  dynamic maximum;
  bool zorunlu;
  String doviz;
  dynamic fiyatusd;
  int get formattedTotalItemPrice =>
      yukseklik;
  int get formattedTotalItemAgrlik =>
      agirlik;

  ModulList(
      {@required this.id = 0,
      @required this.modulno = 0,
      @required this.moduladi = '',
      @required this.modulaciklama = '',
      @required this.derinlik = 0,
      @required this.genislik = 0,
      @required this.yukseklik = 0,
      @required this.agirlik = 0,
      @required this.kutudesi=0,
      @required this.fiyat,
      @required this.resim = '',
      @required this.seviye,
      @required this.maximum,
      @required this.zorunlu = false,
      @required this.doviz = '',
      @required this.fiyatusd});

  factory ModulList.fromJSON(Map json) {
    return ModulList(
      id: json['id'] ?? "0" as int,
      modulno: json['modulno'] ?? "0" as int,
      moduladi: (json['moduladi'] ?? "") as String,
      modulaciklama: (json['modulaciklama'] ?? "") as String,
      derinlik: json['derinlik'] ?? "0" as int,
      genislik: json['genislik'] ?? "" as String,
      yukseklik: json['yukseklik'] ?? "0" as int,
      agirlik: json['agirlik'] ?? "0" as int,
      kutudesi: json['kutudesi'] ?? "0" as double,
      fiyat: json['fiyat'] ?? "0" as dynamic,
      resim: json['resim'] ?? "" as String,
      seviye: json['seviye'] ?? "0" as dynamic,
      maximum: json['maximum'] ?? "0" as dynamic,
      zorunlu: json['zorunlu'] ?? "" as bool,
      doviz: json['doviz'] ?? "" as String,
      fiyatusd: json['fiyatusd'] ?? "0" as dynamic,
    );
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["modulno"] = modulno;
    map["moduladi"] = moduladi;
    map["modulaciklama"] = modulaciklama;
    map["derinlik"] = derinlik;
    map["genislik"] = genislik;
    map["yukseklik"] = yukseklik;
    map["agirlik"] = agirlik;
    map["kutudesi"] = kutudesi;
    map["fiyat"] = fiyat;
    map["resim"] = resim;
    map["seviye"] = seviye;
    map["maximum"] = maximum;
    map["zorunlu"] = zorunlu;
    map["doviz"] = doviz;
    map["fiyatusd"] = fiyatusd;

    if (id != null) {
      map["id"] = id;
    }
    return map;
  }
}
