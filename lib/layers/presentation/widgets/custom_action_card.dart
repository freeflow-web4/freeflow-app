import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/widgets/custom_rounded_card.dart';

class CustomActionCard extends StatelessWidget with TextThemes {
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
                      context,
                      text: leftTextAction,
                      onTap: onTapLeftAction,
                    ),
                    verticalDivider(),
                    customActionTextWidget(
                      context,
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
      color: StandardColors.borderGrey,
      height: 0,
    );
  }

  Widget verticalDivider() {
    return const VerticalDivider(
      thickness: 1.5,
      width: 0,
      color: StandardColors.borderGrey,
    );
  }

  Widget customActionTextWidget(
    BuildContext context, {
    required String text,
    Function? onTap,
  }) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: normalSpacing),
        child: textSubtitle2(
          context,
          textKey: text,
          color: StandardColors.darkGrey,
        ),
      ),
    );
  }
}
