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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.theme.canvasColor,
      bottomNavigationBar: Container(
        color: context.theme.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.red800.bold.xl4.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(context.theme.buttonColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add To Cart".text.make())
                .wh(150, 50)
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
                color: context.theme.cardColor,
                child: Column(
                  children: [
                    catalog.name.text.xl4.bold
                        .color(context.theme.accentColor)
                        .make(),
                    catalog.desc.text.color(MyTheme.grey).lg.make(),
                    // catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                    HeightBox(10),

                    "Raven his more visiter at came spoken nevermore, sitting other hath on he still. More was or still sitting. This pallid this bird evilprophet evermore. Spoken midnight my my flutter yet that thy once i, felt echo ominous with sought, and repeating see disaster the the me and my, more."
                        .text
                        .sm
                        .color(MyTheme.grey)
                        .make()
                        .p16()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
