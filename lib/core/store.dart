import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/cart_model.dart';
import 'package:flutter_application_1/models/catalog.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.setCatalog = catalog;
  }
}
