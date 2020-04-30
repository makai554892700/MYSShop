import 'package:MYSShop/pojo/common_item.dart';
import 'package:MYSShop/utils/screen_utils.dart';
import 'package:MYSShop/utils/view_utils.dart';
import 'package:MYSShop/view/search_view.dart';
import 'package:MYSShop/view/simple_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ShopCardPage extends StatefulWidget {
  @override
  State createState() {
    return ShopCardPageState();
  }
}

class ShopCardPageState extends State<ShopCardPage> {
  CommonItemParent commonItemParent;

  @override
  void initState() {
    commonItemParent = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SmartRefresher(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                delegate: CardSliverAppBar(expandedHeight: 56.0),
                pinned: false,
                floating: true,
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 10.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ViewUtils.getNormalItem(
                        commonItemParent.datas[index], (commonItem) {
                      print("onCardClick$commonItem");
                    });
                  },
                  childCount: commonItemParent.datas.length,
                ),
              ),
            ],
          ),
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropHeader(),
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = Text("pull up load");
              } else if (mode == LoadStatus.loading) {
                body = CupertinoActivityIndicator();
              } else if (mode == LoadStatus.failed) {
                body = Text("Load Failed!Click retry!");
              } else if (mode == LoadStatus.canLoading) {
                body = Text("release to load more");
              } else {
                body = Text("No more Data");
              }
              return Container(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
        ),
      ),
    );
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 3000));
    _refreshController.refreshCompleted();
    print("onRefresh");
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 3000));
    if (mounted) setState(() {});
    _refreshController.loadComplete();
    print("_onLoading");
  }

  List<Widget> getBody() {
    List<Widget> result = List();
    result.add(Container(
      color: Colors.blueAccent,
      height: ScreenUtils.getStatusBarH(context),
    ));
    result.add(SearchView());
    result.add(SimpleItemView());
    return result;
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
          title:
              "测试商品111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111",
          newPrice: 18.0,
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_goods,
          itemId: 1,
          imageUrl:
              "https://gw.alicdn.com/bao/uploaded/i1/449513896/O1CN01CD85XP1eePYQCGSG9_!!0-item_pic.jpg_290x10000Q75.jpg_.webp",
          title:
              "测试商品22222222222222222222222222222222222222222222222222222222222222",
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
}

class CardSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  CardSliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print("购物车点击");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("购物车", style: TextStyle(color: Colors.black)),
            Icon(Icons.room, color: Colors.black54),
          ],
        ),
      ),
      actions: [
        PopupMenuButton<String>(
          onSelected: (String value) {
            print("onSelected$value");
          },
          icon: Icon(Icons.more_horiz),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: "消息",
                child: Row(
                  children: [
                    Icon(Icons.message, color: Colors.black54),
                    Text("消息", textAlign: TextAlign.center),
                  ],
                ),
              )
            ];
          },
        ),
      ],
      leading: IconButton(
        icon: Icon(
          Icons.transform,
          color: Colors.transparent,
        ),
        onPressed: () {},
      ),
      actionsIconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
