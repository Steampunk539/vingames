import 'package:vingames/buisness_logic/utils/viewmodel.dart';
import 'package:vingames/services/locator.dart';
import 'package:vingames/services/order_manager.dart';
import 'package:vingames/utils/statics/route_names.dart';

class BasketViewModel extends ViewModel {
  final OrderManager orderManager = locator<OrderManager>();

  void goToThankPage() {
    orderManager.clearBasket();
    navigationService.navigateToAndReplaceUntil(ThankViewRoute);
  }

  void goToMainPage() {
    navigationService.navigateToAndReplaceUntil(HomeViewRoute);
  }

  void addAmount(int i) {
    orderManager.basket[i].amount++;
    notifyListeners();
  }

  void removeAmount(int i) {
    if (orderManager.basket[i].amount == 1) {
      orderManager.basket.removeAt(i);
    } else {
      orderManager.basket[i].amount--;
    }
    notifyListeners();
  }
}
