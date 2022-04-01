import 'package:flutter/cupertino.dart';

class TypeItemRight {
  int itemId;
  String topImage;
  Map<String, List<ItemRight>> items;

  TypeItemRight(
      {Key? key,
      required this.itemId,
      required this.topImage,
      required this.items});
}

class ItemRight {
  int itemId;
  String itemImage, itemName;

  ItemRight(
      {Key? key,
      required this.itemId,
      required this.itemImage,
      required this.itemName});
}
