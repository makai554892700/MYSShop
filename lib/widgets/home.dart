import 'package:MYSShop/widgets/page_parent.dart';
import 'package:MYSShop/utils/screen_utils.dart';
import 'package:MYSShop/view/waiter_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  bool showAd = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Offstage(
          child: PageParent(),
          offstage: showAd,
        ),
        Offstage(
          child: Container(
            child: Stack(
              children: [
                Image(
                  image: AssetImage('assets/images/lion.jpg'),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 80.0,
                  child: SizedBox(
                    width: ScreenUtils.screenW(context),
                    child: Text(
                      '落花有意随流水,流水无心恋落花',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SafeArea(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      child: Waiter(
                        seconds: 15,
                        text: '跳过',
                        onCountDownFinishCallBack: (bool value) {
                          if (value) {
                            setState(() {
                              showAd = false;
                            });
                          }
                        },
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                      margin: EdgeInsets.only(right: 20.0, top: 20.0),
                    ),
                  ),
                ),
              ],
            ),
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
          ),
          offstage: !showAd,
        ),
      ],
    );
  }
}
