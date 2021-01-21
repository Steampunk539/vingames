import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vingames/buisness_logic/view_models/home_viewmodel.dart';
import 'package:vingames/utils/statics/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: color_secondary,
        ),
      ),
    );
  }
}
