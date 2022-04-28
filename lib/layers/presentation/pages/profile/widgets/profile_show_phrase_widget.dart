import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/helpers/dialog/show_dialog_error.dart';
import 'package:freeflow/layers/presentation/pages/profile/controllers/profile_show_phrase_controller.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';

class ProfileShowPhrase extends StatefulWidget {
  const ProfileShowPhrase({Key? key}) : super(key: key);

  @override
  State<ProfileShowPhrase> createState() => _ProfileShowPhraseState();
}

class _ProfileShowPhraseState extends State<ProfileShowPhrase> with TextThemes {
  final ProfileShowPhraseController controller =
      findProfileShowPhraseController();

  @override
  void initState() {
    super.initState();
    controller.getPrivateKey(
      onError: () => showDialogError(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (controller.loadingIsNotCompleted) {
          return const Center(
            child: LoadingWidget(
              isLoading: true,
              color: StandardColors.greyCA,
              size: 33,
            ),
          );
        } else {
          return Column(
            children: [
              const SizedBox(height: mdSpacingx2),
              textH6(
                context,
                textKey: "profile.pleaseWriteDown",
              ),
              const SizedBox(height: xxlargeSpacing),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 67),
                child: textH6(
                  context,
                  textKey: controller.privateKey!,
                  color: StandardColors.blueLight,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
