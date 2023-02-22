import 'package:flutter/foundation.dart';


class ModelModul {
  final int? derinlik;
  final int? genislik;
  final int? miktar;
  final List<ModelModulId>? moduller;


  ModelModul(
      {@required this.derinlik,
        @required this.genislik,
        @required this.miktar,
        @required this.moduller});

  factory ModelModul.fromJSON(Map json) {
    List<ModelModulId> _moduller = [];
    if (json['moduller'] != null) {
      List<dynamic> __moduller = json['moduller'] as List<dynamic>;
      __moduller.forEach((element) {
        _moduller.add(ModelModulId.fromJSON(element));
      });
    }

    return ModelModul(
        derinlik: (json['derinlik'] ?? "0") as int,
        genislik: (json['genislik'] ?? "0") as int,
        miktar: (json['miktar'] ?? "0") as int,
        moduller: _moduller);
  }

  Map<String, dynamic> toMap() {
    List<Map> list = [];
    //Map map=Map();

    moduller!.forEach((element) {
      list.add(element.toMap());
    });

    var map = Map<String, dynamic>();
    map["derinlik"] = derinlik;
    map["genislik"] = genislik;
    map["miktar"] = miktar;
    map["moduller"] = list;
    return map;
  }
}

class ModelModulId {
  final int? modulid;

  ModelModulId(
      {@required this.modulid});

  factory ModelModulId.fromJSON(Map json) {
    return ModelModulId(
        modulid:  (json['id'] ?? "0") as int);
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["modulid"] = modulid;
    return map;
  }
}