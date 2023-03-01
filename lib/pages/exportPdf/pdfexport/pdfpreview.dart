import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kodlaseoshop/pages/exportPdf/pdfexport/pdf/pdfexportEn.dart';

import 'package:printing/printing.dart';
import '../../../AppData.dart';
import 'pdf/pdfexport.dart';

class PdfPreviewPage extends StatelessWidget {
  final List siparismodullistesipassdata;
  final String siparisresim;
  final String siparistarih;
  final int siparisgenislik;
  final int siparisyukseklik;
  final int siparisderinlik;
  final double siparisfiyat;

  const PdfPreviewPage(
      {Key? key,
      required this.siparismodullistesipassdata,
      required this.siparisresim,
      required this.siparisgenislik,
      required this.siparisyukseklik,
      required this.siparisderinlik,
      required this.siparisfiyat,
      required this.siparistarih})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body:  PdfPreview(
        build: (context) =>
        AppData.language ==1 ?
        makePdf(
            siparismodullistesipassdata,
            siparisresim,
            siparisgenislik,
            siparisyukseklik,
            siparisderinlik,
            siparisfiyat,
            siparistarih)
            :makePdfEN(
            siparismodullistesipassdata,
            siparisresim,
            siparisgenislik,
            siparisyukseklik,
            siparisderinlik,
            siparisfiyat,
            siparistarih)
      )  ,
      ) ;

  }
}
