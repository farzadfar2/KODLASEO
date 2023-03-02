import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kodlaseoshop/AppData.dart';
import '../../exportPdf/pdfexport/pdfpreview.dart';

class ShopModulListDetailShow extends StatefulWidget {
  const ShopModulListDetailShow({super.key});

  @override
  _ShopModulListDetailShowState createState() =>
      _ShopModulListDetailShowState();
}

class _ShopModulListDetailShowState extends State<ShopModulListDetailShow> {



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
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [

        Text( AppData.language ==1 ? "Olüştür": "Create",
          style: GoogleFonts.alata(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
          ),
        ),
        SizedBox(
          height: 15.0,
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
                title: Text(  AppData.language ==1 ?   "Seçilen Moduller" : "Selected Modules",
                ),

                //  subtitle: Text("Derinlik : "),
                tileColor: Colors.grey.shade200,
              )),
        ),
        Column(
          children: List.generate(  AppData.siparismodullistesipassdata .length, (index) {
            return Card(
              child: InkWell(
                onTap: () {},
                child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListTile(
                      title: Text( AppData.language ==1 ? AppData.siparismodullistesipassdata [index].miktar.toString() + " Adet" : AppData.siparismodullistesipassdata [index].miktar.toString() + " Piece",
                      ),
                      subtitle: Text(  AppData.siparismodullistesipassdata [index].moduladi.toString() +
                          " - " +
                          AppData.siparismodullistesipassdata [index].modulaciklama.toString()),
                    )),
              ),
            );
          }),
        ),
        SizedBox(
          height: 25.0,
        ),
        Container(
          width: 400,
          height: 40,
          child: ElevatedButton(

              style: ElevatedButton.styleFrom(
                primary: Colors.orange.shade700, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
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
                Navigator.pushNamed(context, "/WidthScreen");
              },

              child: Text(   AppData.language ==1 ?   "YENİDEN TASARLA" :  "REDESIGN",
                  style:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 25.0))),
        ),
        SizedBox(
          height: 25.0,
        ),
        Container(
          width: 400,
          height: 40,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green.shade600, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PdfPreviewPage(
                          siparismodullistesipassdata:
                              AppData.siparismodullistesipassdata,
                          siparisresim: AppData.siparisresim,
                          siparisgenislik: AppData.siparisgenislik,
                          siparisyukseklik: AppData.siparisyukseklik,
                          siparisderinlik: AppData.siparisderinlik,
                          siparisfiyat: AppData.siparisfiyat,
                          siparistarih: AppData.Date),
                      //   builder: (context) => PdfPreviewPage(),
                    ),
                  );
                });
              },
              child: Text(AppData.language ==1 ?   "YAZDIR" : "PRINT",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 25.0))),
        ),
      ],
    ));
  }


}
