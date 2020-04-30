import 'package:MYSShop/pojo/common_item.dart';
import 'package:MYSShop/utils/screen_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewUtils {
  static Widget getItemList(BuildContext context,
      CommonItemParent commonItemParent, ItemClickListener itemListener) {
    switch (commonItemParent.itemType) {
      case CommonItemParent.type_item_top:
        return getGridView(
          commonItemParent.itemType,
          commonItemParent.datas,
          CommonItemSpace(
            width: ScreenUtils.screenW(context),
            lineCount: 5,
            lineHSpace: 10.0,
            lineVSpace: 5.0,
            ratio: 1.0,
          ),
          itemListener,
        );
      case CommonItemParent.type_item_secKill:
        return getListView(
          commonItemParent.itemType,
          commonItemParent.datas,
          CommonItemSpace(
            isHorizontal: true,
            width: 90.0,
          ),
          itemListener,
        );
      case CommonItemParent.type_item_assemble:
        return getListView(
          commonItemParent.itemType,
          commonItemParent.datas,
          CommonItemSpace(
            isHorizontal: true,
            width: 90.0,
          ),
          itemListener,
        );
      case CommonItemParent.type_item_type:
        return getGridView(
          commonItemParent.itemType,
          commonItemParent.datas,
          CommonItemSpace(
            width: ScreenUtils.screenW(context),
            lineCount: 3,
            lineHSpace: 5.0,
            lineVSpace: 5.0,
            ratio: 0.8,
          ),
          itemListener,
        );
      default:
        return getGridView(
          commonItemParent.itemType,
          commonItemParent.datas,
          CommonItemSpace(
            width: ScreenUtils.screenW(context),
            lineCount: 2,
            lineHSpace: 10.0,
            lineVSpace: 5.0,
            ratio: 0.8,
          ),
          itemListener,
        );
    }
  }

  static Widget getListView(int itemType, List<CommonItem> datas,
      CommonItemSpace commonItemSpace, itemListener) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection:
          commonItemSpace.isHorizontal ? Axis.horizontal : Axis.vertical,
      itemCount: datas.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext buildContext, int index) {
        return SizedBox(
          width: commonItemSpace.width,
          child: getItemView(
            itemType,
            datas[index],
            itemListener,
          ),
        );
      },
    );
  }

  static Widget getGridView(int itemType, List<CommonItem> datas,
      CommonItemSpace commonItemSpace, ItemClickListener itemListener) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: commonItemSpace.lineCount,
        crossAxisSpacing: commonItemSpace.lineHSpace,
        mainAxisSpacing: commonItemSpace.lineVSpace,
        childAspectRatio: commonItemSpace.ratio,
      ),
      physics: NeverScrollableScrollPhysics(),
      itemCount: datas.length,
      padding: EdgeInsets.only(top: 0),
      itemBuilder: (context, index) {
        return getItemView(
          itemType,
          datas[index],
          itemListener,
        );
      },
    );
  }

  static Widget getItemView(
      int viewType, CommonItem data, ItemClickListener itemListener) {
    switch (viewType) {
      case CommonItemParent.type_item_top:
        return getTopItem(data, itemListener);
      case CommonItemParent.type_item_secKill:
        return getSecKillItem(data, itemListener);
      case CommonItemParent.type_item_assemble:
        return getAssembleItem(data, itemListener);
      case CommonItemParent.type_item_type:
        return getTypeItem(data, itemListener);
      default:
        return getNormalItem(data, itemListener);
    }
  }

  static Widget getTopItem(CommonItem data, ItemClickListener itemListener) {
    return GestureDetector(
      onTap: () {
        itemListener(data);
      },
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: data.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget getSecKillItem(
      CommonItem data, ItemClickListener itemListener) {
    return GestureDetector(
      onTap: () {
        itemListener(data);
      },
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
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
                  imageUrl: data.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                data.title,
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
                      text: "￥${data.newPrice}",
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.red,
                      ),
                    ),
                    TextSpan(
                      text: "￥${data.oldPrice}",
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
          ],
        ),
      ),
    );
  }

  static Widget getAssembleItem(
      CommonItem data, ItemClickListener itemListener) {
    return GestureDetector(
      onTap: () {
        itemListener(data);
      },
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
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
                  imageUrl: data.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                data.title,
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "${data.assembleCount} 人团",
                  style: TextStyle(
                    fontSize: 8.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "￥${data.newPrice}",
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.red,
                      ),
                    ),
                    TextSpan(
                      text: "￥${data.oldPrice}",
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
          ],
        ),
      ),
    );
  }

  static Widget getTypeItem(CommonItem data, ItemClickListener itemListener) {
    return GestureDetector(
      onTap: () {
        itemListener(data);
      },
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            Expanded(
              flex: 20,
              child: CachedNetworkImage(
                imageUrl: data.imageUrl,
                fit: BoxFit.cover,
//            width: itemHeight,
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    data.title,
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
        ),
      ),
    );
  }

  static Widget getNormalItem(CommonItem data, ItemClickListener itemListener) {
    return GestureDetector(
      onTap: () {
        itemListener(data);
      },
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
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
                flex: 20,
                child: CachedNetworkImage(
                  imageUrl: data.imageUrl,
                  fit: BoxFit.cover,
//              width: itemHeight,
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      data.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10.0,
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
                      "￥${data.newPrice}",
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
      ),
    );
  }
}

typedef ItemClickListener = void Function(CommonItem commonItem);
