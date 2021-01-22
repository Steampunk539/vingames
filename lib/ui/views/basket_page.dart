import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import 'package:provider/provider.dart';
import 'package:vingames/buisness_logic/models/product.dart';
import 'package:vingames/buisness_logic/view_models/basket_viewmodel.dart';
import 'package:vingames/ui/components/centered_view.dart';
import 'package:vingames/utils/statics/colors.dart';

class BasketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BasketViewModel>(
      create: (context) => BasketViewModel(),
      child: Consumer<BasketViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: color_bg,
          body: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(),
                buildUpperBar(model),
                CenteredView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 16),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: Colors.grey.shade500.withOpacity(0.05)),
                        child: Text(
                          "Twój koszyk",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: model.orderManager.basket.length,
                                itemBuilder: (context, i) {
                                  Product product =
                                      model.orderManager.basket[i];
                                  return Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.all(8),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: MaterialButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {},
                                            child: Image(
                                              image: product.imageProvider,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  product.name,
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  product.shortDesc,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  "Przewidywany czas dostawy:\n3 dni",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                "${product.price} zł",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                              SizedBox(
                                                height: 60,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  IconButton(
                                                      icon: Icon(
                                                        Icons
                                                            .remove_circle_outline,
                                                        color: Colors.white,
                                                      ),
                                                      onPressed: () {
                                                        model.removeAmount(i);
                                                      }),
                                                  Text(
                                                    "${product.amount}",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  IconButton(
                                                      icon: Icon(
                                                        Icons
                                                            .add_circle_outline,
                                                        color: Colors.white,
                                                      ),
                                                      onPressed: () {
                                                        model.addAmount(i);
                                                      }),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "SUMA: ${model.orderManager.calculatePrice()} zł",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: 8,
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.white,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 1),
                                  height: 1,
                                  color: Colors.white,
                                ),
                                Container(
                                  height: 32,
                                ),
                                MaterialButton(
                                  minWidth: double.infinity,
                                  onPressed: model.goToThankPage,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      side: BorderSide(color: Colors.white)),
                                  color: color_secondary,
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    "Przejdź dalej",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          )),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildUpperBar(BasketViewModel model) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          border:
              Border.symmetric(horizontal: BorderSide(color: Colors.white))),
      child: CenteredView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: model.goToMainPage,
              child: Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  filterQuality: FilterQuality.medium,
                  height: 50,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                    width: 200,
                    height: 30,
                    child: TextFormField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: "szukaj w sklepie",
                          labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 12)),
                    )),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                  color: Colors.white,
                ),
              ],
            ),
            Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_basket_outlined),
                  onPressed: () {},
                  color: Colors.white,
                ),
                Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      width: 14,
                      height: 14,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.white)),
                      child: Text(
                        "${model.orderManager.amountInBasket()}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w900),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Align _buildHeader() {
    return Align(
      alignment: Alignment.topCenter,
      child: Image.asset(
        "assets/images/logo.png",
        filterQuality: FilterQuality.medium,
        height: 180,
      ),
    );
  }
}
