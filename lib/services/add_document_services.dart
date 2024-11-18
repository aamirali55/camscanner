import 'dart:io';


class AddDocumentService {
  List<File> scannedDocuments = [];
  List<File> tempPdfFiles = [];

  void addDocument(File document) {
   scannedDocuments.add(document);
    print("Document added: ${document.path}");
    
  }

  void addPdf(File file) {
    tempPdfFiles.add(file);
  }

  void removePdf(File file) {
    tempPdfFiles.remove(file);
  }

  void clearAllPdfs() {
    tempPdfFiles.clear();
  }
}



