import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

class ProfileImageWidget extends StatelessWidget {
  final String? imageUrl;
  final void Function()? onTap;

  const ProfileImageWidget({
    Key? key,
    this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 67,
            backgroundColor: StandardColors.black,
            child: CircleAvatar(
              radius: 64,
              backgroundColor: Colors.grey,
              backgroundImage: imageUrl != null
                  ? NetworkImage(imageUrl!)
                  : const AssetImage(IconsAsset.noProfileImage)
                      as ImageProvider,
            ),
          ),
          Positioned(
            top: 95,
            left: 100,
            child: GestureDetector(
              onTap: onTap,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: StandardColors.black,
                child: CircleAvatar(
                  radius: 13,
                  backgroundColor: StandardColors.white,
                  child: SvgPicture.asset(IconsAsset.replaceProfileImage),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
