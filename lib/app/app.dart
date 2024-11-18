import 'package:camscanner/services/add_document_services.dart';
import 'package:camscanner/ui/views/document/document_view.dart';
import 'package:camscanner/ui/views/home/home_view.dart';
import 'package:camscanner/ui/views/home/scan/Scan_document_view.dart';
import 'package:camscanner/ui/views/pdf/generate_pdf_view.dart';
import 'package:camscanner/ui/views/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: ScanDocumentView),
    MaterialRoute(page: GeneratePdfView),
    MaterialRoute(page: DocumentView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    Singleton(classType: AddDocumentService),
  ],
)
class App {}
