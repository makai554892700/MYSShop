import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecKillView extends StatefulWidget {
  @override
  State createState() {
    return SecKillViewState();
  }
}

class SecKillViewState extends State<SecKillView> {
  int secKillTime = 1000;
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
    "测试商品1",
    "测试商品2",
    "测试商品3",
    "测试商品4",
    "测试商品5",
    "测试商品6",
    "测试商品7",
    "测试商品8",
  ],
      itemNewPrices = [
    20.0,
    120.0,
    1120.0,
    11120.0,
    220.0,
    320.0,
    420.0,
    520.0,
  ],
      itemOldPrices = [
    28.0,
    128.0,
    1128.0,
    111128.0,
    328.0,
    428.0,
    528.0,
    628.0,
  ];

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
          getListItem(),
        ],
      ),
    );
  }

  Widget getListItem() {
    return Container(
      height: 130.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemNames.length,
        itemBuilder: (BuildContext buildContext, int index) {
          return Container(
            width: 80.0,
            child: getListView(
              itemImages[index],
              itemNames[index],
              itemNewPrices[index],
              itemOldPrices[index],
            ),
          );
        },
      ),
    );
  }

  Widget getListView(
      String imageUrl, String title, double newPrice, double oldPrice) {
    return Column(children: [
      Expanded(
        flex: 6,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(3.0),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.symmetric(
            horizontal: 5.0,
            vertical: 5.0,
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.black,
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            children: [
              TextSpan(
                text: "￥$newPrice",
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.red,
                ),
              ),
              TextSpan(
                text: "￥$oldPrice",
                style: TextStyle(
                  fontSize: 8.0,
                  decoration: TextDecoration.lineThrough,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
