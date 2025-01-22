import 'package:flutter/material.dart';
import 'package:paseeta/core/constant/extensions/mediaquery_extensions.dart';
import 'package:paseeta/core/constant/string_app/string_app.dart';
import 'package:paseeta/core/shared/custom_card.dart';
import 'package:paseeta/presentation/view/widget/details_task/card_rich_text.dart';

class CardInfoFinancialAccounts extends StatelessWidget {
  const CardInfoFinancialAccounts({
    super.key,
    required this.price,
    required this.shipping,
    required this.total,
  });
  final String price;
  final String shipping;
  final String total;

  @override
  Widget build(BuildContext context) {
    return CustomCardGlobal(
        height: context.mediaheight / 4,
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardRichText(title: StringApp.price, value: price),
            CardRichText(title: StringApp.shipping, value: shipping),
            const Divider(),
            CardRichText(title: StringApp.total, value: total),
          ],
        ));
  }
}
