import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import 'package:provider/provider.dart';
import 'package:vingames/buisness_logic/view_models/basket_viewmodel.dart';
import 'package:vingames/utils/statics/colors.dart';

class BasketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BasketViewModel>(
      create: (context) => BasketViewModel(),
      child: Consumer<BasketViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: color_secondary,
        ),
      ),
    );
  }
}
