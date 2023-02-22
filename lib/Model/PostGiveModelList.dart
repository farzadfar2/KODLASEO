class ModelModulPostGive {
  bool? success;
  int? hataKodu;
  String? hataAciklamasi;
  Value? value;
  int? pageCount;
  int? pageIndex;

  ModelModulPostGive(
      {this.success,
        this.hataKodu,
        this.hataAciklamasi,
        this.value,
        this.pageCount,
        this.pageIndex});

  ModelModulPostGive.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    hataKodu = json['hataKodu'];
    hataAciklamasi = json['hataAciklamasi'];
    value = json['value'] != null ? new Value.fromJson(json['value']) : null;
    pageCount = json['pageCount'];
    pageIndex = json['pageIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['hataKodu'] = this.hataKodu;
    data['hataAciklamasi'] = this.hataAciklamasi;
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    data['pageCount'] = this.pageCount;
    data['pageIndex'] = this.pageIndex;
    return data;
  }
}

class Value {
  int? id;
  int? sipid;
  int? userid;
  Null? sipkod;
  Null? sipstokkod;
  String? moduller;
  List<Modullistesi>? modullistesi;
  int? derinlik;
  int? genislik;
  int? yukseklik;
  double? kutudesi;
  String? koliebati;
  int? miktar;
  int? fiyat;
  String? resim;

  Value(
      {this.id,
        this.sipid,
        this.userid,
        this.sipkod,
        this.sipstokkod,
        this.moduller,
        this.modullistesi,
        this.derinlik,
        this.genislik,
        this.yukseklik,
        this.kutudesi,
        this.koliebati,
        this.miktar,
        this.fiyat,
        this.resim});

  Value.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sipid = json['sipid'];
    userid = json['userid'];
    sipkod = json['sipkod'];
    sipstokkod = json['sipstokkod'];
    moduller = json['moduller'];
    if (json['modullistesi'] != null) {
      modullistesi = <Modullistesi>[];
      json['modullistesi'].forEach((v) {
        modullistesi!.add(new Modullistesi.fromJson(v));
      });
    }
    derinlik = json['derinlik'];
    genislik = json['genislik'];
    yukseklik = json['yukseklik'];
    kutudesi = json['kutudesi'];
    koliebati = json['koliebati'];
    miktar = json['miktar'];
    fiyat = json['fiyat'];
    resim = json['resim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sipid'] = this.sipid;
    data['userid'] = this.userid;
    data['sipkod'] = this.sipkod;
    data['sipstokkod'] = this.sipstokkod;
    data['moduller'] = this.moduller;
    if (this.modullistesi != null) {
      data['modullistesi'] = this.modullistesi!.map((v) => v.toJson()).toList();
    }
    data['derinlik'] = this.derinlik;
    data['genislik'] = this.genislik;
    data['yukseklik'] = this.yukseklik;
    data['kutudesi'] = this.kutudesi;
    data['koliebati'] = this.koliebati;
    data['miktar'] = this.miktar;
    data['fiyat'] = this.fiyat;
    data['resim'] = this.resim;
    return data;
  }
}

class Modullistesi {
  int? miktar;
  String? moduladi;
  String? boyut;

  Modullistesi({this.miktar, this.moduladi, this.boyut});

  Modullistesi.fromJson(Map<String, dynamic> json) {
    miktar = json['miktar'];
    moduladi = json['moduladi'];
    boyut = json['boyut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['miktar'] = this.miktar;
    data['moduladi'] = this.moduladi;
    data['boyut'] = this.boyut;
    return data;
  }
}