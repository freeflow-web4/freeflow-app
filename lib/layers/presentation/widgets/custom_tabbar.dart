import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/helpers/dialog/show_dialog_default.dart';

class CustomTabBar extends StatefulWidget {
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
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>  with TextThemes , SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    ///TODO
    ///REMOVE WHEN FEATURE IS AVAILABLE
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        showDialogDefault(
          context,
          automaticallyCloses: true,
          type: DialogType.featureNotAvailable,
          onTap: () {},
        );
        Future.delayed(const Duration(milliseconds: 500), (){
          setState(() {
            _tabController.index = 0;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: DefaultTabController(
        length: widget.tabList.length,
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor:
              StandardColors.textMediumGrey.withOpacity(0.6),
              labelColor: StandardColors.darkGrey,
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              tabs: widget.tabList,
              indicator: widget.indicatorDecoration,
            ),
            Expanded(
              child: TabBarView(
                children: widget.tabBarViewList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
