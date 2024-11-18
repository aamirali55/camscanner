
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:camscanner/app/app.locator.dart';
import 'package:camscanner/app/app.router.dart';

class HomeViewModel extends BaseViewModel {
 
  final NavigationService _navigationService = locator<NavigationService>();


  void navigateToScanDocument() {
    _navigationService.navigateTo(Routes.scanDocumentView);
  }

  void navigateToGeneratePdf() {
    _navigationService.navigateTo(Routes.generatePdfView);
  }

   void navigateToDocumentView() {
    _navigationService.navigateTo(Routes.documentView);
  }
 
}
