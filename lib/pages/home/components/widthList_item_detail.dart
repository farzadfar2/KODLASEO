import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../AppData.dart';
import '../../../Model/WidthList.dart';
import '../../../data/api/Depth.dart';

class WidthListItemDetail extends StatefulWidget {
  const WidthListItemDetail({
    super.key,
  });

  @override
  _WidthListItemDetailState createState() => _WidthListItemDetailState();
}

class _WidthListItemDetailState extends State<WidthListItemDetail> {
  // bool _validate = false;
  bool _loading = false;
  List<WidthList> widthlists = [];
  var formKey = GlobalKey<FormState>();
  var mySharedPrefences;

  @override
  void initState() {
    getWithList();

    AppData.Zorumualanfalse = [];
    AppData.Zorumualantrue = [];
    AppData.namProductImagees = [];
    AppData.Zorumualanfalse = [];
    AppData.Zorumualantrue = [];
    AppData.namProductImagees = [];
    AppData.TotalUrunMaxYukseklik = [];
    AppData.TotalUrunagrlik = [];
    AppData.TotalUrunfiyat = [];
    AppData.TotalUrunDesi = [];
    AppData.ModulListId = [];

    AppData.Zorumualantrue = [];
    AppData.modulLists = [];
    AppData.enablewidget = false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.extent(
        maxCrossAxisExtent: 200,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,

        children: List.generate(widthlists.length, (index) {
          return Card(
            child: InkWell(
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setInt('withhhdata', widthlists[index].genislik);
                setState(() {
                  AppData.Zorumualanfalse = [];
                  AppData.Zorumualantrue = [];
                  AppData.namProductImagees = [];
                //  AppData.withhhdata = widthlists[index].genislik;
                 // AppData.c.set("withhhdata", widthlists[index].genislik);



                  AppData.maxyukseklik = widthlists[index].maxyukseklik;
                 print(widthlists[index].maxyukseklik);
                  AppData.Genislikrenk = widthlists[index].renk.toString();
                  AppData.modulLists = [];

                  AppData.TotalUrunMaxYukseklik = [];
                  AppData.TotalUrunagrlik = [];
                  AppData.TotalUrunfiyat = [];
                  AppData.TotalUrunDesi = [];
                  AppData.ModulListId = [];

                  AppData.enablewidget = false;
                  Navigator.pushNamed(context, "/CreateProductListItemDetail");
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          widthlists[index].resim.toString(),
                          height: 100,
                          alignment: Alignment.center,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              //  color: Color(0xFF6ae792),

                              color:
                                  HexColor(widthlists[index].renk.toString()),

                              border: Border.all(
                                color:
                                    HexColor(widthlists[index].renk.toString()),
                              ),
                            ),
                            child: Center(
                              child: Text(   AppData.language ==1 ? "Genişlik : " +  "" +  widthlists[index].genislik.toString() + " cm" :"Width : " +  "" +  widthlists[index].genislik.toString() + " cm" ,
                                style: TextStyle(
                                  //  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,

                                  // letterSpacing: 1.0
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void getWithList() async {
    //int derinlik = AppData.depthhdata;
    int derinlik = 28;
    DepthApi.getWidthListWithLanguage(derinlik).then((response) {
      setState(() {
        List data = jsonDecode(response.body);
        data.forEach((element) {
          Map obj = element;
          // bool success = obj['success'];
          List value = obj['value'];

          List value1 = value;
          this.widthlists = value1.map((e) => WidthList.fromJSON(e)).toList();
        });
        widthlists.length > 0 ? widthlists : show_massaje();
      });
    });
  }

  show_massaje() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Veri Bulunamadı'),
    ));
  }
}
