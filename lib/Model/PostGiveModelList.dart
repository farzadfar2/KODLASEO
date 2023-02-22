
class ModelModulPostGiveValueModullistesi {


  int? miktar;
  String? moduladi;
  String? boyut;

  ModelModulPostGiveValueModullistesi({
    this.miktar,
    this.moduladi,
    this.boyut,
  });
  ModelModulPostGiveValueModullistesi.fromJson(Map<String, dynamic> json) {
    miktar = json['miktar']?.toInt();
    moduladi = json['moduladi']?.toString();
    boyut = json['boyut']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['miktar'] = miktar;
    data['moduladi'] = moduladi;
    data['boyut'] = boyut;
    return data;
  }
}

class ModelModulPostGiveValue {
  int? id;
  int? sipid;
  int? userid;
  String? sipkod;
  String? sipstokkod;
  String? moduller;
  List<ModelModulPostGiveValueModullistesi?>? modullistesi;
  int? derinlik;
  int? genislik;
  int? yukseklik;
  double? kutudesi;
  String? koliebati;
  int? miktar;
  int? fiyat;
  String? resim;

  ModelModulPostGiveValue({
    this.id,
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
    this.resim,
  });
  ModelModulPostGiveValue.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    sipid = json['sipid']?.toInt();
    userid = json['userid']?.toInt();
    sipkod = json['sipkod']?.toString();
    sipstokkod = json['sipstokkod']?.toString();
    moduller = json['moduller']?.toString();
    if (json['modullistesi'] != null) {
      final v = json['modullistesi'];
      final arr0 = <ModelModulPostGiveValueModullistesi>[];
      v.forEach((v) {
        arr0.add(ModelModulPostGiveValueModullistesi.fromJson(v));
      });
      modullistesi = arr0;
    }
    derinlik = json['derinlik']?.toInt();
    genislik = json['genislik']?.toInt();
    yukseklik = json['yukseklik']?.toInt();
    kutudesi = json['kutudesi']?.toDouble();
    koliebati = json['koliebati']?.toString();
    miktar = json['miktar']?.toInt();
    fiyat = json['fiyat']?.toInt();
    resim = json['resim']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['sipid'] = sipid;
    data['userid'] = userid;
    data['sipkod'] = sipkod;
    data['sipstokkod'] = sipstokkod;
    data['moduller'] = moduller;
    if (modullistesi != null) {
      final v = modullistesi;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['modullistesi'] = arr0;
    }
    data['derinlik'] = derinlik;
    data['genislik'] = genislik;
    data['yukseklik'] = yukseklik;
    data['kutudesi'] = kutudesi;
    data['koliebati'] = koliebati;
    data['miktar'] = miktar;
    data['fiyat'] = fiyat;
    data['resim'] = resim;
    return data;
  }
}

class ModelModulPostGive {
  bool? success;
  int? hataKodu;
  String? hataAciklamasi;
  ModelModulPostGiveValue? value;
  int? pageCount;
  int? pageIndex;

  ModelModulPostGive({
    this.success,
    this.hataKodu,
    this.hataAciklamasi,
    this.value,
    this.pageCount,
    this.pageIndex,
  });
  ModelModulPostGive.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    hataKodu = json['hataKodu']?.toInt();
    hataAciklamasi = json['hataAciklamasi']?.toString();
    value = (json['value'] != null) ? ModelModulPostGiveValue.fromJson(json['value']) : null;
    pageCount = json['pageCount']?.toInt();
    pageIndex = json['pageIndex']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['hataKodu'] = hataKodu;
    data['hataAciklamasi'] = hataAciklamasi;
    if (value != null) {
      data['value'] = value!.toJson();
    }
    data['pageCount'] = pageCount;
    data['pageIndex'] = pageIndex;
    return data;
  }
}
