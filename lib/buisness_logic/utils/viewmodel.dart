import 'package:flutter/material.dart';
import 'package:vingames/services/locator.dart';
import 'package:vingames/services/service_navigation.dart';

/**
 * Klasa zajmująca sie logiką biznesową 
 */
class ViewModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  final NavigationService navigationService = locator<NavigationService>();
}
