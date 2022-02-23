import 'package:flutter/material.dart';

class StandardColors {
  static const Color backgroundDark = Color(0xff000000);
  static const Color disabled = Color(0xffE8E8E8);
  static const Color blueLight = Color(0xff2CB6BE);

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
}
