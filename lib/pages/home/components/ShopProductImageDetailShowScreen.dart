
import 'package:flutter/material.dart';
import 'package:kodlaseoshop/AppData.dart';


class ShopProductImageDetailShow extends StatefulWidget {
  const ShopProductImageDetailShow({super.key});

  @override
  _ShopProductImageDetailShowState createState() =>
      _ShopProductImageDetailShowState();
}

class _ShopProductImageDetailShowState
    extends State<ShopProductImageDetailShow> {



  @override
  void initState() {
    setState(() {
      AppData.Zorumualanfalse = [];
      AppData.Zorumualantrue = [];
      AppData.namProductImagees = [];
      AppData.TotalUrunMaxYukseklik = [];
      AppData.TotalUrunagrlik = [];
      AppData.TotalUrunfiyat = [];
      AppData.TotalUrunDesi = [];
      AppData.ModulListId = [];
      AppData.modulLists = [];
      AppData.enablewidget = false;
    });


      }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        AppData.siparisresim,
        fit: BoxFit.cover,
       // height: 400,
      ),
    );
  }


}
