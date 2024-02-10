import 'dart:io';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';


class pdfview extends StatefulWidget {
  File file;
  pdfview(this.file);

  @override
  State<pdfview> createState() => _pdfviewState();
}

class _pdfviewState extends State<pdfview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Container(
        height: 500,
        child:PDFView(
          filePath:widget.file.path,
          enableSwipe: true,
          swipeHorizontal: true,
          autoSpacing: false,
          pageFling: false,
          onRender: (_pages) {
            setState(() {

            });
          },
          onError: (error) {
            print(error.toString());
          },
          onPageError: (page, error) {
            print('$page: ${error.toString()}');
          },
          onViewCreated: (PDFViewController pdfViewController) {
            // _controller.complete(pdfViewController);
          },
          // onPageChanged: (int page, int total) {
          //   print('page change: $page/$total');
          // },
        ),
      ),
      )
    );
  }
}
