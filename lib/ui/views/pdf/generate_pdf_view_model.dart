import 'dart:io';
import 'package:camscanner/app/app.locator.dart';
import 'package:camscanner/services/add_document_services.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class GeneratePdfViewModel extends ChangeNotifier {
  final AddDocumentService _addDocumentService = locator<AddDocumentService>();


  List<File> scannedDocuments() {
    return _addDocumentService.scannedDocuments;
  }


  Future<void> generatePdf(BuildContext context) async {
    if (scannedDocuments().isEmpty) {
      _showSnackbar(context, "No documents to add to the PDF");
      return;
    }

    final pdf = pw.Document();

    for (var doc in scannedDocuments()) {
      final image = pw.MemoryImage(doc.readAsBytesSync());
      pdf.addPage(pw.Page(
        build: (pw.Context context) {
          return pw.Image(image); 
        },
      ));
    }

   
    try {
      final tempDir = await getTemporaryDirectory();
      final tempPdfPath = '${tempDir.path}/scanned_documents.pdf';
      final tempPdfFile = File(tempPdfPath);
      await tempPdfFile.writeAsBytes(await pdf.save());

      _addDocumentService.tempPdfFiles.add(tempPdfFile);
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PdfViewerPage(pdfPath: tempPdfPath),
        ),
      );
    } catch (e) {
      _showSnackbar(context, "An error occurred while generating the PDF: $e");
    }
  }

 
  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}

class PdfViewerPage extends StatelessWidget {
  final String pdfPath;

  const PdfViewerPage({required this.pdfPath});

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
