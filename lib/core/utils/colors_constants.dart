import 'package:flutter/material.dart';

class StandardColors {
  static const Color backgroundDark = Color(0xff000000);
  static const Color disabled = Color(0xffE8E8E8);
  static const Color blueLight = Color(0xff2CB6BE);
  static const Color primary = Color(0xff2D2D2D);
  static const Color secondary = Color(0xff2CB6BE);
  static const Color feedbackError = Color(0xffFF4747);
  static const Color grey = Color(0xffEFEFEF);
  static const Color white = Color(0xFFFCFCFC);
  static const Color whiteCD = Color(0xFFCDCDCD);
  static const Color darkGrey = Color(0xff4f4f4f);
  static const Color greyCA = Color(0xffCACACA);
  static const Color grey69 = Color(0xff696969);
  static const Color grey79 = Color(0xff797D83);
  static const Color error = Color(0xFFFF4747);
  static const Color offWhite = Color(0xFFFCFCFC);
  static const Color borderGrey = Color(0xFFE0E2E2);
  static const Color borderMediumGrey = Color(0xFFCACACA);
  static const Color textMediumGrey = Color(0xFF696969);
  static const Color baseShimmer = Color(0xFFD0D0D0);
  static const Color highlightShimmer = Color(0xFFF2f2f2);

  static Gradient greenGradient() => const LinearGradient(
        colors: [
          Color(0xff2CB6BE),
          Color(0xff2FB6B9),
          Color(0xff39B4AB),
          Color(0xff4AB293),
          Color(0xff60AF72),
          Color(0xff6DAD5F),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
  static Gradient redGradient() => const LinearGradient(
        colors: [
          Color(0xffB82929),
          Color(0xffF27070),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static Gradient greyGradient() => const LinearGradient(
        colors: [
          Color(0xffBDBDBD),
          Color(0xff696969),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static Gradient blackGradient() => LinearGradient(
        colors: [
          const Color(0xffAAAAAA).withOpacity(0.1),
          const Color(0xff000000).withOpacity(0.2),
          const Color(0xffAAAAAA).withOpacity(0.1),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
  static Gradient nullGradient() => const LinearGradient(
        colors: [Color(0xff4f4f4f)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static Gradient purpleBlueGradient() => LinearGradient(
        colors: [
          const Color(0xffDE83E0).withOpacity(0.6),
          const Color(0xff32B4FF).withOpacity(0.6),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );
}
