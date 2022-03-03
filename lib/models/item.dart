class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);

  final products = [
    Item("skb01", "iPhone 12 Pro", "Apple iPhone 12 Pro Generation", 120000,
        "x00ac51", "https://picsum.photos/200/300?iphone")
  ];
}
