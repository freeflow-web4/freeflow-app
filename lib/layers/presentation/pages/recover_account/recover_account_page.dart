import 'package:flutter/material.dart';

import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_constants.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';

class RecoverAccountPage extends StatelessWidget {
  const RecoverAccountPage({Key? key}) : super(key: key);

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
            CustomText.h3(
              text: 'Now please tell us your private key.',
              color: Colors.white,
            ),
            const SizedBox(height: 32),
            GradientTextFieldWidget(),
            const SizedBox(height: 148),
          ],
        ),
      ),
    );
  }
}
