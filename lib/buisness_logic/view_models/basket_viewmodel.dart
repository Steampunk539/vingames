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
}
