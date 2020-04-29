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
    "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/84753/1/16651/5549/5e7d5f9eE492c3864/4b9963fe16fae211.png",
    "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/95626/6/16650/5992/5e7d5fdeE251a8742/d29fcc84ee0211f7.png",
    "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/105719/14/16594/7294/5e7d605eE007a21e7/63392310fbb001a4.png",
    "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/104104/6/16755/5068/5e7d6202E212fcc22/3fda8f7d8b63b55f.png",
    "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/96727/8/16477/5183/5e7d6249E4730c38a/0f70da903eded263.png",
    "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/96542/9/16707/3569/5e7d62bcE5c4ee6a7/3bf6ac36ac9f17d9.png",
    "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/86437/25/16675/6585/5e7d62e4E1095d733/d0d685ed0477d268.png",
    "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/110232/17/10270/4813/5e7d6310E79c9cb8d/6786eed1b786c010.png",
    "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/96795/33/16662/4749/5e7d6385Ec31e4b29/f36c778122286405.png",
    "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/97837/22/16281/7606/5e7d6411E0c0a91d6/93e0b359bfdf0239.png",
  ],
      nameList = [
    "京东超市",
    "数码电器",
    "京东服饰",
    "京东生鲜",
    "京东到家",
    "充值缴费",
    "9.9元拼",
    "领券",
    "赚钱",
    "PLUS会员",
  ];
  int lineItemCount = 5;
  double lineVSpace = 5, lineHSpace = 10, paddingTB = 10.0, paddingLR = 15.0;

  @override
  Widget build(BuildContext context) {
    double itemHeight = (ScreenUtils.screenW(context) -
            (paddingLR * 2) -
            (lineHSpace * (lineItemCount - 1))) /
        lineItemCount;
    double lineCount = dataList.length / lineItemCount;
    if ((lineCount) % 1 != 0) {
      lineCount = (lineCount.toInt() + 1).toDouble();
    }
    double height = (lineCount * itemHeight) +
        (lineVSpace * (lineCount - 1)) +
        (paddingTB * 2);
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
          childAspectRatio: 1.0,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ConstrainedBox(
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: CachedNetworkImage(
                      imageUrl: dataList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        nameList[index],
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black54,
                        ),
                      ),
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
