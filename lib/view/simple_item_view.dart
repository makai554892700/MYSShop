import 'dart:async';

import 'package:MYSShop/pojo/common_item.dart';
import 'package:MYSShop/utils/view_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleItemView extends StatefulWidget {
  @override
  State createState() {
    return SimpleItemViewState();
  }
}

class SimpleItemViewState extends State<SimpleItemView> {
  SimpleItemViewState({Key? key});
  late CommonItemParent commonItemParent;

  @override
  void initState() {
    commonItemParent = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            "热门推荐",
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
          margin: EdgeInsets.only(
            top: 15.0,
            bottom: 15.0,
          ),
        ),
        Container(
          child: ViewUtils.getItemList(
            context,
            commonItemParent,
            (CommonItem commonItem) {
              print("SecKillListener commonItem=$commonItem");
            },
          ),
          margin: EdgeInsets.only(
            left: 15.0,
            right: 15.0,
          ),
        ),
      ],
    );
  }

  CommonItemParent getData() {
    return CommonItemParent(
      itemType: CommonItemParent.type_item_normal,
      datas: [
        CommonItem(
          gotoType: CommonItem.type_goto_goods,
          itemId: 1,
          imageUrl:
              "https://gw.alicdn.com/bao/uploaded/i1/699882163/O1CN01DMMwz51RqhH0cbp8l_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
          title: "测试商品111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111",
          newPrice: 18.0,
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_goods,
          itemId: 1,
          imageUrl:
              "https://gw.alicdn.com/bao/uploaded/i1/449513896/O1CN01CD85XP1eePYQCGSG9_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
          title: "测试商品22222222222222222222222222222222222222222222222222222222222222",
          newPrice: 11118.0,
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_goods,
          itemId: 1,
          imageUrl:
              "https://gw.alicdn.com/bao/uploaded/i1/TB1d2pjRpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
          title: "测试商品3",
          newPrice: 1118.0,
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_goods,
          itemId: 1,
          imageUrl:
              "https://gw.alicdn.com/bao/uploaded/i3/1664941371/O1CN01ddPJEi1LzxbSSKuQa_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
          title: "测试商品4",
          newPrice: 118.0,
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_goods,
          itemId: 1,
          imageUrl:
              "https://gw.alicdn.com/bao/uploaded/i2/2778883906/O1CN01uZwVKy1eizcWPCFpK_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
          title: "测试商品5",
          newPrice: 318.0,
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_goods,
          itemId: 1,
          imageUrl:
              "https://gw.alicdn.com/bao/uploaded/i1/3424653238/O1CN01tcQb931Zn31ax5bTo_!!3424653238.jpg_290x10000Q75.jpg_.webp",
          title: "测试商品6",
          newPrice: 418.0,
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_goods,
          itemId: 1,
          imageUrl:
              "https://gw.alicdn.com/bao/uploaded/i3/1966697100/O1CN01pBs82H22JqdE9hJPi_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
          title: "测试商品7",
          newPrice: 518.0,
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_goods,
          itemId: 1,
          imageUrl:
              "https://gw.alicdn.com/bao/uploaded/i4/2066946881/O1CN01VC3iJK20hXugRIr2Y_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
          title: "测试商品8",
          newPrice: 618.0,
        ),
      ],
    );
  }

  bool isLoading = false;

  Future<void> loadMore() async {
    print("loadMore.");
    if (!isLoading) {
      isLoading = true;
      setState(() {});
      await Future.delayed(Duration(seconds: 3), () {
        isLoading = false;
        setState(() {
          commonItemParent.datas?.addAll([
            CommonItem(
              gotoType: CommonItem.type_goto_goods,
              itemId: 1,
              imageUrl:
                  "https://gw.alicdn.com/bao/uploaded/i1/699882163/O1CN01DMMwz51RqhH0cbp8l_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
              title: "测试商品1",
              newPrice: 18.0,
            ),
            CommonItem(
              gotoType: CommonItem.type_goto_goods,
              itemId: 1,
              imageUrl:
                  "https://gw.alicdn.com/bao/uploaded/i1/449513896/O1CN01CD85XP1eePYQCGSG9_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
              title: "测试商品2",
              newPrice: 11118.0,
            ),
            CommonItem(
              gotoType: CommonItem.type_goto_goods,
              itemId: 1,
              imageUrl:
                  "https://gw.alicdn.com/bao/uploaded/i1/TB1d2pjRpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
              title: "测试商品3",
              newPrice: 1118.0,
            ),
            CommonItem(
              gotoType: CommonItem.type_goto_goods,
              itemId: 1,
              imageUrl:
                  "https://gw.alicdn.com/bao/uploaded/i3/1664941371/O1CN01ddPJEi1LzxbSSKuQa_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
              title: "测试商品4",
              newPrice: 118.0,
            ),
            CommonItem(
              gotoType: CommonItem.type_goto_goods,
              itemId: 1,
              imageUrl:
                  "https://gw.alicdn.com/bao/uploaded/i2/2778883906/O1CN01uZwVKy1eizcWPCFpK_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
              title: "测试商品5",
              newPrice: 318.0,
            ),
            CommonItem(
              gotoType: CommonItem.type_goto_goods,
              itemId: 1,
              imageUrl:
                  "https://gw.alicdn.com/bao/uploaded/i1/3424653238/O1CN01tcQb931Zn31ax5bTo_!!3424653238.jpg_290x10000Q75.jpg_.webp",
              title: "测试商品6",
              newPrice: 418.0,
            ),
            CommonItem(
              gotoType: CommonItem.type_goto_goods,
              itemId: 1,
              imageUrl:
                  "https://gw.alicdn.com/bao/uploaded/i3/1966697100/O1CN01pBs82H22JqdE9hJPi_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
              title: "测试商品7",
              newPrice: 518.0,
            ),
            CommonItem(
              gotoType: CommonItem.type_goto_goods,
              itemId: 1,
              imageUrl:
                  "https://gw.alicdn.com/bao/uploaded/i4/2066946881/O1CN01VC3iJK20hXugRIr2Y_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
              title: "测试商品8",
              newPrice: 618.0,
            ),
          ]);
        });
      });
    }
  }
}
