import 'package:flutter/material.dart';

import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_constants.dart';

class RecoverAccountPage extends StatelessWidget {
  const RecoverAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StandardColors.backgroundDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 104),
          CustomText.overline(text: 'hidddhhh', color: Colors.white),
          SizedBox(height: 32),
          Text(
            'Please tell us your username',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
