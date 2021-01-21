import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vingames/services/locator.dart';
import 'package:vingames/services/service_navigation.dart';
import 'package:vingames/ui/views/home_page.dart';
import 'package:vingames/utils/router.dart';

void main() async {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kawa na godzine',
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        navigatorKey: locator<NavigationService>().navigationKey,
        onGenerateRoute: generateRoute,
        home: HomePage());
  }
}
