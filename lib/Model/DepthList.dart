import 'package:flutter/foundation.dart';

class DepthList {
  final int id;
  final int derinlik;
  final String? aciklama;
  final String? resim;

  DepthList({
    @required this.id = 0,
    @required this.derinlik = 0,
    @required this.aciklama,
    @required this.resim,
  });

  factory DepthList.fromJSON(Map json) {
    return DepthList(
        id: json['id'] ?? "0" as int,
        derinlik: json['derinlik'] ?? "0" as int,
        aciklama: (json['aciklama'] ?? "") as String,
        resim: (json['resim'] ?? "") as String);
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["derinlik"] = derinlik;
    map["aciklama"] = aciklama;
    map["resim"] = resim;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }
}
