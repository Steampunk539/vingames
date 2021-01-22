import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vingames/buisness_logic/view_models/payment_viewmodel.dart';
import 'package:vingames/ui/components/centered_view.dart';
import 'package:vingames/utils/statics/colors.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PaymentViewModel>(
      create: (context) => PaymentViewModel(),
      child: Consumer<PaymentViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: color_bg,
          body: SingleChildScrollView(
            child: Column(children: [
              _buildHeader(),
              buildUpperBar(model),
              SizedBox(
                height: 60,
              ),
              Center(
                child: Text(
                  "PŁATNOŚĆ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 56,
                      fontWeight: FontWeight.bold),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Container buildUpperBar(PaymentViewModel model) {
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
