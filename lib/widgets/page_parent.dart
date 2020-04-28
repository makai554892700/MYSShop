import 'package:MYSShop/pages/page_find.dart';
import 'package:MYSShop/pages/page_home.dart';
import 'package:MYSShop/pages/page_mine.dart';
import 'package:MYSShop/pages/page_shop_card.dart';
import 'package:MYSShop/pages/page_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageParent extends StatefulWidget {
  @override
  State createState() {
    return PageParentState();
  }
}

class PageParentState extends State<PageParent> {
  int selectIndex = 0;
  Color baseColor = Color.fromARGB(255, 0, 188, 96);
  List<Widget> pages;
  List<BottomNavigationBarItem> itemList;
  final itemNames = [
    BottomItem(
      '首页',
      'assets/images/bottom_home_active.svg',
      'assets/images/bottom_home.svg',
    ),
    BottomItem(
      '分类',
      'assets/images/bottom_type_active.svg',
      'assets/images/bottom_type.svg',
    ),
    BottomItem(
      '发现',
      'assets/images/bottom_find_active.svg',
      'assets/images/bottom_find.svg',
    ),
    BottomItem(
      '购物车',
      'assets/images/bottom_shop_card_active.svg',
      'assets/images/bottom_shop_card.svg',
    ),
    BottomItem(
      '我的',
      'assets/images/bottom_mine_active.svg',
      'assets/images/bottom_mine.svg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    if (pages == null) {
      pages = [
        HomePage(),
        TypePage(),
        FindPage(),
        ShopCardPage(),
        MinePage(),
      ];
    }
    if (itemList == null) {
      itemList = itemNames
          .map((item) => BottomNavigationBarItem(
              icon: SvgPicture.asset(
                item.normalIcon,
                color: Colors.black54,
                width: 20.0,
                height: 20.0,
              ),
              title: Text(
                item.name,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              activeIcon: SvgPicture.asset(
                item.activeIcon,
                color: baseColor,
                width: 24.0,
                height: 24.0,
              )))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          getPagesWidget(0),
          getPagesWidget(1),
          getPagesWidget(2),
          getPagesWidget(3),
          getPagesWidget(4),
        ],
      ),
      backgroundColor: Colors.blueGrey,
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index) {
          setState(() {
            selectIndex = index;
          });
        },
        iconSize: 24,
        currentIndex: selectIndex,
        fixedColor: baseColor,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget getPagesWidget(int index) {
    return Offstage(
      offstage: selectIndex != index,
      child: TickerMode(
        enabled: selectIndex == index,
        child: pages[index],
      ),
    );
  }
}

class BottomItem {
  String name, activeIcon, normalIcon;

  BottomItem(this.name, this.activeIcon, this.normalIcon);
}
