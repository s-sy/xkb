import 'package:flutter/material.dart';

class WechatFissionCustomer extends StatefulWidget {
  @override
  _WechatFissionCustomerState createState() => _WechatFissionCustomerState();
}

class _WechatFissionCustomerState extends State<WechatFissionCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("裂变客户", style: TextStyle(color: Colors.grey[700])),
          elevation: 0.0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey[700])),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              // margin: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
              decoration: BoxDecoration(
                // border: Border.all(width: 1.0, color: Colors.grey[300]),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://img.0728jh.com/staticImg/konghu_gz.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "暂时没有裂变客户",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
            //   width: 200,
            //   height: 50,
            //   child: RaisedButton(
            //     splashColor: Colors.lightBlueAccent,
            //     child: Text("去关注",
            //         style: TextStyle(color: Colors.white, fontSize: 18)),
            //     onPressed: () {
            //       showDialog(
            //           barrierDismissible: true,
            //           context: context,
            //           builder: (context) {
            //             return AlertDialog(
            //               title: Text("提示"),
            //               content: Text("请确认是否提交"),
            //               actions: <Widget>[
            //                 FlatButton(
            //                   child: Text("取消",
            //                       style: TextStyle(color: Colors.blue[200])),
            //                   onPressed: () {
            //                     Navigator.of(context).pop(false);
            //                   },
            //                 ),
            //                 FlatButton(
            //                   child: Text("确定"),
            //                   onPressed: () {
            //                     Navigator.of(context).pop(true);
            //                   },
            //                 )
            //               ],
            //             );
            //           }).then((value) async {
            //         print("balabalabali");
            //       });
            //     },
            //     textColor: Colors.white,
            //     color: Colors.cyan,
            //     elevation: 2,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
