import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_wiget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // OnCreate
  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");

    // decode json data
    var decodeData = jsonDecode(catalogJson);
    var products = decodeData["products"];

    CatalogModel.products =
        List.from(products).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyItems = List.generate(50, (index) => CatalogModel.products[0]);

    // in flutter everything is widget
    return Scaffold(
      // its have header , body, footer
      appBar: AppBar(
        title: Text("Demo App"),
      ),
      // builder will give you the recycler view, seprator
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            (CatalogModel.products != null && CatalogModel.products!.isNotEmpty)
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16),
                    itemBuilder: (context, index) {
                      final item = CatalogModel.products![index];
                      return Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: GridTile(
                              header: Container(
                                  child: Text(
                                    item.name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                  )),
                              footer: Container(
                                  child: Text(
                                    item.price.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  )),
                              child: Image.network(item.image)));
                    },
                    itemCount: CatalogModel.products!.length,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
      drawer: MyDrawer(),
    );
  }
}
