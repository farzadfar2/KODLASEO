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

  List<ModelModulPostGiveValueModullistesi> modelModulPostGiveValueModullistesi = [];


  @override
  void initState() {}

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
                  child: CreateModulShowDetail1(),
                ),
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: CreateModulShowDetail(),
                ),
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: Image.asset(
                    "assets/person.png",
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
                    title: Text("Derinlik : " + "28"),
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
                    title: Text("Genişlik : " + AppData.withhhdata.toString()),
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
                        "ÜrÜn Yükseklik : " +
                            AppData.yuksekliktotal.toString()),
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
                    title: Text(
                        "Koli Ebatı : " + AppData.desitotal.toString() +
                            " Desi"),
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
                      "Fiyat : " +
                          AppData.fiyattotal.toStringAsFixed(2).toString(),
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
                        "Adet : " +
                            AppData.yuksekliktotal.toString()),
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
                    title: Text(
                        "Modul : " + AppData.desitotal.toString() +
                            " Desi"),
                    //  subtitle: Text("Derinlik : "),
                    tileColor: Colors.grey.shade200,
                  )),
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

                    /*  print(  "AppData.moduldataresponse");
                      print(  AppData.moduldataresponse);
                      print(  "AppData.moduldataresponse");
*/



                 /*     List<String> data = jsonDecode(AppData.moduldataresponse);
                      print("data");
                      print(data);*/
                 /*     data.forEach((element) {
                        Map obj = element;
                        List modullistesi = obj ['modullistesi'];
                        print("modullistesi");
                        print(modullistesi);
                        setState(() {
                        List Listbas = modullistesi;
                        this.modelModulPostGiveValueModullistesi =
                            Listbas.map((modelModulPostGiveValueModullistesi) =>  ModelModulPostGiveValueModullistesi.fromJson(modelModulPostGiveValueModullistesi)).toList();
                        print("ModelModulPostGiveValueModullistesi.length");
                        print(modelModulPostGiveValueModullistesi.length);

                      });
                      });*/

                    });
                  },
                  child: Text("Yazdır",
                      style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0))),
            ),

          ],
        ));
  }

  Future LoadData()  async  {
    print(  AppData.moduldataresponse);
    print(  "AppData.moduldataresponse");

    List jsonResponse = json.decode(AppData.moduldataresponse);
  print(jsonResponse);


  }
}