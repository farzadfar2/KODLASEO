
class ModulList {
  int id;
  int modulno;
  String moduladi;
  String modulaciklama;
  int derinlik;
  int genislik;
  int yukseklik;
  dynamic agirlik;
  dynamic kutudesi;
  dynamic fiyat;
  String resim;
  dynamic seviye;
  dynamic maximum;
  bool zorunlu;

  ModulList({
    required this.id,
    required this.modulno,
    required this.moduladi,
    required this.modulaciklama,
    required this.derinlik,
    required this.genislik,
    required  this.yukseklik,
    this.agirlik,
    this.kutudesi,
    this.fiyat,
    required this.resim,
    this.seviye,
    this.maximum,
    required this.zorunlu,
  });
  ModulList.fromjson(Map json ,
  this.id,
   this.modulno,
   this.moduladi,
   this.modulaciklama,
   this.derinlik,
   this.genislik,
    this.yukseklik,
  this.agirlik,
  this.kutudesi,
  this.fiyat,
   this.resim,
  this.seviye,
  this.maximum,
   this.zorunlu) {

    id = json['id'];
    modulno =json['modulno'];
    moduladi = json['moduladi'];
    modulaciklama = json['modulaciklama'];
    derinlik = json['derinlik'];
    genislik = json['genislik'];
    yukseklik = json['yukseklik'];
    agirlik = json['agirlik'];
    kutudesi =json['kutudesi'];
    fiyat = json['fiyat'];
    resim = json['resim'].toString();
    seviye = json['seviye'];
    maximum = json['maximum'];
    zorunlu = json['zorunlu'];
  }
  Map toJson() {
    return {
    'id' :id,
    'modulno' : modulno,
    'moduladi' : moduladi,
    'modulaciklama' : modulaciklama,
    'derinlik' : derinlik,
    'genislik' : genislik,
    'yukseklik' : yukseklik,
    'agirlik': agirlik,
    'kutudesi': kutudesi,
    'fiyat' : fiyat,
    'resim' : resim,
   'seviye':  seviye,
   'maximum':  maximum,
    'zorunlu': zorunlu,
    };
  }
}

