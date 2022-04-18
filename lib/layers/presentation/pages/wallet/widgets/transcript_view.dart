import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/presentation/pages/wallet/controller/wallet_controller.dart';
import 'package:freeflow/layers/presentation/pages/wallet/util/wallet_util.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/empty_content.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/secondary_filter_menu_widget.dart';
import 'package:freeflow/layers/presentation/widgets/custom_filter_bar_item.dart';
import 'package:freeflow/layers/presentation/widgets/custom_rounded_card.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';

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
  List<TranscriptEntity>? transcriptList;
  late List<String> categoryList;

  @override
  void initState() {
    super.initState();
    getTranscriptList();
  }

  getTranscriptList() async {
    transcriptList = await widget.walletController.getTranscriptList();
    categoryList = WalletUtil.transcriptFilters(context);
  }

  int selectedFilterIndex = 0;
  List<TranscriptEntity> filteredTranscriptList = [];
  String? selectedSecondaryFilter;
  List<String> mainFilters = [];
  List<String> secondaryFilters = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: mdSpacingx2),
      child: Observer(
        builder: (context) {
          if (widget.walletController.trasncriptViewState ==
                  ViewState.loading ||
              transcriptList == null) {
            //TODO: must return a custom loading (FREEF-69)
            return const CustomRoundedCard(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(normalSpacing),
                topRight: Radius.circular(normalSpacing),
              ),
              padding: EdgeInsets.only(top: mdSpacing),
              child: Align(
                alignment: Alignment.topCenter,
                child: LoadingWidget(
                  isLoading: true,
                  color: StandardColors.greyCA,
                  size: 33,
                ),
              ),
            );
          } else if ((transcriptList ?? []).isEmpty) {
            return const CustomRoundedCard(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(normalSpacing),
                topRight: Radius.circular(normalSpacing),
              ),
              padding: EdgeInsets.symmetric(horizontal: mdSpacing),
              child: EmptyContent(),
            );
          }
          return content();
        },
      ),
    );
  }

  void refreshFilterIndex(int indexChild) {
    setState(() {
      selectedFilterIndex = indexChild;
    });
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
            boxShadow: const [],
            margin: EdgeInsets.zero,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children:
                    listFilteredTranscriptWidgets(listFilteredTranscript()),
              ),
            ),
          ),
        )
      ],
    );
  }

  void separatesMainAndSecondaryFilters() {
    if (mainFilters.isEmpty) {
      for (int i = 0; i < categoryList.length; i++) {
        if (i < 2) {
          mainFilters.add(categoryList[i]);
        } else {
          secondaryFilters.add(categoryList[i]);
        }
      }
    }
  }

  Widget getWidgetBar() {
    separatesMainAndSecondaryFilters();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          constraints: BoxConstraints(minWidth: constraints.maxWidth),
          margin: const EdgeInsets.only(top: miniSpacing),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...listMainFilteredTranscriptWidgets(mainFilters),
              SecondaryFilterMenu(
                index: selectedFilterIndex,
                secondarySelectedFilter: selectedSecondaryFilter,
                categoryList: categoryList,
                context: context,
                secondaryFilters: secondaryFilters,
                refresh: refreshFilterIndex,
              )
            ],
          ),
        );
      },
    );
  }

  List<Widget> listFilteredTranscriptWidgets(
    List<TranscriptEntity> transcriptList,
  ) {
    List<Widget> filteredTranscriptsWidgetList;
    filteredTranscriptsWidgetList = transcriptList
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

    return filteredTranscriptsWidgetList.isNotEmpty
        ? filteredTranscriptsWidgetList
        : const [EmptyContent()];
  }

  bool valueHasMatchWithFilterName(value, filterNamekey) =>
      value ==
      TranslationService.translate(
        context,
        'wallet.$filterNamekey',
      );

  List<TranscriptEntity> listFilteredTranscript() {
    filteredTranscriptList.clear();

    for (int i = 0; i < transcriptList!.length; i++) {
      if (valueHasMatchWithFilterName(
        categoryList[selectedFilterIndex],
        'all',
      )) {
        filteredTranscriptList.add(transcriptList![i]);
      }
      if (categoryList[selectedFilterIndex] ==
          WalletUtil.getInternationalizedFilterName(
            context,
            transcriptList![i].category,
          )) {
        filteredTranscriptList.add(transcriptList![i]);
      }
    }

    return filteredTranscriptList;
  }

  List<Widget> listMainFilteredTranscriptWidgets(List<String> mainFilters) {
    return mainFilters.map((filterName) {
      return CustomFilterBarItem(
        tabName: filterName,
        isSelected: selectedFilterIndex ==
            categoryList.indexOf(
              WalletUtil.getInternationalizedFilterName(context, filterName),
            ),
        onTap: () {
          setState(() {
            selectedSecondaryFilter = '';
            selectedFilterIndex = categoryList.indexOf(
              WalletUtil.getInternationalizedFilterName(context, filterName),
            );
          });
        },
      );
    }).toList();
  }
}
