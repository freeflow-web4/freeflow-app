import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

class IconMenu extends StatelessWidget {
  final String urlIcon;
  final void Function() onTap;
  final double iconPadding;
  final double iconSize;
  final bool hasBottomDivisor;

   const IconMenu({Key? key,
    required this.urlIcon,
    required this.onTap,
    this.hasBottomDivisor = true,
    required this.iconPadding,
    required this.iconSize,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            onTap:  onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: iconPadding,horizontal: iconPadding),
              child: Image.asset(
                urlIcon,
                height: iconSize,
                width: iconSize,
              ),
            ),
          ),
        ),
        if(hasBottomDivisor == true)...[
          Container(
            height: 2,
            width: 48,
            color: StandardColors.white,
          )
        ]
      ],
    );
  }

}
