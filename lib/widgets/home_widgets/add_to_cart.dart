


import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';

// StatefulWidget, bcz it will change the state
class AddToCart extends StatefulWidget {
  final Item catalog;

  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);

    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            isInCart = isInCart.toggle();
            final _catalog = CatalogModel();
            _cart.setCatalog = _catalog;
            _cart.addItem(widget.catalog);

            setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isInCart ? Icon(Icons.done) : Icon(Icons.add_shopping_cart_outlined));
  }
}
