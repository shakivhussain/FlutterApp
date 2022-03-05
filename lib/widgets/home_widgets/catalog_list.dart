import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart_model.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/home_detail_page.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_image.dart';
import 'package:flutter_application_1/widgets/theme/MyThemes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_to_cart.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20),
            shrinkWrap: true,
            itemCount: CatalogModel.products!.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.products![index];
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeDetailPage(catalog: catalog))),
                child: CatalogItem(
                  item: catalog,
                ),
              );
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.products!.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.products![index];
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeDetailPage(catalog: catalog))),
                child: CatalogItem(
                  item: catalog,
                ),
              );
            },
          );
  }
}

class CatalogItem extends StatelessWidget {
  final Item item;

  const CatalogItem({
    Key? key,
    required this.item,
  })  : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // Container
    var children2 = [
      Hero(
          tag: Key(item.id.toString()), child: CatalogImage(image: item.image)),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          item.name.text.bold.lg.color(context.accentColor).make(),
          item.desc.text.color(MyTheme.grey).sm.make(),
          HeightBox(10),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${item.price}".text.bold.xl.make(),
              AddToCart(
                catalog: item,
              )
            ],
          ).pOnly(right: 8)
        ],
      ).p(context.isMobile ? 0 : 16)
      )
    ];
    return VxBox(
            child: context.isMobile
                ? Row(
                    children: children2,
                  )
                : Column(
                    children: children2,
                  ))
        .color(context.cardColor)
        .roundedLg
        .square(150)
        .p8
        .make()
        .py16();
  }
}
