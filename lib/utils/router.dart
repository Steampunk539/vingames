import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vingames/ui/views/basket_page.dart';
import 'package:vingames/ui/views/home_page.dart';
import 'package:vingames/ui/views/product_page.dart';
import 'package:vingames/ui/views/payment_page.dart';
import 'package:vingames/utils/statics/route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return _getPageRoute(routeName: settings.name, viewToShow: HomePage());
    case ProductViewRoute:
      return _getPageRoute(routeName: settings.name, viewToShow: ProductPage());
    case BasketViewRoute:
      return _getPageRoute(routeName: settings.name, viewToShow: BasketPage());
    case ThankViewRoute:
      return _getPageRoute(routeName: settings.name, viewToShow: PaymentPage());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}

PageRoute _getPageRouteWithArgs(
    {String routeName, Widget viewToShow, dynamic arguments}) {
  return MaterialPageRoute(
      settings: RouteSettings(name: routeName, arguments: arguments),
      builder: (_) => viewToShow);
}
