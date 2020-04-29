import 'package:MYSShop/pojo/type_item_left.dart';
import 'package:MYSShop/pojo/type_item_right.dart';
import 'package:MYSShop/view/search_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TypePage extends StatefulWidget {
  @override
  State createState() {
    return TypePageState();
  }
}

class TypePageState extends State<TypePage> {
  int leftCheck = 0;
  List<TypeItemLeft> leftItems;
  Map<int, TypeItemRight> rightItems;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SearchView(),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: leftItems.length,
                    itemBuilder: (BuildContext buildContext, int index) {
                      if (index == leftCheck) {}
                      return Text(leftItems[index].itemName);
                    },
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.white,
                    child: ListView(
                      children: getRightBody(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getRightBody() {
    List<Widget> result = List();
    for (int i = 0; i < 10; i++) {
      result.add(Text("rightItem$i"));
    }
    return result;
  }

  @override
  void initState() {
    leftItems = [
      TypeItemLeft(id: 1, itemName: "推荐分类"),
      TypeItemLeft(id: 2, itemName: "京东超市"),
      TypeItemLeft(id: 3, itemName: "国际名牌"),
      TypeItemLeft(id: 4, itemName: "奢侈品"),
      TypeItemLeft(id: 5, itemName: "京东国际"),
      TypeItemLeft(id: 6, itemName: "唯品会"),
      TypeItemLeft(id: 7, itemName: "男装"),
      TypeItemLeft(id: 8, itemName: "女装"),
      TypeItemLeft(id: 9, itemName: "男鞋"),
      TypeItemLeft(id: 10, itemName: "女鞋"),
      TypeItemLeft(id: 11, itemName: "内衣配饰"),
      TypeItemLeft(id: 12, itemName: "箱包手袋"),
      TypeItemLeft(id: 13, itemName: "美妆护肤"),
      TypeItemLeft(id: 14, itemName: "推荐分类"),
      TypeItemLeft(id: 15, itemName: "推荐分类"),
      TypeItemLeft(id: 16, itemName: "推荐分类"),
      TypeItemLeft(id: 17, itemName: "推荐分类"),
      TypeItemLeft(id: 18, itemName: "推荐分类"),
      TypeItemLeft(id: 19, itemName: "推荐分类"),
      TypeItemLeft(id: 21, itemName: "推荐分类"),
      TypeItemLeft(id: 22, itemName: "推荐分类"),
      TypeItemLeft(id: 23, itemName: "推荐分类"),
      TypeItemLeft(id: 24, itemName: "推荐分类"),
      TypeItemLeft(id: 25, itemName: "推荐分类"),
      TypeItemLeft(id: 26, itemName: "推荐分类"),
      TypeItemLeft(id: 27, itemName: "推荐分类"),
      TypeItemLeft(id: 28, itemName: "推荐分类"),
      TypeItemLeft(id: 29, itemName: "推荐分类"),
      TypeItemLeft(id: 31, itemName: "推荐分类"),
      TypeItemLeft(id: 32, itemName: "推荐分类"),
      TypeItemLeft(id: 33, itemName: "推荐分类"),
      TypeItemLeft(id: 34, itemName: "推荐分类"),
      TypeItemLeft(id: 35, itemName: "推荐分类"),
      TypeItemLeft(id: 36, itemName: "推荐分类"),
      TypeItemLeft(id: 37, itemName: "推荐分类"),
      TypeItemLeft(id: 38, itemName: "推荐分类"),
      TypeItemLeft(id: 39, itemName: "推荐分类"),
    ];
    rightItems = {1: TypeItemRight()};
    super.initState();
  }
}
