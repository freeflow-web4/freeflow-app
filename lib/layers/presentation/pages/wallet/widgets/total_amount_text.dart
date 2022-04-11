import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class TotalAmountText extends StatelessWidget with TextThemes {
  final String totalAmount;
  const TotalAmountText({Key? key, required this.totalAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            totalAmountValueWidget(),
            totalAmountLabelWidget(context),
          ],
        ),
      ),
    );
  }

  Widget totalAmountValueWidget() {
    return RichText(
      text: TextSpan(
        text: totalAmount.toUpperCase(),
        style: textH4TextStyleCustom(StandardColors.darkGrey),
        children: <TextSpan>[
          TextSpan(text: ' FLWR', style: subtitleTextStyle),
        ],
      ),
    );
  }

  Widget totalAmountLabelWidget(BuildContext context) {
    return textSubtitle2(
      context,
      textKey: 'Total amount',
      color: StandardColors.textMediumGrey.withOpacity(0.6),
    );
  }
}
