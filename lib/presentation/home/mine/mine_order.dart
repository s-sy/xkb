import 'package:flutter/material.dart';

class MineOrder extends StatefulWidget {
  @override
  _MineOrderState createState() => _MineOrderState();
}

class _MineOrderState extends State<MineOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("交易订单")),
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
                                  child: Text("姓名: 张三",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Text("电话:  " + "13425478220",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15)),
                                Text("楼盘:  " + "卓尔生活城",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15)),
                                Text("日期:  " + "2020-12-24",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15)),
                                Text("金额:  " + "58.52万",
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
                                content: Text("是否查看详情"),
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
