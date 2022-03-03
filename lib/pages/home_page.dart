import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int num = 10;
    String name = "Hii";

    var nameDay = "Monday"; // Accept every value
    const pi = 3.14; // never chnge the value

    // in flutter everything is widget
    return Scaffold(
      // its have header , body, footer
      appBar: AppBar(
        
        title: Text(
          "Demo App",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),



      ),
      body: Center(
        child: Container(
          child: Text("Hii Shakib Mansoori"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
