import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_wiget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyItems = List.generate(50, (index) => CatalogModel.products[0]);

    // in flutter everything is widget
    return Scaffold(
      // its have header , body, footer
      appBar: AppBar(
        title: Text("Demo App"),
      ),
      // builder will give you the recycler view, seprator
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyItems.length,
          // will display the items in list
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyItems[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
