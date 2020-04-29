import 'package:MYSShop/view/assemble_view.dart';
import 'package:MYSShop/view/rotation_view.dart';
import 'package:MYSShop/view/search_view.dart';
import 'package:MYSShop/view/seckill_view.dart';
import 'package:MYSShop/view/simple_item_view.dart';
import 'package:MYSShop/view/top_item_view.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SearchView(),
          Expanded(
            child: ListView(
              children: getBody(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getBody() {
    List<Widget> result = List();
    result.add(RotationView());
    result.add(TopItemView());
    result.add(SecKillView());
    result.add(AssembleView());
    result.add(SimpleItemView());
    return result;
  }
}
