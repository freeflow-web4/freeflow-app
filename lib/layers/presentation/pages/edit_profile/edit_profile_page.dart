import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

import 'controller/edit_profile_controller.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final editController = findEditProfileController();



  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StandardColors.backgroundDark,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [



        ],
      ),
    );
  }

}
