import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/presentation/pages/wallet/controller/transcripts/transcripts_widget_controller.dart';
import 'package:freeflow/layers/presentation/pages/wallet/util/wallet_util.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/empty_content.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/secondary_filter_menu_widget.dart';
import 'package:freeflow/layers/presentation/widgets/custom_filter_bar_item.dart';
import 'package:freeflow/layers/presentation/widgets/custom_rounded_card.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';
import 'package:freeflow/layers/presentation/widgets/refresh_loading.dart';
import 'package:freeflow/layers/presentation/widgets/transcript/flower_exchange/flower_exchange_widget.dart';
import 'package:freeflow/layers/presentation/widgets/transcript/gratitude/gratitude_widget.dart';
import 'package:freeflow/layers/presentation/widgets/transcript/interactions/interactions_widget.dart';

class TranscriptView extends StatefulWidget {

  const TranscriptView({Key? key,}) : super(key: key);

  @override
  State<TranscriptView> createState() => _TranscriptViewState();
}

class _TranscriptViewState extends State<TranscriptView> {
  TranscriptsWidgetController controller = TranscriptsWidgetController();

  List<String> categoryList = [];
  int selectedFilterIndex = 0;
  List<TranscriptEntity> filteredTranscriptList = [];
  String? selectedSecondaryFilter;
  List<String> mainFilters = [];
  List<String> secondaryFilters = [];
  final ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    setCategoryList();
    controller.configureTranscripts();
    _scrollController.addListener(() async {
      if(canGetMoreTranscript()){
        await controller.configureMoreTranscripts();
      }
    });
  }

  bool canGetMoreTranscript(){
    return ((_scrollController.offset > _scrollController.position.maxScrollExtent * 0.7)
        && controller.transcriptViewState == ViewState.done
        && !controller.loadingMoreTranscripts
        && controller.hasMoreTranscripts);
  }

  void setCategoryList() {
    Future.delayed(Duration.zero, () {
      setState(() {
        categoryList = WalletUtil.transcriptFilters(context);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: mdSpacingx2),
      child: Observer(
        builder: (context) {
          if ( controller.transcripts.isEmpty && controller.transcriptViewState != ViewState.loading) {
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
            child: RefreshLoading(
              onRefresh: controller.refreshData,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                    children:[
                      if(controller.transcriptViewState == ViewState.loading)...[
                        const Center(
                          child:  LoadingWidget(
                            isLoading: true,
                            color: StandardColors.greyCA,
                            size: 33,
                            padding: EdgeInsets.only(top: mdSpacing),
                          ),
                        )
                      ]else...[
                        ...listFilteredTranscriptWidgets(listFilteredTranscript()),
                      ]
                    ],
                ),
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

  List<Widget> listFilteredTranscriptWidgets(List<TranscriptEntity> transcriptList,) {
    List<Widget> filteredTranscriptsWidgetList;
    filteredTranscriptsWidgetList = transcriptList
        .map((transcript) => getKindOfTranscript(transcript),
    ).toList();

    if(controller.loadingMoreTranscripts){
      filteredTranscriptsWidgetList.add(const Padding(
        padding:  EdgeInsets.only(bottom: 24),
        child: Center(
          child:  LoadingWidget(
            isLoading: true,
            color: StandardColors.greyCA,
            size: 33,
            padding: EdgeInsets.only(top: mdSpacing),
          ),
        ),
      ),);
    }

    return filteredTranscriptsWidgetList.isNotEmpty
        ? filteredTranscriptsWidgetList
        : const [EmptyContent()];
  }

  bool valueHasMatchWithFilterName(value, filterNamekey){
    return value == TranslationService.translate(
      context,
      'wallet.$filterNamekey',
    );
  }


  List<TranscriptEntity> listFilteredTranscript() {
    filteredTranscriptList.clear();

    for (int i = 0; i <  controller.transcripts.length; i++) {
      if (valueHasMatchWithFilterName(
        categoryList[selectedFilterIndex],
        'all',
      )) {
        filteredTranscriptList.add(controller.transcripts[i]);
      }
      if (categoryList[selectedFilterIndex] ==
          WalletUtil.getInternationalizedFilterName(
            context,
            controller.transcripts[i].category,
          )) {
        filteredTranscriptList.add(controller.transcripts[i]);
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

  Widget getKindOfTranscript(TranscriptEntity transcript) {
    switch(transcript.category){
      case 'flower_exchange':
        return  FlowerExchangeWidget(transcriptEntity: transcript,);
      case 'interactions':
        return  InteractionsWidget(transcriptEntity: transcript,);
      case 'network_updates':
      //TODO
      ///WILL BE DONE ON ANOTHER DEMAND
        return Container();
      case 'gratitude':
        return  GratitudeWidget(transcriptEntity: transcript,);
    }
    return Container();
  }
}
