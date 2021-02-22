import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:login_app/constants.dart';

class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
        ),
        body: FutureBuilder(
            future: PDFDocument.fromURL(
                'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf'),
            builder:
                (BuildContext context, AsyncSnapshot<PDFDocument> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return PDFViewer(document: snapshot.data);
              } else
                return Center(child: CircularProgressIndicator());
            }));
  }
}
