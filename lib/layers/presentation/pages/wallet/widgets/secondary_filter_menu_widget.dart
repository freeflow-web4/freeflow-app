import 'package:flutter/material.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/helpers/dialog/show_dialog_default.dart';
import 'package:freeflow/layers/presentation/widgets/custom_bottom_sheet.dart';
import 'package:freeflow/layers/presentation/widgets/custom_radio_tile_button.dart';
import 'package:freeflow/layers/presentation/widgets/circular_gradient_icon_button.dart';

class SecondaryFilterMenu extends StatefulWidget {
  final int index;
  final String? secondarySelectedFilter;
  final BuildContext context;
  final List<String> categoryList;
  final Function refresh;
  final List<String> secondaryFilters;
  const SecondaryFilterMenu({
    Key? key,
    required this.index,
    required this.secondarySelectedFilter,
    required this.categoryList,
    required this.context,
    required this.secondaryFilters,
    required this.refresh,
  }) : super(key: key);

  @override
  State<SecondaryFilterMenu> createState() => _SecondaryFilterMenuState();
}

class _SecondaryFilterMenuState extends State<SecondaryFilterMenu>
    with TextThemes {
  String? secondarySelectedFilter = '';

  @override
  Widget build(BuildContext context) {
    return CircularGradientIconButton(
      child: Icon(
        Icons.add_rounded,
        color: StandardColors.textMediumGrey.withOpacity(0.6),
      ),
      isSelected: widget.index > 1,
      onTap: () {
        showSecondaryFiltersMenu();
      },
    );
  }

  void showSecondaryFiltersMenu() {
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
          builder: (BuildContext context, StateSetter setBottomSheetState) {
            return CustomBottomSheet(
              children: [
                textSubtitle(context, textKey: 'wallet.otherTranscripts'),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: listSecondaryFilteredTranscriptWidgets(
                    categoryList: widget.categoryList,
                    notifyParent: widget.refresh,
                    secondaryFilters: widget.secondaryFilters,
                    setBottomSheetState: setBottomSheetState,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  List<Widget> listSecondaryFilteredTranscriptWidgets({
    required List<String> categoryList,
    required Function notifyParent,
    required List<String> secondaryFilters,
    required StateSetter setBottomSheetState,
  }) {
    return secondaryFilters
        .map<Widget>(
          (filterName) => CustomRadioTile<String?>(
            value: filterName,
            groupValue: secondarySelectedFilter,
            onChanged: (value) {
              updateSecondaryFilters(
                value: value,
                setBottomSheetState: setBottomSheetState,
                categoryList: categoryList,
                index: widget.index,
                notifyParent: notifyParent,
              );
            },
            label: filterName,
          ),
        )
        .toList();
  }

  void updateSecondaryFilters({
    required int index,
    required String? value,
    required StateSetter setBottomSheetState,
    required Function notifyParent,
    required List<String> categoryList,
  }) {
    setBottomSheetState(() {
      if (valueHasMatchWithFilterName(value, 'clearSelection', context)) {
        secondarySelectedFilter = '';
      } else if (valueHasMatchWithFilterName(
        value,
        'networkUpdates',
        context,
      )) {
        showDialogFeatureNotAvailable();
      } else {
        secondarySelectedFilter = value;
      }
    });

    if (valueHasMatchWithFilterName(value, 'clearSelection', context)) {
      index = 0;
    } else if (valueHasMatchWithFilterName(value, 'networkUpdates', context)) {
      showDialogFeatureNotAvailable();
    } else {
      index = categoryList.indexOf(value!);
    }
    notifyParent(index);

    Navigator.pop(context);
  }

  bool valueHasMatchWithFilterName(
    value,
    filterNamekey,
    BuildContext context,
  ) =>
      value ==
      TranslationService.translate(
        context,
        'wallet.$filterNamekey',
      );

  Future<void> showDialogFeatureNotAvailable() async {

    await showDialogDefault(
      context,
      type: DialogType.featureNotAvailable,
      onTap: () {},
    );
  }
}
