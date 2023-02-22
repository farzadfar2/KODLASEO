import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import '../../../AppData.dart';
import '../../../Model/ModulList.dart';
import '../../../Model/PostGiveModelList.dart';
import '../../../data/api/Depth.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';
import 'createModul_info_detail.dart';

class CreateModulInfoShow extends StatefulWidget {
  const CreateModulInfoShow({super.key});

  @override
  _CreateModulInfoShowState createState() => _CreateModulInfoShowState();
}

class _CreateModulInfoShowState extends State<CreateModulInfoShow> {
  var formKey = GlobalKey<FormState>();
  List<Value> value = [];
  List<Modullistesi> modullistesi = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      LoadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: ScreenHelper(
          desktop: _buildUi(kDesktopMaxWidth),
          tablet: _buildUi(kTabletMaxWidth),
          mobile: _buildUi(getMobileMaxWidth(context)),
        ),
      ),
    );
  }

  @override
  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Flex(
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Expanded(
                    flex: ScreenHelper.isMobile(context) ? 0 : 2,
                    child: Column(
                      children: [
                        CreateModulShowDetail1(),
                      ],
                    )),
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: CreateModulShowDetail(),
                ),
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: Image.network(
                    AppData.siparisresim,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  CreateModulShowDetail() {
    return Center(
        child: Column(
      children: [
        Card(
          child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: ListTile(
                leading: Image.network(
                  "assets/icon/derinlik.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                //  title: Text("Derinlik : " + AppData.depthhdata.toString()),
                title: Text("Derinlik : " + AppData.siparisderinlik.toString()),
                //  subtitle: Text("Derinlik : "),
                tileColor: Colors.grey.shade200,
              )),
        ),
        Card(
          child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: ListTile(
                leading: Image.network(
                  "assets/icon/genis.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text("Genişlik : " + AppData.siparisgenislik.toString()),
                //  subtitle: Text("Derinlik : "),
                tileColor: Colors.grey.shade200,
              )),
        ),
        Card(
          child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: ListTile(
                leading: Image.network(
                  "assets/icon/yuksek.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                    "ÜrÜn Yükseklik : " + AppData.siparisyukseklik.toString()),
                tileColor: Colors.grey.shade200,
              )),
        ),
        Card(
          child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: ListTile(
                leading: Image.network(
                  "assets/icon/ebat.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text("Koli Ebatı : " + AppData.sipariskoliebat),
                //  subtitle: Text("Derinlik : "),
                tileColor: Colors.grey.shade200,
              )),
        ),
        Card(
          child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: ListTile(
                leading: Image.network(
                  "assets/icon/fiyat.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  "Fiyat : " + AppData.siparisfiyat.toString(),
                ),
                // subtitle: Text("Derinlik : "),
                tileColor: Colors.grey.shade200,
              )),
        ),
      ],
    ));
  }

  CreateModulShowDetail1() {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: ListTile(
                leading: Image.network(
                  "assets/icon/genis.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text("Seçilen Moduller"),
                //  subtitle: Text("Derinlik : "),
                tileColor: Colors.grey.shade200,
              )),
        ),
        Column(
          children: List.generate(modullistesi.length, (index) {
            return ResponsiveWrapper(
              child: Card(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      //   Navigator.pushNamed(context, "/CreateProductListItemDetail");
                    });
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListTile(
                        title: Text(
                          modullistesi[index].miktar.toString() + "Adet",
                        ),
                        subtitle: Text(modullistesi[index].moduladi.toString()),
                      )),
                ),
              ),
            );
          }),
        ),
        Card(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade600, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                setState(() {
                  LoadData();
                });
              },
              child: Text("Yazdır",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0))),
        ),
      ],
    ));
  }

  LoadData() {
    //print(AppData.moduldataresponse);
    //print(json.decode(AppData.moduldataresponse));
    Iterable data = json.decode(AppData.moduldataresponse);
    data.forEach((element) {
      Map obj = element;
      bool success = obj["success"];

      Map value = obj['value'];
      AppData.siparisresim = value['resim'];
      AppData.siparisgenislik = value['genislik'];
      AppData.siparisyukseklik = value['yukseklik'];
      AppData.siparisderinlik = value['derinlik'];
      AppData.sipariskoliebat = value['koliebati'];
      AppData.siparisfiyat = value['fiyat'];

      List modullistesi = value['modullistesi'];

      print("value");

      print(value);
      print("success");
      print(success);
      setState(() {
        List Listbas = modullistesi;
        this.modullistesi =
            Listbas.map((modullistesi) => Modullistesi.fromJson(modullistesi))
                .toList();
      });
    });
  }
}
