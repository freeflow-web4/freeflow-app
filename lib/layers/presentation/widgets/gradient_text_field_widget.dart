import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class GradientTextFieldWidget extends StatelessWidget with TextThemes {
  const GradientTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50,
        child: Stack(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Private Key',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Akrobat',
                ),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
            Positioned(
              bottom: 10,
              child: Container(
                height: 2,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  gradient: StandardColors.greenGradient(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
