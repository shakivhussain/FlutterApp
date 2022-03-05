import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart_model.dart';
import 'package:flutter_application_1/utills/routes.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http ;
import 'package:flutter_application_1/models/catalog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  
  // final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  // OnCreate

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");


 
    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;

    // decode json data
    var decodeData = jsonDecode(catalogJson);
    var products = decodeData["products"];

    CatalogModel.products =
        List.from(products).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;

    // in flutter everything is widget
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        builder: (BuildContext context, store, VxStatus? status) =>
            FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoutes);
          },
          child: const Icon(CupertinoIcons.cart, color: Colors.white),
          backgroundColor: context.theme.buttonColor,
        )
                .badge(
                    color: Colors.red,
                    size: 20,
                    count: _cart.items.length,
                    textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                .p8(),
        mutations: {AddMutation, RemoveMutation},
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Catalogheader(),
              if (CatalogModel.products != null &&
                  CatalogModel.products!.isNotEmpty)
                CatalogList().py12().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
