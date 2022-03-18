import 'package:flutter/material.dart';

const _prototypeHeight = 812.0;
const _prototypeWidth = 375.0;

double getProportionalHeightFromValue(BuildContext context, double value) {
  final height = MediaQuery.of(context).size.height;
  final factor = height / _prototypeHeight;
  return value * factor;
}

double getProporcionalHeightFromFactor(BuildContext context, double factor) {
  final height = MediaQuery.of(context).size.height;
  return height * factor;
}

double getProportionalWidth(BuildContext context, double value) {
  final width = MediaQuery.of(context).size.width;
  final factor = width / _prototypeWidth;
  return value * factor;
}

double getWidthFromFactor(BuildContext context, double factor) {
  final width = MediaQuery.of(context).size.width;
  return width * factor;
}
