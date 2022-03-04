import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.red,
        cardColor: Colors.white,
        buttonColor: darkBluish,
        accentColor: darkBluish,
        canvasColor: creamWhite,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6,
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        buttonColor: lightBluish,
        accentColor: Vx.white,
        canvasColor: darkCreamWhite,
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          
         
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      );

  static Color creamWhite = const Color(0xfff5f5f5);
  static Color darkCreamWhite = Vx.gray900;
  static Color lightBluish = Vx.indigo500;
  static Color darkBluish = const Color(0xff403b58);
  static Color grey = Vx.gray400;
}
