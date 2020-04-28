import 'dart:math';

import 'package:MYSShop/utils/screen_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopItemView extends StatefulWidget {
  @override
  State createState() {
    return TopItemViewState();
  }
}

class TopItemViewState extends State<TopItemView> {
  List dataList = [
    "https://picsum.photos/250?image=1",
    "https://picsum.photos/250?image=2",
    "https://picsum.photos/250?image=3",
    "https://picsum.photos/250?image=4",
    "https://picsum.photos/250?image=5",
    "https://picsum.photos/250?image=6",
    "https://picsum.photos/250?image=7",
    "https://picsum.photos/250?image=8",
    "https://picsum.photos/250?image=9",
  ];
  int lineItemCount = 5, lineItemHeight = 100;
  double lineVSpace = 5, lineHSpace = 30, paddingTB = 15.0, paddingLR = 30.0;

  @override
  Widget build(BuildContext context) {
    double itemHeight = (ScreenUtils.screenW(context) -
            (paddingLR * 2) -
            (lineHSpace * (lineItemCount - 1))) /
        lineItemCount;
    double height =
        ((1 + dataList.length / lineItemCount).toInt() * itemHeight) +
            (lineVSpace * (dataList.length / lineItemCount).toInt()) +
            paddingTB * 2;
    return Container(
      width: double.infinity,
      height: height,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: lineItemCount,
          crossAxisSpacing: lineHSpace,
          mainAxisSpacing: lineVSpace,
          childAspectRatio: 1.0,
        ),
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          vertical: paddingTB,
          horizontal: paddingLR,
        ),
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ConstrainedBox(
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: dataList[index],
                    fit: BoxFit.cover,
                    height: itemHeight - 15,
                  ),
                  Text(
                    "测试",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
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
}
