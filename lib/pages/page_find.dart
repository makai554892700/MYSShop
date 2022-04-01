import 'package:MYSShop/utils/screen_utils.dart';
import 'package:MYSShop/view/simple_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FindPage extends StatefulWidget {
  @override
  State createState() {
    return FindPageState();
  }
}

class FindPageState extends State<FindPage> {
  FindPageState({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
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
        child: ListView(
          children: getBody(),
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
    List<Widget> result = [];
    result.add(Container(
      color: Colors.blueAccent,
      height: ScreenUtils.getStatusBarH(context),
    ));
    result.add(SimpleItemView());
    return result;
  }
}
