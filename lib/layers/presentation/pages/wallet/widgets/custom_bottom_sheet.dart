import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class CustomBottomSheet extends StatefulWidget {
  final Widget child;
  const CustomBottomSheet({Key? key, required this.child}) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> with TextThemes{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 52,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: const BoxDecoration(
              color: StandardColors.darkGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          textSubtitle(context, textKey: 'OTHER TRANSCRIPTS'),
          widget.child
        ],
      ),
    );
  }
}
