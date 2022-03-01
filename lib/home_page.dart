import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int num = 10;
    String name = "Hii";

    var nameDay = "Monday"; // Accept every value
    const pi = 3.14; // never chnge the value
    
    return Material(
      child: Center(
        child: Container(
          child: Text("Hii Shakib Mansoori"),
        ),
      ),
    );
  }
}
