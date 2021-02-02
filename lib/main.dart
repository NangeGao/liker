import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';

import './home.dart';
import './moments.dart';

void main() {
  runApp(MainPage());
  // 判断当前设备是否为安卓
  if (Platform.isAndroid) {
    // 这一步设置状态栏颜色为透明
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MainPageState();
}

class MainPageState extends State<MainPage> {
  // int _currentIndex = 0;

  // List<Widget> _pageList = [
  //   HomePage(),
  //   SecondPage(),
  // ];

  // List<BottomNavigationBarItem> _barItem = [
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.home),
  //     label: '首页',
  //     backgroundColor: Colors.red,
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.people),
  //     label: '我的',
  //     backgroundColor: Colors.green,
  //   ),
  // ];

  @override
  initState() {
    // 状态栏显示
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '就是芥末赞',
      theme: ThemeData(
        primaryColor: Colors.green,
        canvasColor: Colors.white,
        backgroundColor: Colors.red,
        buttonColor: Colors.green,
      ),
      routes: {
        "moments": (context) => MomentsPage(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('👍👍👍👍👍',
              style: TextStyle(
                color: Colors.black,
              )),
          centerTitle: true,
          brightness: Brightness.light,
          backgroundColor: Color(0xffededed),
        ),
        body: HomePage(),
      ),
    );
  }
}
