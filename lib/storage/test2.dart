import 'package:flutter/material.dart';
import 'package:semsettinilhan/core/constant/app_config.dart';
import 'package:semsettinilhan/core/enum/enum.dart';
import 'package:semsettinilhan/core/model/model_cari.dart';
import 'package:semsettinilhan/core/model/model_siparis.dart';
import 'package:semsettinilhan/core/model/model_stok.dart';
import 'package:semsettinilhan/core/model/model_stok_grup.dart';
import 'package:semsettinilhan/core/model/model_stok_kod.dart';
import 'package:semsettinilhan/core/service/service_api.dart';
import 'package:semsettinilhan/core/service/service_data.dart';
import 'package:semsettinilhan/core/service/service_route.dart';
import 'package:semsettinilhan/core/utils/utilities.dart';
import 'package:semsettinilhan/core/viewmodel/view_model_base.dart';
import 'package:semsettinilhan/core/data/DbHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewModelSiparis extends ViewModelBase {
  var dbHelper = DbHelper();
  // String navigationTitle = 'Stok Listesi';
  ModelStokGrup? seciligrup;
  List<ModelStokGrup> gruplar = [];
  List<ModelStok> stoklar = [];
  List<ModelStok> siparisBakiye = [];
  String problem="";
  String problemb="";
  bool iskontoTuru = false;

  //List<ModelStokGrup> gruplar = [];

  ViewModelSiparis({BuildContext? context}) {
    //setActivityState(ActivityState.IsLoading);
    //print("listeleme yapılacak");
    getStokGrupList();
    //print("listeleme yapılacak 2");
    getStokList();
    //print("listeleme yapılacak 3");
  }

  getStokList() async {
    setActivityState(ActivityState.IsLoading);

    SharedPreferences? sharedPreferences =await SharedPreferences.getInstance();
    iskontoTuru =  sharedPreferences!.getBool('yuzde')??false;


    if (Utilities.isWeb()) {
      if(AppConfig.modelStokList==null) {
        var productsFuture = await APIClient.shared.getStokList();
        AppConfig.modelStokList =productsFuture;
      }
      stoklar = AppConfig.modelStokList!;
    } else {
      // await dbHelper.putSiparisSifirla();
      var productsFuture = await dbHelper.getAllStok();

      AppConfig.modelStokList =[];
      stoklar = productsFuture;
      stoklar.forEach((element) {
        if(element.miktar==0)
        {
          if(iskontoTuru)
          {
            element.isktur =1;
          }
          else
          {
            element.isktur =0;
          }
        }
      });
    }
    //   print(DateTime.now());
    //stoklar.sort((a,b)=> (a.stokkodu??"").compareTo(b.stokkodu??""));
    //   print(DateTime.now());
    //cariler = await APIClient.shared.getCariList();
    setActivityState(ActivityState.IsLoaded);

    notifyListeners();
//    navigationTitle = 'Stok Listesi ${stoklar.length.toString()}';
  }


  getSiparisStokList() async {
    setActivityState(ActivityState.IsLoading);
    problemb="";
    problem="";
    List<ModelStokKod> kodlar = [];
    AppConfig.siparisStok!.forEach((element) {
      kodlar.add(ModelStokKod(stokkodu: element.stokkodu));
    });

    siparisBakiye =   await APIClient.shared.getSiparisStokList(kodlar);

    AppConfig.siparisStok!.forEach((elementsip) async {
      siparisBakiye.forEach((elementbakiye) async {
        if(elementsip.stokkodu == elementbakiye.stokkodu)
        {
          if(elementsip.bakiye !=elementbakiye.bakiye) {
            elementsip.bakiye = elementbakiye.bakiye;
            var result = await dbHelper.updateStok(elementsip);
          }
          //elementbakiye.bakiye = 1;
          if ((elementsip.miktar??0.0) + (elementsip.malfazlasi??0) > (elementbakiye.bakiye??0)) {
            problemb ="${elementsip.stokkodu} "+(((elementbakiye.bakiye??0)>0)?"Yetersiz Stok":"Sıfır Stok");
            problem =
                "Sipariş Miktarı : ${elementsip.miktar}\nMal Fazlası${elementsip.malfazlasi}\n"
                    "Toplam Gerekli Stok : ${(elementsip.miktar??0) + (elementsip.malfazlasi??0)}\n"
                    "Satılabilecek Miktar : ${ AppConfig.format((elementbakiye.bakiye??0), 0)}\n\n" +
                    (((elementbakiye.bakiye??0)>0)? "Miktarı Güncelleyip İşlem Yapabilirsiniz":"Miktarı Sıfırlayarak İşleminize Devam Edebilirsiniz");
          }}
      });
    });


    setActivityState(ActivityState.IsLoaded);
    notifyListeners();
  }

  setSiparisSifirla() async {
    setActivityState(ActivityState.IsLoading);
    await dbHelper.putSiparisSifirla();
    setActivityState(ActivityState.IsLoaded);

    notifyListeners();
  }

  getStokGrupList() async {


    if (Utilities.isWeb()) {
      if(AppConfig.modelStokGrupList==null) {
        var productsFuture = await APIClient.shared.getStokGrupList();
        AppConfig.modelStokGrupList =productsFuture;
      }
      gruplar = AppConfig.modelStokGrupList!;

    } else {
      var productsFuture = await dbHelper.getAllStokGrup();
      AppConfig.modelStokGrupList =[];
      gruplar = productsFuture;
    }
    //cariler = await APIClient.shared.getCariList();

    notifyListeners();
//    navigationTitle = 'Stok Grup Listesi ${stoklar.length.toString()}';
  }

  logout(BuildContext context) async {
    Utilities.startNewView(context,
        route: Routes.login, isReplace: true, clearStack: true);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('IsLoggedIn');
    sharedPreferences.remove('Token');
  }


  setSiparisKaydet(ModelSiparis siparis) async {
    setActivityState(ActivityState.IsLoading);
    ////print("aaaaaaaaaa");
    String sonuc = await APIClient.shared.ekleSiparis(siparis);
    ////print("bbbbbbbbbb");
    if (AppConfig.userId == 0) {
      logout(context!);
      return null;
    }
    if (sonuc != "") {
      AppConfig.siparisStok!.clear();
      setSiparisSifirla();
    }
    setActivityState(ActivityState.IsLoaded);
    return sonuc;
  }
}