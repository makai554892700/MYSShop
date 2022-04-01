import 'package:flutter/cupertino.dart';

class SimpleItem {
  String itemImage, itemName;
  double itemPrice;

  SimpleItem(
      {Key? key,
      required this.itemImage,
      required this.itemName,
      required this.itemPrice});
}
