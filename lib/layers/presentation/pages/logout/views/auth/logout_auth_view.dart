import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/flexible_vertical_spacer.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_widget.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';

class LogoutAuthView extends StatefulWidget {
  const LogoutAuthView({Key? key}) : super(key: key);

  @override
  State<LogoutAuthView> createState() => _LogoutAuthViewState();
}

class _LogoutAuthViewState extends State<LogoutAuthView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const FlexibleVerticalSpacer(height: mdSpacing),
        const GradientTextFieldWidget(
          //TODO: add controller here
          isFieldValid: true,
        ),
        const FlexibleVerticalSpacer(height: mdSpacing),
        const LoadingWidget(
          //TODO: add controller here
          isLoading: true,
        ),
        const FlexibleVerticalSpacer(height: mdSpacing),
        const InAppKeyboardWidget(
          //TODO: confirm color
          textColor: Colors.black,
        ),
        const FlexibleVerticalSpacer(height: huge4Spacing),
        AnimatedFloatButtonWidget(
          icon: IconsAsset.arrowIcon,
          onTap: (activated) {
            //TODO: add controller here
          },
        ),
        const FlexibleVerticalSpacer(height: bigSpacing),
      ],
    );
  }
}
