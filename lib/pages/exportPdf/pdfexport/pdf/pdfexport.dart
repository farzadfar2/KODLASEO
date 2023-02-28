import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;
import 'package:printing/printing.dart';

import '../../../../AppData.dart';

Future<Uint8List> makePdf( List siparismodullistesipassdata, String  siparisresim,  siparisgenislik, siparisyukseklik,  siparisderinlik,  siparisfiyat ,siparistarih) async {

  final pdf = Document();
  final imageLogo = MemoryImage((await rootBundle.load('images/logo.png')).buffer.asUint8List());
  final netImage = await  networkImage('http://seowoodapi2.kodlatech.com:8180/api/siparis/resimyeni/2356.png');



  pdf.addPage( pw.Page(build: (pw.Context context){
        return Center(

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      //  Text("Attention to: ${invoice.customer}"),
                      Text("Tarih : " + siparistarih),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image(imageLogo),
                  )
                ],
              ),
              Container(height: 50),
              Table(
                border: TableBorder.all(color: PdfColors.black),
                children: [
                  TableRow(
                    children: [
                      Padding(
                        child: Text(
                          'MODULLER',
                          style: Theme.of(context).header4,
                          textAlign: TextAlign.center,
                        ),
                        padding: EdgeInsets.all(3),
                      ),
                    ],
                  ),
                  ...siparismodullistesipassdata.map(
                        (e) => TableRow(
                      children: [
                        Expanded(
                          child: PaddedText(e.moduladi),
                          flex: 2,
                        ),
                        Expanded(
                          child: PaddedText("${e.miktar} Adet"),
                          flex: 1,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(height: 20),
              Table(
                border: TableBorder.all(color: PdfColors.black),
                children: [
                  TableRow(
                    children: [
                      PaddedText('Genişlik'),
                      PaddedText(
                        siparisgenislik.toString() + " cm",
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      PaddedText(
                        'Yükseklik',
                      ),
                      PaddedText(
                        siparisyukseklik.toString() + " cm",
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      PaddedText(
                        'Derinlik',
                      ),
                      PaddedText(siparisderinlik.toString() + " cm")
                    ],
                  ),
                  TableRow(
                    children: [
                      PaddedText(
                        'Fiyat',
                      ),
                      PaddedText(siparisfiyat.toString() + "TL")
                    ],
                  )
                ],
              ),
              Container(height: 30),
             // Text("Please forward the below slip to your accounts payable department."),
             /* Divider(
                height: 1,
                borderStyle: BorderStyle.dashed,
              ),*/
            pw.Center(
              child: pw.Image(netImage,
               // fit: BoxFit.contain
              height: 250,
              ),
            ),
              Container(height: 2),
              Padding(
                child: Text(
                  "THANK YOU FOR YOUR CUSTOM!",
                  style: Theme.of(context).header5,
                ),
                padding: EdgeInsets.all(5),
              ),

             /* Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  'Please ensure all cheques are payable to the ADAM FAMILY TRUST.',
                  style: Theme.of(context).header3.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              )*/
            ],
          ),
        );
      },
      ),
      );
      return pdf.save();
}

Widget PaddedText(
    final String text, {
      final TextAlign align = TextAlign.left,
    }) =>
    Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: align,
      ),
    );
