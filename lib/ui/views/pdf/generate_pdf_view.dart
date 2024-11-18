import 'package:camscanner/ui/views/pdf/generate_pdf_view_model.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class GeneratePdfView extends StatelessWidget {
  const GeneratePdfView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GeneratePdfViewModel>.reactive(
      viewModelBuilder: () => GeneratePdfViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Generate PDF'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Generate a PDF from the scanned documents',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                model.scannedDocuments().isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: model.scannedDocuments().length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image.file(
                                model.scannedDocuments()[index],
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              title: const Text('Scanned Document'),
                            );
                          },
                        ),
                      )
                    : const Center(
                        child: Text('No documents added yet.'),
                      ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () => model.generatePdf(context),
                  icon: const Icon(Icons.picture_as_pdf),
                  label: const Text('Generate PDF'),
                  style: ElevatedButton.styleFrom(
                    iconColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
