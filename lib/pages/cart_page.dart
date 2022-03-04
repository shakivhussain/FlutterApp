import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/theme/MyThemes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamWhite,
      appBar: AppBar(
        title: "Cart".text.make(),
      ),
    );
  }
}
