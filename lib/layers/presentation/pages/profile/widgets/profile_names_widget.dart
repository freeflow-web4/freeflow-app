import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class ProfileNamesWidget extends StatelessWidget with TextThemes {
  final String fullname;
  final String username;

  const ProfileNamesWidget({
    Key? key,
    required this.fullname,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: bigSpacing),
      child: Column(
        children: [
          textButton(
            context,
            textKey: fullname,
            maxLines: 2,
          ),
          const SizedBox(height: smSpacing),
          textBody4(
            context,
            textKey: '$username.flw',
            maxLines: 1,
            color: StandardColors.lightGrey,
          ),
        ],
      ),
    );
  }
}
