import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const int _initialPage = 1;

  bool isSampleDoc = true;
  late PdfController _pdfController;

  @override
  void initState() {
    _pdfController = PdfController(
      document: PdfDocument.openAsset('assets/sample.pdf'),
      initialPage: _initialPage,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: const Color(0xff00a011)),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Pdf Viewer'),
          ),
          body: PdfView(
            scrollDirection: Axis.vertical,
            documentLoader: const Center(child: CircularProgressIndicator()),
            pageLoader: const Center(child: CircularProgressIndicator()),
            controller: _pdfController,
            onDocumentLoaded: (document) {},
            onPageChanged: (page) {},
          ),
        ),
      );
}
