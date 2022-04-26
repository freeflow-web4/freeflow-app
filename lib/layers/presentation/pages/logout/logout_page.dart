import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/adaptative_size.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/layers/presentation/widgets/animated_arrow_right_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/flexible_vertical_spacer.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_widget.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: getProportionalHeightFromValue(context, mdSpacing)),
        const GradientTextFieldWidget(
          //TODO: add controller here
          isFieldValid: true,
        ),
        SizedBox(
          height: getProportionalHeightFromValue(context, mdSpacing),
        ),
        const LoadingWidget(
          //TODO: add controller here
          isLoading: true,
        ),
        SizedBox(height: getProportionalHeightFromValue(context, mdSpacing)),
        const InAppKeyboardWidget(
          //TODO: confirm color
          textColor: Colors.black,
        ),
        SizedBox(
          height: getProportionalHeightFromValue(context, huge4Spacing),
        ),
        AnimatedFloatButtonWidget(
          icon: IconsAsset.arrowIcon,
          onTap: (activated) {
            //TODO: add controller here
          },
        ),
        SizedBox(height: getProportionalHeightFromValue(context, bigSpacing)),
      ],
    );
  }
}
