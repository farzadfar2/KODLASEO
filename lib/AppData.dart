

import 'package:dcache/dcache.dart';
import 'package:flutter/cupertino.dart';





class AppData{

 //static  Cache c = new SimpleCache(storage: new InMemoryStorage(20));

 //static String  api="http://seowoodapi2.kodlatech.com:8180/";
 static String  api="https://api.seofree.com.tr:8180";
 static  String myState="";
 static  int depthhdata=0;
 static  String doviz='';
 static  int withhhdata=0;
 static  int language=0;
 static  int itemCounts=1;
 static List<String> namProductImagees = <String>[];
 static List<int> msgCount = <int>[];
 static List<int> TotalUrunMaxYukseklik = <int>[];
 static List<int> TotalUrunagrlik = <int>[];
 static List<double> TotalUrunfiyat = <double>[];
 static List<double> TotalUrunfiyatusd = <double>[];
 static List<double> TotalUrunDesi = <double>[];
 static List<int> ModulListId = <int>[];
 static int yuksekliktotal = 0;
 static int agrlkiktotal = 0;
 static int modulId = 0;
 static double fiyattotal = 0;
 static double fiyattotalusd = 0;
 static double desitotal = 0;
 static double agrlkiktotalshowkg = 0;
 static  String Dragimageprovider="";
 static  int Dragimageyukseklik=0;
 static  String Zurunlu="";
 static  String ZorumualanfalseResim="";
 static  List Zorumualan=[];
 static List Zorumualantrue=[];
 static List Zorumualantruetest=[];
 static List Zorumualantrue1=[];
 static List Zorumualanfalse=[];
 static List modulLists=[];
 static  int maxyukseklik=0;
 static  int yukseklik=0;
 static  int yukseklikZorunluTrue=0;
 static  int AgrlikZorunluTrue=0;
 static  double fiyatZorunluTrue=0;
 static  double fiyatZorunluTrueusd=0;
 static  double desiZorunluTrue=0;
 static  int IdZorunluTrue=0;
 static bool enablewidget = false;
 static String Zurunluresim = "";
 static String Genislikrenk = "";
 static String modulaciklama = "";


 static dynamic ValuePostModulDetail = null;

 static String siparisresim = "";
 static int siparisgenislik = 0;
 static int siparisyukseklik = 0;
 static int siparisderinlik = 0;
 static double siparisdesi = 0;
 static String sipariskoliebat = "";
 static double siparisfiyat = 0;
 static String Date = "";
 static List siparismodullistesi = [];




 static List siparismodullistesipassdata = [];


 static String Test="";






}

class AppKeys {

 static List<GlobalKey<FormState>> txtKey = [GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>()];

}
