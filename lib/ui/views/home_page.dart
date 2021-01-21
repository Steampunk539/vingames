import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vingames/buisness_logic/models/product.dart';
import 'package:vingames/buisness_logic/view_models/home_viewmodel.dart';
import 'package:vingames/ui/components/centered_view.dart';
import 'package:vingames/utils/statics/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            backgroundColor: color_bg,
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildHeader(),
                  buildUpperBar(model),
                  CenteredView(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: buildLeftMainMenu(),
                        ),
                        Expanded(flex: 3, child: buildMiddlePart(model)),
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 400,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                            width: double.infinity,
                            margin:
                                EdgeInsets.only(top: 24, left: 16, right: 16),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildMiddlePart(HomeViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 24),
            height: 60,
            width: double.infinity,
            color: color_nav_bar,
            child: Text(
              "Bestsellery",
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
          Container(
            width: double.infinity,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: model.orderManager.allProducts.length,
                itemBuilder: (context, i) {
                  Product product = model.orderManager.allProducts[i];
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
                                ),
                                Text(
                                  product.shortDesc,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  product.desc,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${product.price} zł",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 24),
                                onPressed: () {
                                  model.addToBasket(product);
                                },
                                color: color_secondary,
                                child: Text(
                                  "Dodaj do\n koszyka",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget buildLeftMainMenu() {
    return Container(
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.only(right: 16),
      decoration:
          BoxDecoration(border: Border(right: BorderSide(color: Colors.white))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Gry",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Text(
              "Akcji",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Text(
              "RPG",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Text(
              "MMO",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Winyle",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Text(
              "Rock",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Text(
              "Pop",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Text(
              "Rap",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Container buildUpperBar(HomeViewModel model) {
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
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                filterQuality: FilterQuality.medium,
                height: 50,
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
                  onPressed: model.goToBasketPage,
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
