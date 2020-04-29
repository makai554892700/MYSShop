import 'package:flutter/cupertino.dart';

class TypeItemRight {
  int itemId;
  String topImage;
  Map<String, List<ItemRight>> items;

  TypeItemRight({Key key, this.itemId, this.topImage, this.items});
}

class ItemRight {
  int itemId;
  String itemImage, itemName;

  ItemRight({Key key, this.itemId, this.itemImage, this.itemName});
}
