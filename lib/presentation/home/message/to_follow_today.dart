import 'package:flutter/material.dart';

class ToFollowToday extends StatefulWidget {
  @override
  _ToFollowTodayState createState() => _ToFollowTodayState();
}

class _ToFollowTodayState extends State<ToFollowToday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("今日待回访")),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, i) => Center(
                child: Card(
                    margin: EdgeInsets.only(top: 15),
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.zero,
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.circular(20.0)),
                    ),
                    child: InkWell(
                      child: Container(
                        width: 300,
                        height: 150,
                        child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text("姓名: 刘能",
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Text("进度:  " + "置业顾问跟踪办理(认筹/下定)",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 15)),
                                Text("看房进度:  " + "已约看房",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 15)),
                                Text("楼盘:  " + "卓尔生活城",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 15)),
                                Text("上次跟进:  " + "2020-12-24",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 15)),
                                // Icon(Icons.phone),
                                // Icon(Icons.call),
                              ],
                            )),
                      ),
                      onTap: () {
                        showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("提示"),
                                content: Text("是否处理待回访用户"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("取消",
                                        style:
                                            TextStyle(color: Colors.blue[200])),
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                  ),
                                  FlatButton(
                                    child: Text("确定"),
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                  )
                                ],
                              );
                            });
                      },
                    )),
              )),
    );
  }
}
