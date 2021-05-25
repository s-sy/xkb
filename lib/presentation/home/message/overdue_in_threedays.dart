import 'package:flutter/material.dart';

class OverdueInThreeDays extends StatefulWidget {
  @override
  _OverdueInThreeDaysState createState() => _OverdueInThreeDaysState();
}

class _OverdueInThreeDaysState extends State<OverdueInThreeDays> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("三日将逾期")),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, i) => Center(
                child: Card(
                    margin: EdgeInsets.only(top: 15),
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.zero,
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.circular(20.0)),
                    ),
                    child: InkWell(
                      child: Container(
                        width: 270,
                        height: 150,
                        child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text("姓名: 赵四",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Text("进度:  " + "置业顾问跟踪办理(认筹/下定)",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15)),
                                Text("楼盘:  " + "卓尔生活城",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15)),
                                Text("逾期时间:  " + "2020-12-24",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15)),
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
                                content: Text("是否办理即将逾期用户"),
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
