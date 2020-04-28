import 'package:MYSShop/utils/screen_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class RotationView extends StatefulWidget {
  @override
  State createState() {
    return RotationViewState();
  }
}

class RotationViewState extends State<RotationView> {
  List dataList = [
    "https://picsum.photos/250?image=1",
    "https://picsum.photos/250?image=2",
    "https://picsum.photos/250?image=3",
    "https://picsum.photos/250?image=4",
    "https://picsum.photos/250?image=5",
    "https://picsum.photos/250?image=6",
    "https://picsum.photos/250?image=7",
    "https://picsum.photos/250?image=8",
    "https://picsum.photos/250?image=9",
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      child: ConstrainedBox(
        constraints: new BoxConstraints.loose(
          new Size(ScreenUtils.screenW(context), 100.0),
        ),
        child: Swiper(
          itemWidth: ScreenUtils.screenW(context),
          itemHeight: 100.0,
          itemCount: dataList.length,
          pagination: new SwiperPagination(
            margin: new EdgeInsets.all(10.0),
          ),
          itemBuilder: (BuildContext context, int index) {
            return CachedNetworkImage(
              imageUrl: "${dataList[index]}",
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(
                Icons.error,
              ),
            );
          },
        ),
      ),
    );
  }
}
