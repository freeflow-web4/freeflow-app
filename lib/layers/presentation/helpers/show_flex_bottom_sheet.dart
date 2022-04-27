import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';

Future<T?> showFlexBottomSheet<T>({
  double initHeight = 0.9,
  double maxHeight = 1,
  required BuildContext context,
  required Widget title,
  required Widget content,
  bool bottomSafeArea = true,
  }) {
  return showFlexibleBottomSheet<T?>(
    context: context,
    minHeight: 0,
    initHeight: initHeight,
    maxHeight: maxHeight,
    anchors: [0, initHeight, maxHeight],
    builder: (
      BuildContext context,
      ScrollController scrollController,
      double bottomSheetOffset,
    ) {
      return SafeArea(
        bottom: bottomSafeArea,
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
