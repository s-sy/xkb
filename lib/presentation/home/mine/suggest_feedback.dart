import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SuggestFeedback extends StatefulWidget {
  @override
  _SuggestFeedbackState createState() => _SuggestFeedbackState();
}

class _SuggestFeedbackState extends State<SuggestFeedback> {
  GestureRecognizer _recognizer;
  @override
  void dispose() {
    super.dispose();
    _recognizer.dispose();
    _recognizer = null;
  }

  @override
  void initState() {
    super.initState();
    _recognizer = ImmediateMultiDragGestureRecognizer();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: (PointerEvent event) {
          _recognizer.addPointer(event);
          FocusScope.of(context).requestFocus(FocusNode());
          print('手指按下回调');
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("问题反馈"),
          ),
          backgroundColor: Colors.grey[200],
          body: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 150,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: TextField(
                      maxLines: 5,
                      minLines: 1,
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                        hintText: "对于我们的建议(如用户体验、漏洞、BUG等)",
                        border: InputBorder.none,
                        isDense: true,
                        hintStyle:
                            TextStyle(color: Colors.grey[400], fontSize: 16),
                      ),
                      onChanged: (val) {}),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Center(
                      child: TextField(
                          maxLines: 5,
                          minLines: 1,
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                            hintText: "(选填)手机号/邮箱/QQ号",
                            border: InputBorder.none,
                            isDense: true,
                            hintStyle: TextStyle(
                                color: Colors.grey[400], fontSize: 16),
                          ),
                          onChanged: (val) {}),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    "新客邦用户反馈/交流QQ群:465221440",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      // fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  width: 400,
                  height: 50,
                  child: RaisedButton(
                    splashColor: Colors.lightBlueAccent,
                    child: Text("提交",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
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
                          }).then((value) async {
                        print("balabalabali");
                        // PackageInfo packageInfo =
                        //     await PackageInfo.fromPlatform();
                        // String appName = packageInfo.appName;
                        // String packageName = packageInfo.packageName;
                        // String version = packageInfo.version;
                        // String buildNumber = packageInfo.buildNumber;
                        // print(appName);
                        // print(packageName);
                        // print(version);
                        // print(buildNumber);
                      });
                    },
                    textColor: Colors.white,
                    color: Colors.blue[500],
                    elevation: 2,
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
