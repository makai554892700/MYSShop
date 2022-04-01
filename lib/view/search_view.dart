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
  SearchViewState({Key? key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        width: ScreenUtils.screenW(context),
        margin: EdgeInsets.fromLTRB(
          15.0,
          15.0,
          15.0,
          5.0,
        ),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: 18.0,
              color: Colors.black38,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10.0,
              ),
              child: Text(
                '搜索',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
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
