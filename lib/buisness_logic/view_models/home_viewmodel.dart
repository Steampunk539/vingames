import 'package:vingames/buisness_logic/models/product.dart';
import 'package:vingames/buisness_logic/utils/viewmodel.dart';
import 'package:vingames/services/locator.dart';
import 'package:vingames/services/order_manager.dart';
import 'package:vingames/utils/statics/route_names.dart';

class HomeViewModel extends ViewModel {
  OrderManager orderManager = locator<OrderManager>();
  void goToProduct(Product product) {
    orderManager.setSelectedProdut(product);
    navigationService.navigateToAndReplaceUntil(ProductViewRoute);
  }

  void goToBasketPage() {
    navigationService.navigateToAndReplaceUntil(BasketViewRoute);
  }

  void addToBasket(Product product) {
    product.amount = 1;
    orderManager.addProductToBasket(product);
    notifyListeners();
  }
}
