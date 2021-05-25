import 'package:flutter/material.dart';

class MyAppTest extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppTest> {
  _alertDialog() async {
    var result = await showDialog(
        barrierDismissible: false, // 表示点击灰色背景的时候是否消失弹出框
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示信息"),
            content: Text("您确定要删除吗?"),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () {
                  print("取消");
                  Navigator.of(context).pop("Cancel");
                },
              ),
              FlatButton(
                child: Text("确定"),
                onPressed: () {
                  print("确定");
                  Navigator.of(context).pop("Ok");
                },
              )
            ],
          );
        });
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: RaisedButton(
        child: Text("AlertDialog"),
        onPressed: _alertDialog,
      ),
    ));
  }
}
