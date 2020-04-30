import 'package:MYSShop/pojo/common_item.dart';
import 'package:MYSShop/utils/view_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecKillView extends StatefulWidget {
  @override
  State createState() {
    return SecKillViewState();
  }
}

class SecKillViewState extends State<SecKillView> {
  CommonItemParent commonItemParent;

  @override
  void initState() {
    commonItemParent = getData();
    super.initState();
  }

  int secKillTime = 1000;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.only(
                      right: 15.0,
                      top: 5.0,
                      bottom: 5.0,
                    ),
                    child: Text(
                      "查看更多>>",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 15.0,
                      top: 5.0,
                      bottom: 5.0,
                    ),
                    child: Text(
                      "秒杀",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 140.0,
            child: ViewUtils.getItemList(
              context,
              commonItemParent,
              (CommonItem commonItem) {
                print("SecKillListener commonItem=$commonItem");
              },
            ),
          ),
        ],
      ),
    );
  }

  CommonItemParent getData() {
    return CommonItemParent(
      itemType: CommonItemParent.type_item_secKill,
      datas: [
        CommonItem(
          gotoType: CommonItem.type_goto_goods,
          itemId: 1,
          imageUrl:
              "https://gw.alicdn.com/bao/uploaded/i1/699882163/O1CN01DMMwz51RqhH0cbp8l_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
          title: "测试商品1",
          newPrice: 18.0,
          oldPrice: 28.0,
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_goods,
          itemId: 1,
          imageUrl:
              "https://gw.alicdn.com/bao/uploaded/i1/449513896/O1CN01CD85XP1eePYQCGSG9_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
          title: "测试商品2",
          newPrice: 11118.0,
          oldPrice: 11128.0,
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_goods,
          itemId: 1,
          imageUrl:
              "https://gw.alicdn.com/bao/uploaded/i1/TB1d2pjRpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
          title: "测试商品3",
          newPrice: 1118.0,
          oldPrice: 1128.0,
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_goods,
          itemId: 1,
          imageUrl:
              "https://gw.alicdn.com/bao/uploaded/i3/1664941371/O1CN01ddPJEi1LzxbSSKuQa_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
          title: "测试商品4",
          newPrice: 118.0,
          oldPrice: 128.0,
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_goods,
          itemId: 1,
          imageUrl:
              "https://gw.alicdn.com/bao/uploaded/i2/2778883906/O1CN01uZwVKy1eizcWPCFpK_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
          title: "测试商品5",
          newPrice: 318.0,
          oldPrice: 328.0,
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_goods,
          itemId: 1,
          imageUrl:
              "https://gw.alicdn.com/bao/uploaded/i1/3424653238/O1CN01tcQb931Zn31ax5bTo_!!3424653238.jpg_290x10000Q75.jpg_.webp",
          title: "测试商品6",
          newPrice: 418.0,
          oldPrice: 428.0,
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_goods,
          itemId: 1,
          imageUrl:
              "https://gw.alicdn.com/bao/uploaded/i3/1966697100/O1CN01pBs82H22JqdE9hJPi_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
          title: "测试商品7",
          newPrice: 518.0,
          oldPrice: 528.0,
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_goods,
          itemId: 1,
          imageUrl:
              "https://gw.alicdn.com/bao/uploaded/i4/2066946881/O1CN01VC3iJK20hXugRIr2Y_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
          title: "测试商品8",
          newPrice: 618.0,
          oldPrice: 628.0,
        ),
      ],
    );
  }
}
