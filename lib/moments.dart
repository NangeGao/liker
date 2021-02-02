import 'package:flutter/material.dart';
import 'package:liker/data/class.dart';
import 'dart:io';
import './utils/shuffle.dart';

class MomentsPage extends StatefulWidget {
  @override
  _MomentsPageState createState() => _MomentsPageState();
}

class _MomentsPageState extends State<MomentsPage> {
  ParamPeas params;

  @override
  Widget build(BuildContext context) {
    params = ModalRoute.of(context).settings.arguments;

    final shuffleList = shuffle(params.amount);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46),
        child: AppBar(
          title: Text(
            '详情',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          leading: IconButton(
            icon: Image.asset(
              'assets/icon_back_arrow.png',
              width: 26,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          elevation: 0, // 去掉阴影
          brightness: Brightness.light,
          backgroundColor: Color(0xffededed),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          SingleChildScrollView(
            primary: true,
            child: Column(children: <Widget>[
              params.screenshot != null
                  ? Image.file(File(params.screenshot))
                  : Text('没有上传朋友圈截图'),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff7f7f7),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
                padding: EdgeInsets.fromLTRB(0, 12, 8, 10),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            // color: Colors.blue,
                            ),
                        padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                        // child: Icon(
                        //   Icons.favorite_border_outlined,
                        //   color: Color(0xff586b95),
                        //   size: 16,
                        // ),
                        child: Image.asset(
                          'assets/icon_heart.png',
                          width: 14,
                        ),
                      ),
                      Flexible(
                        child: GridView.count(
                          crossAxisCount: 8,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 6,
                          shrinkWrap: true, // Use  children total size
                          physics: NeverScrollableScrollPhysics(),
                          children: shuffleList.map((index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: Image.asset("assets/avatar/$index.jpg"),
                            );
                          }).toList(),
                        ),
                      ),
                    ]),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff7f7f7),
                  // borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                margin: EdgeInsets.fromLTRB(12, 1, 12, 0),
                padding: EdgeInsets.fromLTRB(0, 6, 8, 0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
                        child: Image.asset(
                          'assets/icon_chat.png',
                          width: 14,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(3),
                                    child: Image.asset(
                                      "assets/avatar/1.jpg",
                                      width: 32,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 0, 3, 0),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                '南郭先生',
                                                style: TextStyle(
                                                  color: Color(0xff586b95),
                                                  fontSize: 15,
                                                  height: 1,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                '昨天 19:23',
                                                style: TextStyle(
                                                  color: Color(0xff7b7b7b),
                                                  fontSize: 13,
                                                  height: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 4, 0, 3),
                                            child: Text(
                                              '韩舞纪念币要吗都好都好，记得回电话记得回电话，大家都好点解点解嘟嘟姐，记得记得大结局。',
                                              style: TextStyle(
                                                color: Color(0xff181818),
                                                fontSize: 16,
                                                height: 1.3,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(3),
                                    child: Image.asset(
                                      "assets/avatar/1.jpg",
                                      width: 32,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(8, 0, 3, 0),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                '南郭先生',
                                                style: TextStyle(
                                                  color: Color(0xff586b95),
                                                  fontSize: 15,
                                                  height: 1,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                '昨天 19:23',
                                                style: TextStyle(
                                                  color: Color(0xff7b7b7b),
                                                  fontSize: 13,
                                                  height: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 4, 0, 3),
                                            child: Text(
                                              '韩舞纪念币要吗都好都好，记得回电话记得回电话，大家都好点解点解嘟嘟姐，记得记得大结局。',
                                              style: TextStyle(
                                                color: Color(0xff181818),
                                                fontSize: 16,
                                                height: 1.3,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
              Container(
                height: 200,
                width: 20,
              ),
            ]),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset("assets/input.png"),
          ),
        ],
      ),
    );
  }
}
