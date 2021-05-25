import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GuestPhone extends StatefulWidget {
  @override
  _GuestPhoneState createState() => _GuestPhoneState();
}

class _GuestPhoneState extends State<GuestPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("留客电话")),
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
                        height: 130,
                        child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      child: Text("姓名:" + " " + "张三",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                      child: Icon(
                                        Icons.phone_enabled,
                                        color: Colors.green,
                                      ),
                                    )
                                  ],
                                ),
                                Text("电话:" + "  " + "13425478220",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15)),
                                Text("时间:" + "  " + "2020-12-24 10:56:20",
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
                                content: Text("请确认是否要拨打电话"),
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
                                    onPressed: () async {
                                      // launch("https://www.baidu.com");
                                      const url = 'tel:13429824009';
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
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
