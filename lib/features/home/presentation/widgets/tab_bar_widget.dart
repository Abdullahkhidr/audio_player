import 'package:flutter/material.dart';
import 'package:listen_to_me/core/utils/constants.dart';
import 'package:listen_to_me/features/home/presentation/widgets/tab_item.dart';

class TabBarWidget extends StatefulWidget {
  final List<Widget> views;
  const TabBarWidget({super.key, required this.views});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  final List<Widget> tabs = [
    const TabItem(title: 'Songs'),
    const TabItem(title: 'Artists'),
    const TabItem(title: 'Albums'),
    const TabItem(title: 'Playlists'),
    const TabItem(title: 'Folders'),
  ];
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          TabBar(
            padding: kPaddingAll8.copyWith(bottom: 0),
            dividerColor: kTertiaryColor,
            isScrollable: true,
            controller: _tabController,
            tabAlignment: TabAlignment.start,
            tabs: tabs,
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: widget.views,
          )),
        ],
      ),
    );
  }
}
