import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'document_view_model.dart';

class DocumentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DocumentViewModel>.reactive(
      viewModelBuilder: () => DocumentViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Document Viewer'),
          ),
          body: model.tempPdfFiles().isEmpty
              ? const Center(child: Text('No PDFs available.'))
              : ListView.builder(
                  itemCount: model.tempPdfFiles().length,
                  itemBuilder: (context, index) {
                    final pdfFile = model.tempPdfFiles()[index];
                    return ListTile(
                      title: Text(pdfFile.path.split('/').last),
                      onTap: () {
                        model.openPdf(context, pdfFile);
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
