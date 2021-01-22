import 'package:flutter/rendering.dart';
import 'package:vingames/buisness_logic/models/product.dart';

/**
 * Implementacja bazy danych
 */
class DatabaseService {
  void addNewProduct() {
    //TODO Implement with remote database
  }
  void removeProduct() {
    //TODO Implement with remote database
  }
  void updateProduct() {
    //TODO Implement with remote database
  }
  /**
   * Fałszywe wstrzyknięcie produktów
   */
  List<Product> getAllProducts() {
    List<Product> products = new List();
    for (int i = 0; i < 100; i++) {
      products.add(new Product(
          name: "CYBERPUNK",
          price: "199.99",
          amount: 0,
          shortDesc: " Si-Fi, Akcja, RPG",
          desc:
              "Cyberpunk 2077 jest fabularną grą akcji, zawierającą elementy strzelanek pierwszoosobowych. Gracz wciela się w V, którego płeć, głos, wygląd (twarz, fryzurę, sylwetkę, modyfikacje ciała, rozmiar przyrodzenia czy biustu), pochodzenie i ubiór może dostosować według własnych upodobań.",
          imageProvider: AssetImage("assets/images/CP1.jpg")));
    }
    return products;
  }
}
