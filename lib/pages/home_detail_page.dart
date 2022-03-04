import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/theme/MyThemes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamWhite,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.red800.bold.xl4.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluish),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.make())
                .wh(100, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 30,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                width: context.screenWidth,
                color: Colors.white,
                child: Column(
                  children: [
                    catalog.name.text.xl4.bold.color(MyTheme.darkBluish).make(),
                    catalog.desc.text.sm.make(),
                    // catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                    HeightBox(10),
                  ],
                ).p64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
