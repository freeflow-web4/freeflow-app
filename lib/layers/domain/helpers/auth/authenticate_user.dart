import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/infra/route/route_response.dart';
import 'package:freeflow/layers/presentation/helpers/show_flex_bottom_sheet.dart';
import 'package:freeflow/layers/presentation/pages/logout/pages/auth/logout_auth_page.dart';

Future<bool> authenticateUser(BuildContext context, {bool canAuthenticateWithBiometric = true}) async {
  final authResult = await showFlexBottomSheet<RouteResponse?>(
    bottomSafeArea: false,
    context: context,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Text().text(context),
      ],
    ),
    content:  LogoutAuthPage(canAuthenticateWithBiometric: canAuthenticateWithBiometric,),
  );
  return authResult?.body ?? false;
}

class _Text with TextThemes {
  Widget text(BuildContext context) {
    return textH6(
      context,
      textKey: 'logout.authTitle',
      isUpperCase: true,
    );
  }
}
