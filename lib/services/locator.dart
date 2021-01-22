import 'package:get_it/get_it.dart';
import 'package:vingames/services/order_manager.dart';
import 'package:vingames/services/service_navigation.dart';

//Instancja klasy do wstrzykiwania zależności
GetIt locator = GetIt.instance;

void setupLocator() {
  //Klasa zarządzająca nawigacją/przechodzeniem między ekranami
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  //Klasa zarządzajaca zamówieniem
  locator.registerLazySingleton<OrderManager>(() => OrderManager());
}
