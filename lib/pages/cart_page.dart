import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      appBar: AppBar(
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice.toString()}"
              .text
              .color(context.theme.accentColor)
              .xl5
              .make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not supported yet".text.make()));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor)),
                  child: "Buy".text.white.make())
              .w32(context)
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  final _cart = CartModel();

  CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? " Nothing to show".text.xl2.make().centered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              title: _cart.items[index].name.text.make(),
              trailing: IconButton(
                  onPressed: () {
                    _cart.removeItem(_cart.items[index]);
                    // setState(() {});
                  },
                  icon: Icon(Icons.remove_circle_outline)),
            ),
          );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
