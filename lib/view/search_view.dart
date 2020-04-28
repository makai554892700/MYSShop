import 'package:MYSShop/utils/screen_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  @override
  State createState() {
    return SearchViewState();
  }
}

class SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 30,
        width: ScreenUtils.screenW(context),
        margin: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: 15.0,
              color: Colors.black38,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 8.0,
              ),
              child: Text(
                '搜索',
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.black38,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
