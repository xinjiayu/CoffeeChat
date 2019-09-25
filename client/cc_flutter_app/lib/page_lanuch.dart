import 'dart:async';
import 'dart:math';

import 'package:cc_flutter_app/gui/helper.dart';
import 'package:cc_flutter_app/page_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageLaunchStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageLaunchStatefulWidgetState();
}

/// 欢迎界面
/// 显示一张欢迎图片
/// 随机1-3秒后跳转到主界面
class _PageLaunchStatefulWidgetState extends State<PageLaunchStatefulWidget> {
  Timer _timer;

  @override
  Widget build(BuildContext context) {
//    Image.asset(
//      "assets/girl.jpeg",
//      fit: BoxFit.fitHeight,
//    ),
//    Text("CoffeeChat", style: TextStyle(fontSize: 14))

//    return Scaffold(
//      body: SafeArea(
//        child: ListView(
//          padding: EdgeInsets.symmetric(horizontal: 20),
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.symmetric(vertical: 64),
//              child: SizedBox(
//                height: 600,
//                child: Image.asset("assets/girl.jpeg"),
//              ),
//            ),
//            Padding(
//              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 64),
//              child: Text("CoffeeChat", style: TextStyle(fontSize: 14)),
//            )
//          ],
//        ),
//      ),
//    );

    // 剧中显示一张图片
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image.asset("assets/girl.jpeg"),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    var sleep = Random(DateTime.now().millisecondsSinceEpoch).nextInt(2) + 1;
    var tempMs = Random(DateTime.now().millisecondsSinceEpoch).nextDouble();
    var sleepMs = (tempMs * 1000).toInt();

    _timer = new Timer(Duration(seconds: sleep, milliseconds: sleepMs), () {
      navigatePage(this.context, PageMainStatefulApp());
    });
    super.initState();
  }
}