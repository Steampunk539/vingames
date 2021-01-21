import 'package:flutter/rendering.dart';
import 'package:vingames/buisness_logic/models/product.dart';

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
  List<Product> getAllProducts() {
    List<Product> products = new List();
    for (int i = 0; i < 100; i++) {
      products.add(new Product(
          name: "Double Expresso",
          price: "10",
          shortDesc:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ut commodo risus.",
          desc:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ut commodo risus. Etiam posuere sapien eu imperdiet commodo. Curabitur vestibulum at nibh id dapibus. Praesent molestie nisl pretium condimentum blandit. Suspendisse at massa ut lorem malesuada sodales et eget dolor. Maecenas varius malesuada sapien nec elementum. Aliquam erat volutpat. Cras efficitur libero et enim semper, nec sagittis sem egestas. Praesent ac massa a nulla tempus ultricies eu consequat metus. Donec neque arcu, rhoncus ac posuere a, congue vel magna. Nunc lectus lacus, vehicula sit amet egestas ut, faucibus faucibus dolor. Donec felis sapien, bibendum et neque eu, tristique bibendum lorem. Morbi id ligula id arcu elementum sagittis a facilisis elit. In elementum ex sed egestas pharetra. Pellentesque odio enim, sollicitudin in molestie ut, placerat ut velit. Praesent et sollicitudin ante.  ",
          imageProvider: NetworkImage(
              "https://image.freepik.com/free-psd/paper-bag-concept-with-mock-up_23-2148807320.jpg")));
    }
    return products;
  }
}
