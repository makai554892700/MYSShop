import 'dart:async';

import 'package:MYSShop/pojo/simple_item.dart';
import 'package:MYSShop/utils/screen_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleItemView extends StatefulWidget {
  @override
  State createState() {
    return SimpleItemViewState();
  }
}

class SimpleItemViewState extends State<SimpleItemView> {
  List<SimpleItem> datas = [];
  int lineItemCount = 2;
  double lineVSpace = 5,
      lineHSpace = 10,
      paddingTB = 10.0,
      paddingLR = 15.0,
      itemHeight,
      lineCount,
      height;

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    itemHeight = (ScreenUtils.screenW(context) -
            (paddingLR * 2) -
            (lineHSpace * (lineItemCount - 1))) /
        lineItemCount;
    lineCount = datas.length / lineItemCount;
    if ((lineCount) % 1 != 0) {
      lineCount = (lineCount.toInt() + 1).toDouble();
    }
    height = (lineCount * itemHeight / 0.7) +
        (lineVSpace * (lineCount - 1)) +
        (paddingTB * 2);
    return Column(
      children: [
        Container(
          child: Text(
            "热门推荐",
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
          ),
          margin: EdgeInsets.only(
            top: 10.0,
          ),
        ),
        getListItem(),
      ],
    );
  }

  Widget getListItem() {
    return Container(
      width: double.infinity,
      height: height,
      padding: EdgeInsets.symmetric(
        vertical: paddingTB,
        horizontal: paddingLR,
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: lineItemCount,
          crossAxisSpacing: lineHSpace,
          mainAxisSpacing: lineVSpace,
          childAspectRatio: 0.7,
        ),
//        physics: AlwaysScrollableScrollPhysics(),
        physics: NeverScrollableScrollPhysics(),
        itemCount: datas.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ConstrainedBox(
              child: getListView(datas[index]),
              constraints: BoxConstraints.expand(),
            ),
            onTap: () {
              print(index);
            },
          );
        },
      ),
    );
  }

  Widget getListView(SimpleItem data) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 18,
            child: CachedNetworkImage(
              imageUrl: data.itemImage,
              fit: BoxFit.cover,
              width: itemHeight,
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  data.itemName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "￥${data.itemPrice}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isLoading = false;

  void initData() {
    datas = [
      SimpleItem(
        itemImage:
            "https://gw.alicdn.com/bao/uploaded/i1/699882163/O1CN01DMMwz51RqhH0cbp8l_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
        itemName:
            "测试商品111111111111111111111111111111111111111111111111111111111111111",
        itemPrice: 20.0,
      ),
      SimpleItem(
        itemImage:
            "https://gw.alicdn.com/bao/uploaded/i1/449513896/O1CN01CD85XP1eePYQCGSG9_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
        itemName: "测试商品2222222222222222222",
        itemPrice: 120.0,
      ),
      SimpleItem(
        itemImage:
            "https://gw.alicdn.com/bao/uploaded/i1/TB1d2pjRpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
        itemName: "测试商品33333333333333333333",
        itemPrice: 1120.0,
      ),
      SimpleItem(
        itemImage:
            "https://gw.alicdn.com/bao/uploaded/i3/1664941371/O1CN01ddPJEi1LzxbSSKuQa_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
        itemName: "测试商品444444444444444444444",
        itemPrice: 11120.0,
      ),
      SimpleItem(
        itemImage:
            "https://gw.alicdn.com/bao/uploaded/i2/2778883906/O1CN01uZwVKy1eizcWPCFpK_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
        itemName: "测试商品555555555555555555555",
        itemPrice: 220.0,
      ),
      SimpleItem(
        itemImage:
            "https://gw.alicdn.com/bao/uploaded/i1/3424653238/O1CN01tcQb931Zn31ax5bTo_!!3424653238.jpg_290x10000Q75.jpg_.webp",
        itemName: "测试商品66666666666666666666",
        itemPrice: 320.0,
      ),
      SimpleItem(
        itemImage:
            "https://gw.alicdn.com/bao/uploaded/i3/1966697100/O1CN01pBs82H22JqdE9hJPi_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
        itemName: "测试商品77777777777777777777",
        itemPrice: 420.0,
      ),
      SimpleItem(
        itemImage:
            "https://gw.alicdn.com/bao/uploaded/i4/2066946881/O1CN01VC3iJK20hXugRIr2Y_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
        itemName: "测试商品88888888888888888888",
        itemPrice: 520.0,
      ),
    ];
  }

  Future<void> loadMore() async {
    print("loadMore.");
    if (!isLoading) {
      isLoading = true;
      setState(() {});
      await Future.delayed(Duration(seconds: 3), () {
        isLoading = false;
        setState(() {
          datas.addAll([
            SimpleItem(
              itemImage:
                  "https://gw.alicdn.com/bao/uploaded/i1/699882163/O1CN01DMMwz51RqhH0cbp8l_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
              itemName:
                  "测试商品111111111111111111111111111111111111111111111111111111111111111",
              itemPrice: 20.0,
            ),
            SimpleItem(
              itemImage:
                  "https://gw.alicdn.com/bao/uploaded/i1/449513896/O1CN01CD85XP1eePYQCGSG9_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
              itemName: "测试商品2222222222222222222",
              itemPrice: 120.0,
            ),
            SimpleItem(
              itemImage:
                  "https://gw.alicdn.com/bao/uploaded/i1/TB1d2pjRpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
              itemName: "测试商品33333333333333333333",
              itemPrice: 1120.0,
            ),
            SimpleItem(
              itemImage:
                  "https://gw.alicdn.com/bao/uploaded/i3/1664941371/O1CN01ddPJEi1LzxbSSKuQa_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
              itemName: "测试商品444444444444444444444",
              itemPrice: 11120.0,
            ),
            SimpleItem(
              itemImage:
                  "https://gw.alicdn.com/bao/uploaded/i2/2778883906/O1CN01uZwVKy1eizcWPCFpK_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
              itemName: "测试商品555555555555555555555",
              itemPrice: 220.0,
            ),
            SimpleItem(
              itemImage:
                  "https://gw.alicdn.com/bao/uploaded/i1/3424653238/O1CN01tcQb931Zn31ax5bTo_!!3424653238.jpg_290x10000Q75.jpg_.webp",
              itemName: "测试商品66666666666666666666",
              itemPrice: 320.0,
            ),
            SimpleItem(
              itemImage:
                  "https://gw.alicdn.com/bao/uploaded/i3/1966697100/O1CN01pBs82H22JqdE9hJPi_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
              itemName: "测试商品77777777777777777777",
              itemPrice: 420.0,
            ),
            SimpleItem(
              itemImage:
                  "https://gw.alicdn.com/bao/uploaded/i4/2066946881/O1CN01VC3iJK20hXugRIr2Y_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
              itemName: "测试商品88888888888888888888",
              itemPrice: 520.0,
            ),
          ]);
        });
      });
    }
  }
}
