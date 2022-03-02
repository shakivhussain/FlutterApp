import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';

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
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/home", // set custom page
      routes: {
        "/": (context) => LoginPage(), // default route ( intent )
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage()
      },
    );
  }

  bringVegitables({bool bag = false, int amount = 100}) {
    //
  }
}
