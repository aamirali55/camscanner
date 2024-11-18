import 'dart:io';
import 'package:camscanner/app/app.locator.dart';
import 'package:camscanner/services/add_document_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:stacked/stacked.dart';

class DocumentViewModel extends BaseViewModel {
  final AddDocumentService _addDocumentService = locator<AddDocumentService>();

  List<File> tempPdfFiles() {
    return _addDocumentService.tempPdfFiles;
  }

  void openPdf(BuildContext context, File pdfFile) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewer(pdfPath: pdfFile.path), 
      ),
    );
  }
}

class PdfViewer extends StatelessWidget {
  final String pdfPath;

  const PdfViewer({required this.pdfPath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PDF Viewer")),
      body: Center(
        child: PDFView(
          filePath: pdfPath,
        ),
      ),
    );
  }
}
