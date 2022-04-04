import 'package:flutter/material.dart';

class TotalAmountText extends StatelessWidget {
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
            totalAmountLabelWidget(),
          ],
        ),
      ),
    );
  }

  Widget totalAmountValueWidget() {
    return RichText(
      text: TextSpan(
        text: totalAmount.toUpperCase(),
        style: const TextStyle(
          fontSize: 38,
          color: Color(0xff222222),
        ),
        children: const <TextSpan>[
          TextSpan(
            text: ' FLWR',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff222222),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget totalAmountLabelWidget() {
    return const Text(
      'Total amount',
      style: TextStyle(fontSize: 14, color: Color(0xff797D83)),
    );
  }
}
