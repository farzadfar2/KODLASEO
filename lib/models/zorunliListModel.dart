///
/// Code generated by Sita Web Tool https://sita.app/json-to-dart/
///
class zorunluListModel {


  int? id;
  int? modulno;
  String? moduladi;
  String? modulaciklama;
  int? derinlik;
  int? genislik;
  int? yukseklik;
  int? agirlik;
  int? kutudesi;
  int? kutuder;
  int? kutugen;
  int? kutuyuk;
  int? fiyatusd;
  double? fiyat;
  String? doviz;
  String? resim;
  int? seviye;
  int? maximum;
  bool? zorunlu;

  zorunluListModel({
    this.id,
    this.modulno,
    this.moduladi,
    this.modulaciklama,
    this.derinlik,
    this.genislik,
    this.yukseklik,
    this.agirlik,
    this.kutudesi,
    this.kutuder,
    this.kutugen,
    this.kutuyuk,
    this.fiyatusd,
    this.fiyat,
    this.doviz,
    this.resim,
    this.seviye,
    this.maximum,
    this.zorunlu,
  });
  zorunluListModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    modulno = json['modulno']?.toInt();
    moduladi = json['moduladi']?.toString();
    modulaciklama = json['modulaciklama']?.toString();
    derinlik = json['derinlik']?.toInt();
    genislik = json['genislik']?.toInt();
    yukseklik = json['yukseklik']?.toInt();
    agirlik = json['agirlik']?.toInt();
    kutudesi = json['kutudesi']?.toInt();
    kutuder = json['kutuder']?.toInt();
    kutugen = json['kutugen']?.toInt();
    kutuyuk = json['kutuyuk']?.toInt();
    fiyatusd = json['fiyatusd']?.toInt();
    fiyat = json['fiyat']?.toDouble();
    doviz = json['doviz']?.toString();
    resim = json['resim']?.toString();
    seviye = json['seviye']?.toInt();
    maximum = json['maximum']?.toInt();
    zorunlu = json['zorunlu'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['modulno'] = modulno;
    data['moduladi'] = moduladi;
    data['modulaciklama'] = modulaciklama;
    data['derinlik'] = derinlik;
    data['genislik'] = genislik;
    data['yukseklik'] = yukseklik;
    data['agirlik'] = agirlik;
    data['kutudesi'] = kutudesi;
    data['kutuder'] = kutuder;
    data['kutugen'] = kutugen;
    data['kutuyuk'] = kutuyuk;
    data['fiyatusd'] = fiyatusd;
    data['fiyat'] = fiyat;
    data['doviz'] = doviz;
    data['resim'] = resim;
    data['seviye'] = seviye;
    data['maximum'] = maximum;
    data['zorunlu'] = zorunlu;
    return data;
  }
}
