import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utills/routes.dart';
import 'package:flutter_application_1/widgets/theme/MyThemes.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// Most important method, every time call when we refresh the data
  @override
  Widget build(BuildContext context) {
    // bringVegitables(); // method calling

    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner:
          false, // will remove the denug text from the corner side
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoutes, // set custom page
      routes: {
        // "/": (context) => LoginPage(), // default route ( intent )
        MyRoutes.homeRoutes: (context) => HomePage(),
        MyRoutes.loginRoutes: (context) => LoginPage()
      },
    );
  }

  bringVegitables({bool bag = false, int amount = 100}) {
    //
  }
}
