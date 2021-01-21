import 'package:vingames/buisness_logic/models/product.dart';

import 'database_service.dart';

class OrderManager {
  List<Product> allProducts = [];
  List<Product> basket = [];
  Product selectedProduct = new Product();
  DateTime pickUpDate = new DateTime.now();
  OrderManager() {
    allProducts = DatabaseService().getAllProducts();
  }
  void clearBasket() {
    basket = new List();
  }

  double calculatePrice() {
    double price = 0;
    for (Product product in basket) {
      price += double.parse(product.price);
    }
    return price;
  }

  void setPickUpDate(DateTime time) {
    pickUpDate = time;
  }

  void setSelectedProdut(Product product) {
    selectedProduct = product;
  }

  void addProductToBasket(Product product) {
    basket.add(product);
  }

  void removeProductFromBasket(int i) {
    basket.removeAt(i);
  }
}