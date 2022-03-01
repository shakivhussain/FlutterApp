import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// Most important method, every time call when we refresh the data
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Text("Welcome"),
      ),
    );
  }
}
