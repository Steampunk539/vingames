import 'package:flutter/widgets.dart';

class Product {
  ImageProvider imageProvider;
  String name;
  String price;
  String desc;
  String shortDesc;
  Product(
      {this.imageProvider, this.shortDesc, this.name, this.price, this.desc});
}
