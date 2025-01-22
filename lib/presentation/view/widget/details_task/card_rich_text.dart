import 'package:flutter/widgets.dart';
import 'package:paseeta/core/theme/color_app.dart';
import 'package:paseeta/core/theme/textstayle_app.dart';

class CardRichText extends StatelessWidget {
  const CardRichText({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "$title : ",
          style: TextstyleApp.white25blod.copyWith(color: ColorApp.primary),
          children: [
            TextSpan(
              text: value,
              style: TextstyleApp.black18.copyWith(fontWeight: FontWeight.bold),
            ),
          ]),
    ]));
  }
}
