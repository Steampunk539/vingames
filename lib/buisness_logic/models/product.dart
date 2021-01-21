import 'package:flutter/widgets.dart';

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
