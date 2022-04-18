import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class ProfileButtonWidget extends StatelessWidget with TextThemes {
  final void Function()? onTap;
  final String title;
  final String icon;

  const ProfileButtonWidget({
    Key? key,
    this.onTap,
    required this.title,
    required this.icon,
  }) : super(key: key);

  bool get isSvgFile => icon.contains(".svg");
  bool get isPinCodeFile => icon.contains("pincode");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: StandardColors.secondary,
            ),
            child: Center(
              child: isSvgFile
                  ? SvgPicture.asset(
                      icon,
                      height: isPinCodeFile ? 10 : 20,
                      width: isPinCodeFile ? 10 : 20,
                    )
                  : Image(
                      image: AssetImage(icon),
                      height: 20,
                      width: 20,
                    ),
            ),
          ),
          const SizedBox(width: normalSpacing),
          textBody2(
            context,
            textKey: title,
            color: StandardColors.lightGrey,
          ),
        ],
      ),
    );
  }
}
