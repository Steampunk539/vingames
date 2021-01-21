import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vingames/buisness_logic/view_models/product_viewmodel.dart';
import 'package:vingames/utils/statics/colors.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductViewModel>(
      create: (context) => ProductViewModel(),
      child: Consumer<ProductViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: color_secondary,
        ),
      ),
    );
  }
}
