import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

class GradientTextFieldWidget extends StatelessWidget {
  const GradientTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        margin: const EdgeInsets.all(10.0),
        child: Stack(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Private Key',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
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
