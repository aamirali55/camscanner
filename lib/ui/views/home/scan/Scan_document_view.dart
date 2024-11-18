
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:camscanner/ui/views/home/scan/scan_document_view_model.dart';

class ScanDocumentView extends StatelessWidget {
  const ScanDocumentView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScanDocumentViewModel>.reactive(
      viewModelBuilder: () => ScanDocumentViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Scan Document'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Scan a Document',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: model.scannedImage != null
                      ? Column(
                          children: [
                            Expanded(
                              child: Image.file(model.scannedImage!),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton.icon(
                              onPressed: model.clearImage,
                              icon: const Icon(Icons.delete),
                              label: const Text('Clear Image'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                            ),
                            const SizedBox(height: 20),
                            
                            ElevatedButton.icon(
                              onPressed: () {
                                model.addDocument();
                              },
                              icon: const Icon(Icons.add),
                              label: const Text('Add Document'),
                            ),
                          ],
                        )
                      : const Center(
                          child: Text(
                            'No image scanned yet.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: model.pickImageFromCamera,
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('Camera'),
                    ),
                    ElevatedButton.icon(
                      onPressed: model.pickImageFromGallery,
                      icon: const Icon(Icons.photo),
                      label: const Text('Gallery'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
