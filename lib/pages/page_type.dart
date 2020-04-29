import 'package:MYSShop/pojo/type_item_left.dart';
import 'package:MYSShop/pojo/type_item_right.dart';
import 'package:MYSShop/utils/screen_utils.dart';
import 'package:MYSShop/view/search_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
                      if (index == leftCheck) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              leftCheck = index;
                            });
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                leftItems[index].itemName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            color: Colors.white,
                            height: 50,
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              leftCheck = index;
                            });
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                leftItems[index].itemName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            color: Colors.black12,
                            height: 50,
                          ),
                        );
                      }
                    },
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.white,
                    child: getRightBody(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getRightBody() {
    TypeItemLeft currentTypeItemLeft = leftItems[leftCheck];
    TypeItemRight currentTypeItemRight = rightItems[currentTypeItemLeft.id];
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: currentTypeItemRight.items.length + 1,
        itemBuilder: (BuildContext buildContext, int index) {
          if (index == 0) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(2.0),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 15.0,
              ),
              child: CachedNetworkImage(
                imageUrl: currentTypeItemRight.topImage,
                height: 110.0,
//                width: double.infinity,
                fit: BoxFit.cover,
              ),
            );
          }
          List<String> keys = [];
          currentTypeItemRight.items.keys.forEach((element) {
            keys.add(element);
          });
          return Container(
            width: 80.0,
            child: getListItem(
              keys[index - 1],
              currentTypeItemRight.items[keys[index - 1]],
            ),
          );
        },
      ),
    );
  }

  Widget getListItem(String key, List<ItemRight> value) {
    int lineItemCount = 3;
    double lineVSpace = 5,
        lineHSpace = 10,
        paddingTB = 10.0,
        paddingLR = 15.0,
        itemHeight,
        lineCount,
        height;
    itemHeight = (ScreenUtils.screenW(context) * 3 / 4 -
            (paddingLR * 2) -
            (lineHSpace * (lineItemCount - 1))) /
        lineItemCount;
    lineCount = value.length / lineItemCount;
    if ((lineCount) % 1 != 0) {
      lineCount = (lineCount.toInt() + 1).toDouble();
    }
    height = (lineCount * itemHeight / 0.7) +
        (lineVSpace * (lineCount - 1)) +
        (paddingTB * 2);
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
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(key),
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
//        physics: AlwaysScrollableScrollPhysics(),
              physics: NeverScrollableScrollPhysics(),
              itemCount: value.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: ConstrainedBox(
                    child: getListView(value[index], itemHeight),
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
      ),
    );
  }

  Widget getListView(ItemRight data, double itemHeight) {
    return Column(
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
      ],
    );
  }

  @override
  void initState() {
    leftItems = [
      TypeItemLeft(id: 1, itemName: "手机数码"),
      TypeItemLeft(id: 2, itemName: "电脑办公"),
      TypeItemLeft(id: 3, itemName: "家用电器"),
    ];
    rightItems = {
      1: TypeItemRight(
          itemId: 1,
          topImage:
              "https://gw.alicdn.com/bao/uploaded/i1/699882163/O1CN01DMMwz51RqhH0cbp8l_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
          items: {
            "手机通讯": [
              ItemRight(
                itemId: 1,
                itemImage:
                    "https://img12.360buyimg.com/focus/s140x140_jfs/t11461/339/2354953633/8254/8c8c50d3/5a169217N5d1b842e.jpg",
                itemName: "老人机",
              ),
              ItemRight(
                itemId: 2,
                itemImage:
                    "https://img10.360buyimg.com/focus/s140x140_jfs/t11503/241/2246064496/4783/cea2850e/5a169216N0701c7f1.jpg",
                itemName: "手机",
              ),
              ItemRight(
                itemId: 3,
                itemImage:
                    "https://img30.360buyimg.com/focus/s140x140_jfs/t18955/187/1309277884/11517/fe100782/5ac48d27N3f5bb821.jpg",
                itemName: "全屏手机",
              ),
              ItemRight(
                itemId: 4,
                itemImage:
                    "https://img11.360buyimg.com/focus/s140x140_jfs/t11470/45/2362968077/2689/fb36d9a0/5a169238Nc8f0882b.jpg",
                itemName: "游戏手机",
              ),
            ],
            "运营商": [
              ItemRight(
                itemId: 1,
                itemImage:
                    "https://img12.360buyimg.com/focus/s140x140_jfs/t11461/339/2354953633/8254/8c8c50d3/5a169217N5d1b842e.jpg",
                itemName: "合约机",
              ),
              ItemRight(
                itemId: 2,
                itemImage:
                    "https://img10.360buyimg.com/focus/s140x140_jfs/t11503/241/2246064496/4783/cea2850e/5a169216N0701c7f1.jpg",
                itemName: "选号卡",
              ),
              ItemRight(
                itemId: 3,
                itemImage:
                    "https://img30.360buyimg.com/focus/s140x140_jfs/t18955/187/1309277884/11517/fe100782/5ac48d27N3f5bb821.jpg",
                itemName: "办套餐",
              ),
              ItemRight(
                itemId: 4,
                itemImage:
                    "https://img11.360buyimg.com/focus/s140x140_jfs/t11470/45/2362968077/2689/fb36d9a0/5a169238Nc8f0882b.jpg",
                itemName: "京东网厅",
              ),
              ItemRight(
                itemId: 5,
                itemImage:
                    "https://img11.360buyimg.com/focus/s140x140_jfs/t11470/45/2362968077/2689/fb36d9a0/5a169238Nc8f0882b.jpg",
                itemName: "京东网厅",
              ),
              ItemRight(
                itemId: 6,
                itemImage:
                    "https://img11.360buyimg.com/focus/s140x140_jfs/t11470/45/2362968077/2689/fb36d9a0/5a169238Nc8f0882b.jpg",
                itemName: "京东网厅",
              ),
              ItemRight(
                itemId: 7,
                itemImage:
                    "https://img11.360buyimg.com/focus/s140x140_jfs/t11470/45/2362968077/2689/fb36d9a0/5a169238Nc8f0882b.jpg",
                itemName: "京东网厅",
              ),
            ],
          }),
      2: TypeItemRight(
          itemId: 2,
          topImage:
              "https://gw.alicdn.com/bao/uploaded/i1/TB1d2pjRpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
          items: {
            "手机通讯2": [
              ItemRight(
                itemId: 1,
                itemImage:
                    "https://img12.360buyimg.com/focus/s140x140_jfs/t11461/339/2354953633/8254/8c8c50d3/5a169217N5d1b842e.jpg",
                itemName: "老人机2",
              ),
              ItemRight(
                itemId: 2,
                itemImage:
                    "https://img10.360buyimg.com/focus/s140x140_jfs/t11503/241/2246064496/4783/cea2850e/5a169216N0701c7f1.jpg",
                itemName: "手机2",
              ),
              ItemRight(
                itemId: 3,
                itemImage:
                    "https://img30.360buyimg.com/focus/s140x140_jfs/t18955/187/1309277884/11517/fe100782/5ac48d27N3f5bb821.jpg",
                itemName: "全屏手机2",
              ),
              ItemRight(
                itemId: 4,
                itemImage:
                    "https://img11.360buyimg.com/focus/s140x140_jfs/t11470/45/2362968077/2689/fb36d9a0/5a169238Nc8f0882b.jpg",
                itemName: "游戏手机2",
              ),
            ],
            "运营商2": [
              ItemRight(
                itemId: 1,
                itemImage:
                    "https://img12.360buyimg.com/focus/s140x140_jfs/t11461/339/2354953633/8254/8c8c50d3/5a169217N5d1b842e.jpg",
                itemName: "合约机2",
              ),
              ItemRight(
                itemId: 2,
                itemImage:
                    "https://img10.360buyimg.com/focus/s140x140_jfs/t11503/241/2246064496/4783/cea2850e/5a169216N0701c7f1.jpg",
                itemName: "选号卡2",
              ),
              ItemRight(
                itemId: 3,
                itemImage:
                    "https://img30.360buyimg.com/focus/s140x140_jfs/t18955/187/1309277884/11517/fe100782/5ac48d27N3f5bb821.jpg",
                itemName: "办套餐2",
              ),
              ItemRight(
                itemId: 4,
                itemImage:
                    "https://img11.360buyimg.com/focus/s140x140_jfs/t11470/45/2362968077/2689/fb36d9a0/5a169238Nc8f0882b.jpg",
                itemName: "京东网厅2",
              ),
            ],
          }),
      3: TypeItemRight(
          itemId: 3,
          topImage:
              "https://gw.alicdn.com/bao/uploaded/i1/449513896/O1CN01CD85XP1eePYQCGSG9_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
          items: {
            "手机通讯3": [
              ItemRight(
                itemId: 1,
                itemImage:
                    "https://img12.360buyimg.com/focus/s140x140_jfs/t11461/339/2354953633/8254/8c8c50d3/5a169217N5d1b842e.jpg",
                itemName: "老人机3",
              ),
              ItemRight(
                itemId: 2,
                itemImage:
                    "https://img10.360buyimg.com/focus/s140x140_jfs/t11503/241/2246064496/4783/cea2850e/5a169216N0701c7f1.jpg",
                itemName: "手机3",
              ),
              ItemRight(
                itemId: 3,
                itemImage:
                    "https://img30.360buyimg.com/focus/s140x140_jfs/t18955/187/1309277884/11517/fe100782/5ac48d27N3f5bb821.jpg",
                itemName: "全屏手机3",
              ),
              ItemRight(
                itemId: 4,
                itemImage:
                    "https://img11.360buyimg.com/focus/s140x140_jfs/t11470/45/2362968077/2689/fb36d9a0/5a169238Nc8f0882b.jpg",
                itemName: "游戏手机3",
              ),
            ],
            "运营商3": [
              ItemRight(
                itemId: 1,
                itemImage:
                    "https://img12.360buyimg.com/focus/s140x140_jfs/t11461/339/2354953633/8254/8c8c50d3/5a169217N5d1b842e.jpg",
                itemName: "合约机3",
              ),
              ItemRight(
                itemId: 2,
                itemImage:
                    "https://img10.360buyimg.com/focus/s140x140_jfs/t11503/241/2246064496/4783/cea2850e/5a169216N0701c7f1.jpg",
                itemName: "选号卡3",
              ),
            ],
          }),
    };
    super.initState();
  }
}
