import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/flexible_vertical_spacer.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_widget.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';

class LogoutAuthPage extends StatefulWidget {
  const LogoutAuthPage({Key? key}) : super(key: key);

  @override
  State<LogoutAuthPage> createState() => _LogoutAuthPageState();
}

class _LogoutAuthPageState extends State<LogoutAuthPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
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
      ),
    );
  }
}
