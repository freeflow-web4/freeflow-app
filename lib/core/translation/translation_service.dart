import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class TranslationService {
  static String translate(BuildContext context, String key) {
    return FlutterI18n.translate(context, key);
  }
}
