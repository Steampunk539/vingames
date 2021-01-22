import 'package:flutter/material.dart';

/**
 * Klasa zarządzająca nawigacją
 */
class NavigationService {
  /**
   * wspólny klucz aplikacji do dostępu do ścieżek
   */
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  /**
   * funkcja cofajaca o jeden ekran w tyl
   * jezeli jest taka mozliwosc
   */
  void pop() {
    return _navigationKey.currentState.pop();
  }

  /**
   * metoda nawigujaca do wybranego ekranu
   */
  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        .pushNamed(routeName, arguments: arguments);
  }

  /**
   * metoda nawigujaca do wybranego ekranu
   * i czyszczaca historie ekranow
   */
  Future<dynamic> navigateToAndReplaceUntil(String routeName,
      {dynamic arguments}) {
    return _navigationKey.currentState.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }
}
