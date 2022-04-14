import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class CustomTabBar extends StatelessWidget with TextThemes {
  final List<Widget> tabBarViewList;
  final double? width, height;
  final List<Tab> tabList;
  final Decoration? indicatorDecoration;

  const CustomTabBar({
    Key? key,
    required this.tabBarViewList,
    required this.tabList,
    this.height,
    this.width,
    this.indicatorDecoration, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: DefaultTabController(
        length: tabList.length,
        child: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor:
                  StandardColors.textMediumGrey.withOpacity(0.6),
              labelColor: StandardColors.darkGrey,
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              tabs: tabList,
              indicator: indicatorDecoration,
            ),
            Expanded(
              child: TabBarView(
                children: tabBarViewList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
