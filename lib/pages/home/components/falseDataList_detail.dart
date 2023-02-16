import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kodlaseoshop/AppData.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/DepthList.dart';
import '../../../data/api/Depth.dart';

class FalseDataListDetail extends StatefulWidget {
  const FalseDataListDetail({super.key});

  @override
  _FalseDataListDetailState createState() => _FalseDataListDetailState();
}

class _FalseDataListDetailState extends State<FalseDataListDetail> {


  @override
  void initState() {

  }


  @override
  Widget build(BuildContext context) {
    var Zorumualantrue =
    AppData.modulLists.where((item) => item.zorunlu == true);
    AppData.Zorumualantrue = Zorumualantrue.toList();

    return Center(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        itemCount: AppData.Zorumualantrue.length,
        itemBuilder: (context, index) {
          AppData.yukseklikZorunluTrue =
              AppData.Zorumualantrue[index].yukseklik;
          AppData.Zurunluresim = AppData.Zorumualantrue[index].resim.toString();
          return Visibility(
            visible: false,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              elevation: 0,
              child: ListTile(
                title: Image.network(
                  AppData.Zorumualantrue[index].resim.toString(),
                  scale: 1,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

