import 'package:get_it/get_it.dart';
import 'package:vingames/services/order_manager.dart';
import 'package:vingames/services/service_navigation.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<OrderManager>(() => OrderManager());
}
