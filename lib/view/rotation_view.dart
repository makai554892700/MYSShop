import 'dart:io';

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
  RotationViewState({Key? key});
  List dataList = [
    "https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/110964/39/3311/96625/5ea7a8c3Edafd27a4/c7a03c411115e3e0.jpg.dpg",
    "https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/64512/17/14296/88305/5dbbf1d2Ec5281fb6/bb2dbc7e17920b54.jpg!cr_1125x445_0_171!q70.jpg.dpg",
    "https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/91538/35/1275/99931/5dbbf626Ed9e6f56c/6f5681b0d1362012.jpg!cr_1125x445_0_171!q70.jpg.dpg",
    "https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/31641/34/14721/271059/5cbf578dEb78e94a8/08450440e3537e76.jpg!cr_1125x445_0_171!q70.jpg.dpg",
    "https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/57282/11/14947/102122/5dbc0203E786482fb/0658ac16db09833d.jpg!cr_1125x445_0_171!q70.jpg.dpg",
    "https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/31162/17/1128/101786/5c46ead8E22ee9740/f66061da227c1965.jpg!cr_1125x445_0_171!q70.jpg.dpg",
    "https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/115901/29/2471/181803/5ea23e40E5d4fabb7/0262b3258d15ec57.jpg!cr_1125x445_0_171!q70.jpg.dpg",
    "https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/109280/3/14487/86263/5ea6ee6eEc9a3fffa/51a1e536db7fca88.jpg!cr_1125x445_0_171!q70.jpg.dpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints.loose(
          Size(ScreenUtils.screenW(context), 180.0),
        ),
        child: Swiper(
          loop: true,
          autoplay: true,
          itemCount: dataList.length,
          pagination: SwiperPagination(
            margin: EdgeInsets.all(10.0),
          ),
          itemBuilder: (BuildContext context, int index) {
            Widget image;
            if (Platform.isIOS || Platform.isAndroid) {
              image = CachedNetworkImage(
                imageUrl: "${dataList[index]}",
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              );
            } else {
              image = Image(
                image: NetworkImage(
                  dataList[index],
                ),
                fit: BoxFit.cover,
              );
            }
            return image;
          },
        ),
      ),
    );
  }
}
