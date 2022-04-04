import 'package:flutter/material.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_rounded_card.dart';

class CustomActionCard extends StatelessWidget {
  final double cardHeight, cardWidth;
  final Widget child;
  final Function onTapRighAction, onTapLeftAction;
  final String leftTextAction, rightTextAction;
  const CustomActionCard({
    Key? key,
    required this.cardHeight,
    required this.cardWidth,
    required this.child,
    required this.onTapLeftAction,
    required this.onTapRighAction,
    required this.leftTextAction,
    required this.rightTextAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomRoundedCard(
      height: cardHeight,
      width: cardWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          child,
          Column(
            children: [
              horizontalDivider(),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customActionTextWidget(
                      text: leftTextAction,
                      onTap: onTapLeftAction,
                    ),
                    verticalDivider(),
                    customActionTextWidget(
                      text: rightTextAction,
                      onTap: onTapRighAction,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget horizontalDivider() {
    return const Divider(
      thickness: 1.5,
      color: Color(0xffE0E2E2),
      height: 0,
    );
  }

  Widget verticalDivider() {
    return const VerticalDivider(
      thickness: 1.5,
      width: 0,
      color: Color(0xffE0E2E2),
    );
  }

  Widget customActionTextWidget({required String text, Function? onTap}) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14, color: Color(0xff222222)),
        ),
      ),
    );
  }
}
