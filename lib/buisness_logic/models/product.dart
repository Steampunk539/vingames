import 'package:flutter/widgets.dart';

/**
 * Model podstawowej klasy produktu
 */
class Product {
  ImageProvider imageProvider;
  String name;
  String price;
  int amount;
  String desc;
  String shortDesc;
  Product(
      {this.imageProvider,
      this.amount,
      this.shortDesc,
      this.name,
      this.price,
      this.desc});
}
