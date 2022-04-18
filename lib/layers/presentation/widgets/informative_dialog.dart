import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/routes/routes.dart';

class InformativeDialog extends StatefulWidget {
  final String icon;
  final String title;

  const InformativeDialog({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  State<InformativeDialog> createState() => _InformativeDialogState();
}

class _InformativeDialogState extends State<InformativeDialog> with TextThemes {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Routes.instance.pop();
    });
  }

  bool get isSvgFile => widget.icon.contains(".svg");

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        width: 231,
        height: 231,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: bigSpacing,
        ),
        decoration: BoxDecoration(
          color: StandardColors.black.withOpacity(.9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isSvgFile
                ? SvgPicture.asset(
                    widget.icon,
                    height: 60,
                    width: 60,
                  )
                : Image(image: AssetImage(widget.icon)),
            const SizedBox(height: mdSpacing),
            textH6(
              context,
              textAlign: TextAlign.center,
              textKey: widget.title,
              color: StandardColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
