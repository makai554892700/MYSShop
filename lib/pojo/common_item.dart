import 'package:flutter/cupertino.dart';

class CommonItemParent {
  int? itemType;
  List<CommonItem>? datas;

  CommonItemParent({
    Key? key,
    this.itemType,
    this.datas,
  });

  static const int type_item_top = 1, //顶部分类 logo + title
      type_item_secKill = 2, //秒杀 image + title + newPrice + oldPrice
      type_item_assemble = 3, //拼团 image + title + desc + newPrice + oldPrice
      type_item_type = 4, //分类 image + title
      type_item_normal = 10 //普通商品 image + title + newPrice
      ;
}

class CommonItem {
  int? gotoType, itemId, assembleCount;
  String? imageUrl, title, desc;
  double? newPrice, oldPrice;

  CommonItem(
      {Key? key,
      this.gotoType, //item进入页面类型
      this.itemId,
      this.assembleCount, //参团人数
      this.imageUrl,
      this.title,
      this.desc,
      this.newPrice,
      this.oldPrice});

  static const int type_goto_store = 1, //进入商家
      type_goto_ranking = 2, //进入排行榜
      type_goto_active = 3, //进入活动页面
      type_goto_essay = 4, //进入文章
      type_goto_goods = 10 //进入商品
      ;
}

class CommonItemSpace {
  int? lineCount; //每行item个数
  double? lineVSpace, //item上下间距
      lineHSpace, //item左右间距
      height, //总高
      width, //总宽
      ratio; //高宽比例
  bool? isHorizontal; //是否为横向list
  CommonItemSpace({
    Key? key,
    this.lineCount,
    this.lineVSpace,
    this.lineHSpace,
    this.height,
    this.width,
    this.ratio,
    this.isHorizontal,
  });
}
