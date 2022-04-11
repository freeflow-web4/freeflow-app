import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/presentation/pages/wallet/controller/wallet_controller.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_bottom_sheet.dart';
import 'package:freeflow/layers/presentation/widgets/custom_filter_bar_item.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_radio_tile_button.dart';
import 'package:freeflow/layers/presentation/widgets/custom_rounded_card.dart';
import 'package:freeflow/layers/presentation/widgets/circular_gradient_icon_button.dart';

import '../../../../../core/translation/translation_service.dart';

class TranscriptView extends StatefulWidget {
  final WalletController walletController;
  const TranscriptView({
    Key? key,
    required this.walletController,
  }) : super(key: key);

  @override
  State<TranscriptView> createState() => _TranscriptViewState();
}

class _TranscriptViewState extends State<TranscriptView> {
  late List<TranscriptEntity> transcriptList;
  late List<String> categoryList;

  @override
  void initState() {
    getTranscriptList();
    super.initState();
  }

  getTranscriptList() async {
    transcriptList = await widget.walletController.getTranscriptList();
    categoryList =
        widget.walletController.getCategoryList(context, transcriptList);
  }

  int index = 0;
  List<TranscriptEntity> transcriptFilteredList = [];
  String? secondarySelectedFilter;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: mdSpacingx2),
          child: widget.walletController.viewState == ViewState.loading
              ? loadingWidget()
              : content(),
        );
      },
    );
  }

  Widget content() {
    return Column(
      children: [
        getWidgetBar(),
        const SizedBox(
          height: normalSpacing,
        ),
        Expanded(
          child: CustomRoundedCard(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(normalSpacing),
              topRight: Radius.circular(normalSpacing),
            ),
            margin: EdgeInsets.zero,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: listFilteredTranscriptsWidget(),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget loadingWidget() {
    //TODO: must return a custom loading (FREEF-69)
    return const Center(
      child: SizedBox(
        height: bigSpacing,
        child: CircularProgressIndicator(),
      ),
    );
  }

  List<Widget> listFilteredTranscriptsWidget() {
    List<Widget> filteredTranscriptsWidgetList;
    transcriptFilteredList.clear();

    for (int i = 0; i < transcriptList.length; i++) {
      if (valueHasMatchWithFilterName(categoryList[index], 'all')) {
        transcriptFilteredList.add(transcriptList[i]);
      }
      if (categoryList[index] ==
          widget.walletController
              .getinternationalizedFilterName(context, transcriptList[i].category)) {
        transcriptFilteredList.add(transcriptList[i]);
      }
    }
    filteredTranscriptsWidgetList = transcriptFilteredList
        .map(
          (transcript) =>
              //TODO: must return an operation card (FREEF-85)
              Container(
            height: 100,
            width: double.infinity,
            margin: const EdgeInsets.all(smSpacing),
            color: const Color.fromARGB(255, 236, 236, 236),
            child: Text('${transcript.category} - (FREEF-85)'),
          ),
        )
        .toList();

    return filteredTranscriptsWidgetList;
  }

  Widget getWidgetBar() {
    List mainFilters = [];
    List<String> secondaryFilters = [];
    for (int i = 0; i < categoryList.length; i++) {
      if (i < 2) {
        mainFilters.add(categoryList[i]);
      } else {
        secondaryFilters.add(categoryList[i]);
      }
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          constraints: BoxConstraints(minWidth: constraints.maxWidth),
          margin: const EdgeInsets.only(top: normalSpacing),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...mainFilterWidgetList(mainFilters),
              secondaryFilterWidgetMenu(secondaryFilters: secondaryFilters)
            ],
          ),
        );
      },
    );
  }

  List<Widget> mainFilterWidgetList(List mainFilters) {
    return mainFilters.map((e) {
      return CustomFilterBarItem(
        tabName: e,
        isSelected: index ==
            categoryList
                .indexOf(widget.walletController.getinternationalizedFilterName(context, e)),
        onTap: () {
          setState(() {
            secondarySelectedFilter = '';
            index = categoryList
                .indexOf(widget.walletController.getinternationalizedFilterName(context, e));
          });
        },
      );
    }).toList();
  }

  Widget secondaryFilterWidgetMenu({required List<String> secondaryFilters}) {
    return CircularGradientIconButton(
      child: Icon(
        Icons.add_rounded,
        color: StandardColors.textMediumGrey.withOpacity(0.6),
      ),
      isSelected: index > 1,
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(normalSpacing),
              topRight: Radius.circular(normalSpacing),
            ),
          ),
          barrierColor: StandardColors.darkGrey.withOpacity(0.7),
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setBottomSheetState) {
                return CustomBottomSheet(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: secondaryFilters
                        .map(
                          (e) => CustomRadioTile<String?>(
                            value: e,
                            groupValue: secondarySelectedFilter,
                            onChanged: (value) {
                              updateSecondaryFilters(
                                value: value,
                                setBottomSheetState: setBottomSheetState,
                              );
                            },
                            label: e,
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  bool valueHasMatchWithFilterName(value, filterNamekey) =>
      value ==
      TranslationService.translate(
        context,
        'wallet.$filterNamekey',
      );

  void updateSecondaryFilters({
    required String? value,
    required StateSetter setBottomSheetState,
  }) {
    setBottomSheetState(() {
      if (valueHasMatchWithFilterName(value, 'clearSelection')) {
        secondarySelectedFilter = '';
      } else if (valueHasMatchWithFilterName(value, 'networkUpdates')) {
        showNetworkStatusDialog();
      } else {
        secondarySelectedFilter = value;
      }
    });
    setState(() {
      if (valueHasMatchWithFilterName(value, 'clearSelection')) {
        index = 0;
      } else if (valueHasMatchWithFilterName(value, 'networkUpdates')) {
        showNetworkStatusDialog();
      } else {
        index = categoryList.indexOf(value!);
      }
    });

    Navigator.pop(context);
  }

  showNetworkStatusDialog() {
    //TODO: Must return a network status dialog (FREEF-70)
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: SizedBox(
          height: 200,
          width: 200,
          child: Text('será feito na FREEF-70'),
        ),
      ),
    );
  }
}
