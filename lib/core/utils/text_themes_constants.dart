import 'package:flutter/cupertino.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

class CustomText {
  static Text overline({
    Color color = StandardColors.backgroundDark,
    required String text,
  }) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        color: color,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
      ),
    );
  }

  static Text caption({
    Color color = StandardColors.backgroundDark,
    required String text,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: .4,
      ),
    );
  }

  static Text button({
    Color color = StandardColors.backgroundDark,
    required String text,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: .25,
      ),
    );
  }

  static Text body2({
    Color color = StandardColors.backgroundDark,
    required String text,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: .25,
      ),
    );
  }

  static Text body1({
    Color color = StandardColors.backgroundDark,
    required String text,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: .5,
      ),
    );
  }

  static Text subtitle2({
    Color color = StandardColors.backgroundDark,
    required String text,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: .1,
      ),
    );
  }

  static Text subtitle1({
    Color color = StandardColors.backgroundDark,
    required String text,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: .15,
      ),
    );
  }

  static Text h6({
    Color color = StandardColors.backgroundDark,
    required String text,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: .15,
      ),
    );
  }

  static Text h5({
    Color color = StandardColors.backgroundDark,
    required String text,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
    );
  }

  static Text h4({
    Color color = StandardColors.backgroundDark,
    required String text,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: .25,
      ),
    );
  }

  static Text h3({
    Color color = StandardColors.backgroundDark,
    required String text,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 48,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
    );
  }

  static Text h2({
    Color color = StandardColors.backgroundDark,
    required String text,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -.5,
      ),
    );
  }

  static Text h1({
    Color color = StandardColors.backgroundDark,
    required String text,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
    );
  }
}
