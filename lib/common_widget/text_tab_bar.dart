import 'package:flutter/material.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/color_utils.dart';

class TextTabBar extends StatefulWidget {
  final List<String>? tabs;
  final Function(int)? onTabChange;
  final TabController? controller;
  final bool? isScrollable;
  final TabAlignment? tabAlignment;
  final EdgeInsetsGeometry? padding;
  const TextTabBar({super.key,
    this.tabs,
    this.onTabChange,
    this.controller,
    this.isScrollable,
    this.tabAlignment,
    this.padding,
  });

  @override
  State<TextTabBar> createState() => _TextTabBarState();
}

class _TextTabBarState extends State<TextTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = widget.controller ??
        TabController(length: widget.tabs?.length ?? 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: widget.onTabChange,
      dividerColor: ColorUtils.grey300,
      isScrollable: widget.isScrollable ?? true,
      tabAlignment: widget.tabAlignment,
      indicatorPadding: const EdgeInsets.all(0),
      padding: widget.padding?? EdgeInsets.zero,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorUtils.baseColor,
            width: 2,
          ),
        ),
      ),
      labelColor: ColorUtils.baseColor,
      unselectedLabelColor: ColorUtils.grey,
      labelStyle: TextStyle(
        fontSize: TextSize.font16(context),
        fontWeight: FontWeight.w500,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      controller: _tabController,
      tabs: widget.tabs
          ?.map((e) => Tab(
        text: e,
      ))
          .toList() ??
          [],
    );
  }
}
