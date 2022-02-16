import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:freeflow/core/utils/assets_constants.dart';
import '../controller/recover_account_loading_controller.dart';

class RecoverAccountLoadingWidget extends StatefulWidget {
  final RecoverAccountLoadingController recoverAccountController;

  const RecoverAccountLoadingWidget({
    Key? key,
    required this.recoverAccountController,
  }) : super(key: key);

  @override
  _RecoverAccountLoadingWidgetState createState() =>
      _RecoverAccountLoadingWidgetState();
}

class _RecoverAccountLoadingWidgetState
    extends State<RecoverAccountLoadingWidget> {
  @override
  void initState() {
    super.initState();
    widget.recoverAccountController.updateLoadingLogoOpacity();
  }

  bool showLogoWithoutOpacity = true;
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Center(
            child: AnimatedOpacity(
          opacity: widget.recoverAccountController.loadingLogoOpacity,
          duration: const Duration(milliseconds: 300),
          child: AnimatedSwitcher(
            child: widget.recoverAccountController.showLogoLoading1
                ? SvgPicture.asset(
                    IconsAsset.freeflowLogoAnimation1,
                    key: const Key('image1'),
                  )
                : widget.recoverAccountController.showLogoLoading1
                    ? SvgPicture.asset(
                        IconsAsset.freeflowLogoAnimation2,
                        key: const Key('image2'),
                      )
                    : SvgPicture.asset(
                        IconsAsset.freeflowLogoAnimation3,
                        key: const Key('image3'),
                      ),
            duration: const Duration(milliseconds: 500),
          ),
        ));
      },
    );
  }
}
