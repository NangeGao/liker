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
                  borderRadius: BorderRadius.all(Radius.circular(4)),
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
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: Color(0xff586b95),
                          size: 16,
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
