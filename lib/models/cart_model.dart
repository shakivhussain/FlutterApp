import 'package:flutter_application_1/models/catalog.dart';

class CartModel {
  // Catalog field
  late CatalogModel _catalog;

  // Collection of Ids , store id of each item
  final List<int> _itemIds = [];

  CatalogModel get getCatalog => _catalog;

  set setCatalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price , fold == sum
  num get TotalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add items ids
  void addItem(Item item) {
    _itemIds.add(item.id);
  }

  void removeItem(Item item) {
    _itemIds.remove(item.id);
  }
}
