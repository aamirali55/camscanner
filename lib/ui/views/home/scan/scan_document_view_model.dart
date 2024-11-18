import 'dart:io';

import 'package:camscanner/app/app.locator.dart';
import 'package:camscanner/services/add_document_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class ScanDocumentViewModel extends BaseViewModel {
  File? scannedImage;
   AddDocumentService _AddDocumentService = locator<AddDocumentService>();
  
  Future<void> pickImageFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      scannedImage = File(image.path);
      notifyListeners(); 
    }
  }

 
  Future<void> pickImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      scannedImage = File(image.path);
      notifyListeners(); 
    }
  }

  
  void clearImage() {
    scannedImage = null;
    notifyListeners(); 
  }

  
  void addDocument() {
    if (scannedImage != null) {
      _AddDocumentService.addDocument(scannedImage!);
      scannedImage = null;
      notifyListeners();
    }
  }
}
