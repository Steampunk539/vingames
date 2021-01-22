import 'package:vingames/buisness_logic/models/product.dart';

import 'database_service.dart';

/**
 * Klasa zarządzająca zamówieniami
 */
class OrderManager {
  //wszystkie produkty
  List<Product> allProducts = [];
  //produkty w koszyku
  List<Product> basket = [];
  //wybrany aktualnie produkt
  Product selectedProduct = new Product();

  /**
   * Konstruktor, który pobiera wszystkie produkty z bazy danych
   */
  OrderManager() {
    allProducts = DatabaseService().getAllProducts();
  }
  /**
   * Wyzerowanie koszyka
   */
  void clearBasket() {
    basket = [];
  }

  /**
   * Obliczenie ceny całego zamowienia
   */
  double calculatePrice() {
    double price = 0;
    for (Product product in basket) {
      price += double.parse(product.price) * product.amount;
    }
    return price;
  }

  /**
   * ilosc produktow w koszyku
   */
  int amountInBasket() {
    int amount = 0;
    for (Product product in basket) {
      amount += product.amount;
    }
    return amount;
  }

  /**
   * Ustal wybrany produkt
   */
  void setSelectedProdut(Product product) {
    selectedProduct = product;
  }

  /**
   * Dodaj produkt do koszyka
   */
  void addProductToBasket(Product product) {
    basket.add(product);
  }

  /**
   * Usun produkt z koszyka
   */
  void removeProductFromBasket(int i) {
    basket.removeAt(i);
  }
}
