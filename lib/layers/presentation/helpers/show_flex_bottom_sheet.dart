import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';

showFlexBottomSheet(BuildContext context, Text title, Widget content) {
  return showFlexibleBottomSheet(
    context: context,
    minHeight: 0,
    initHeight: .9,
    maxHeight: 1,
    anchors: [0, 0.9, 1],
    builder: (
      BuildContext context,
      ScrollController scrollController,
      double bottomSheetOffset,
    ) {
      return SafeArea(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: mdSpacing,
              vertical: bottomSheetOffset > 0.9 ? mdSpacingx2 : normalSpacing,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: ListView(
                controller: scrollController,
                children: [
                  Center(
                    child: Container(
                      width: 52,
                      height: 4,
                      decoration: BoxDecoration(
                        color: StandardColors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: normalSpacing),
                  title,
                  const SizedBox(height: normalSpacing),
                  content,
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
