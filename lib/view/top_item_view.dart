import 'package:MYSShop/pojo/common_item.dart';
import 'package:MYSShop/utils/view_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopItemView extends StatefulWidget {
  @override
  State createState() {
    return TopItemViewState();
  }
}

class TopItemViewState extends State<TopItemView> {
  TopItemViewState({Key? key});
  late CommonItemParent commonItemParent;

  @override
  void initState() {
    commonItemParent = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 25.0,
      ),
      child: ViewUtils.getItemList(
        context,
        commonItemParent,
        (CommonItem commonItem) {
          print("SecKillListener commonItem=$commonItem");
        },
      ),
    );
  }

  CommonItemParent getData() {
    return CommonItemParent(
      itemType: CommonItemParent.type_item_top,
      datas: [
        CommonItem(
          gotoType: CommonItem.type_goto_store,
          itemId: 1,
          imageUrl:
              "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/84753/1/16651/5549/5e7d5f9eE492c3864/4b9963fe16fae211.png",
          title: "京东超市",
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_store,
          itemId: 2,
          imageUrl:
              "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/95626/6/16650/5992/5e7d5fdeE251a8742/d29fcc84ee0211f7.png",
          title: "数码电器",
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_store,
          itemId: 3,
          imageUrl:
              "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/105719/14/16594/7294/5e7d605eE007a21e7/63392310fbb001a4.png",
          title: "京东服饰",
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_store,
          itemId: 4,
          imageUrl:
              "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/104104/6/16755/5068/5e7d6202E212fcc22/3fda8f7d8b63b55f.png",
          title: "京东生鲜",
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_store,
          itemId: 5,
          imageUrl:
              "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/96727/8/16477/5183/5e7d6249E4730c38a/0f70da903eded263.png",
          title: "京东到家",
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_store,
          itemId: 6,
          imageUrl:
              "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/96542/9/16707/3569/5e7d62bcE5c4ee6a7/3bf6ac36ac9f17d9.png",
          title: "充值缴费",
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_store,
          itemId: 7,
          imageUrl:
              "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/86437/25/16675/6585/5e7d62e4E1095d733/d0d685ed0477d268.png",
          title: "9.9元拼",
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_store,
          itemId: 8,
          imageUrl:
              "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/110232/17/10270/4813/5e7d6310E79c9cb8d/6786eed1b786c010.png",
          title: "领券",
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_store,
          itemId: 9,
          imageUrl:
              "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/96795/33/16662/4749/5e7d6385Ec31e4b29/f36c778122286405.png",
          title: "赚钱",
        ),
        CommonItem(
          gotoType: CommonItem.type_goto_store,
          itemId: 10,
          imageUrl:
              "https://m.360buyimg.com/mobilecms/s120x120_jfs/t1/97837/22/16281/7606/5e7d6411E0c0a91d6/93e0b359bfdf0239.png",
          title: "PLUS会员",
        ),
      ],
    );
  }
}
