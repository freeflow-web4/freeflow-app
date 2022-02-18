import 'package:flutter/material.dart';

import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';

class RecoverAccountPage extends StatelessWidget with TextThemes {
  RecoverAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StandardColors.backgroundDark,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 104),
            textH4(
              context,
              text: 'Hello,',
              color: Colors.white,
              maxLines: 2,
            ),
            const SizedBox(height: 32),
            textH4(
              context,
              text: 'Please tell us your username.',
              color: Colors.white,
              maxLines: 2,
            ),
            const SizedBox(height: 32),
            GradientTextFieldWidget(),
          ],
        ),
      ),
    );
  }
}
