import 'package:acm_hacettepe/week5/future/basket_view.dart';
import 'package:acm_hacettepe/week5/future/photos/view/photos_view.dart';
import 'package:acm_hacettepe/week5/future/tabbar/model/tab_model.dart';
import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget {
  final List<TabModel> tabsItem = [
    TabModel(title: 'Photos', icon: Icons.ac_unit, child: PhotosView()),
    TabModel(
        title: 'Basket', icon: Icons.adb, child: BasketView()),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsItem.length,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: buildTabBar(),
        ),
        body: buildTabBarView(),
      ),
    );
  }

  TabBar buildTabBar() {
    return TabBar(
      tabs: List.generate(
        tabsItem.length,
        (index) => Tab(
          text: tabsItem[index].title,
          icon: Icon(tabsItem[index].icon),
        ),
      ),
    );
  }

  TabBarView buildTabBarView() =>
      TabBarView(children: tabsItem.map((e) => e.child).toList());
}
