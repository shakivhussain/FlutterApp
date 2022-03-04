import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/theme/MyThemes.dart';
import 'package:velocity_x/velocity_x.dart';

class Catalogheader extends StatelessWidget {
  const Catalogheader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.color(context.theme.accentColor).make(),
        "Trending Products".text.xl2.make()
      ],
    );
  }
}
