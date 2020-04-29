import 'dart:math';

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
  List itemImages = [
    "https://gw.alicdn.com/bao/uploaded/i1/699882163/O1CN01DMMwz51RqhH0cbp8l_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
    "https://gw.alicdn.com/bao/uploaded/i1/449513896/O1CN01CD85XP1eePYQCGSG9_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
    "https://gw.alicdn.com/bao/uploaded/i1/TB1d2pjRpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
    "https://gw.alicdn.com/bao/uploaded/i3/1664941371/O1CN01ddPJEi1LzxbSSKuQa_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
    "https://gw.alicdn.com/bao/uploaded/i2/2778883906/O1CN01uZwVKy1eizcWPCFpK_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
    "https://gw.alicdn.com/bao/uploaded/i1/3424653238/O1CN01tcQb931Zn31ax5bTo_!!3424653238.jpg_290x10000Q75.jpg_.webp",
    "https://gw.alicdn.com/bao/uploaded/i3/1966697100/O1CN01pBs82H22JqdE9hJPi_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
    "https://gw.alicdn.com/bao/uploaded/i4/2066946881/O1CN01VC3iJK20hXugRIr2Y_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
  ],
      itemNames = [
    "测试商品111111111111111111111111111111111111111111111111111111111111111",
    "测试商品2222222222222222222",
    "测试商品33333333333333333333",
    "测试商品444444444444444444444",
    "测试商品555555555555555555555",
    "测试商品66666666666666666666",
    "测试商品77777777777777777777",
    "测试商品88888888888888888888",
  ],
      itemPrices = [
    20.0,
    120.0,
    1120.0,
    11120.0,
    220.0,
    320.0,
    420.0,
    520.0,
  ];
  int lineItemCount = 2;
  double lineVSpace = 5, lineHSpace = 10, paddingTB = 10.0, paddingLR = 15.0;

  @override
  Widget build(BuildContext context) {
    double itemHeight = (ScreenUtils.screenW(context) -
            (paddingLR * 2) -
            (lineHSpace * (lineItemCount - 1))) /
        lineItemCount;
    double lineCount = itemImages.length / lineItemCount;
    if ((lineCount) % 1 != 0) {
      lineCount = (lineCount.toInt() + 1).toDouble();
    }
    double height = (lineCount * itemHeight / 0.7) +
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
        Container(
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
            physics: NeverScrollableScrollPhysics(),
            itemCount: itemImages.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: ConstrainedBox(
                  child: Card(
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
                            imageUrl: itemImages[index],
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
                                itemNames[index],
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
                                "￥${itemPrices[index]}",
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
                  ),
                  constraints: BoxConstraints.expand(),
                ),
                onTap: () {
                  print(index);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
