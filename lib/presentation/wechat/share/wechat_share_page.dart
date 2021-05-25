import 'package:flutter/material.dart';

class WechatSharePage extends StatefulWidget {
  @override
  _WechatSharePageState createState() => _WechatSharePageState();
}

class _WechatSharePageState extends State<WechatSharePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("分享", style: TextStyle(color: Colors.grey[700])),
          elevation: 0.0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey[700])),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              // margin: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://img.0728jh.com/staticImg/authandphone.png'),
                    fit: BoxFit.cover),
              ),
            ),
            bottom(),
          ],
        ),
      ),
    );
  }

  bottom() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
      width: 400,
      height: 50,
      child: RaisedButton(
        child:
            Text("生成海报", style: TextStyle(color: Colors.white, fontSize: 18)),
        onPressed: () {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("提示"),
                  content: Text("请确认是否提交"),
                  actions: <Widget>[
                    FlatButton(
                      child:
                          Text("取消", style: TextStyle(color: Colors.blue[200])),
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
              }).then((value) async {
            print("balabalabali");
          });
        },
        splashColor: Colors.lightBlueAccent,
        textColor: Colors.white,
        color: Colors.green,
        elevation: 2,
      ),
    );
  }
}
