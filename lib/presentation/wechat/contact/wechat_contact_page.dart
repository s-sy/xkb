import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/wxpage/buying_house/buyinghouse_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class WechatContactPage extends StatefulWidget {
  final Map<String, dynamic> affData;

  const WechatContactPage({Key key, this.affData}) : super(key: key);
  @override
  _WechatContactPageState createState() => _WechatContactPageState();
}

class _WechatContactPageState extends State<WechatContactPage> {
  String imgWhenNull =
      "https://img.0728jh.com/1332139872148000768/material/fb625605-48d3-4e89-b58e-cbda5b568beb.jpeg";
  int groupValue = 0;
  String valueName = "";
  String valuePhone = "";
  String valueRemark = "";
  bool isSalemanOne = false;
  SharedPreferences sharPre;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSalemanOne();
  }

  Future<String> getSalemanOne() async {
    SharedPreferences sharPre = await SharedPreferences.getInstance();
    String salemanOne = sharPre.get("SALEMANONE");
    print(salemanOne);
    if (salemanOne != null) {
      isSalemanOne = true;
    } else {
      isSalemanOne = false;
    }
    return salemanOne;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BuyinghouseBloc>()
        ..add(BuyinghouseEvent.started(widget.affData))
        ..add(BuyinghouseEvent.getTaills()),
      child: BlocConsumer<BuyinghouseBloc, BuyinghouseState>(
        listener: (context, state) async {
          sharPre = await SharedPreferences.getInstance();
          if (state.isRepeat) {
            BotToast.showText(text: "您已推荐过此号码");
            BlocProvider.of<BuyinghouseBloc>(context)
              ..add(BuyinghouseEvent.repeatTip());
          }
        },
        builder: (context, state) {
          return Listener(
            onPointerDown: (onPointerDown) {
              FocusScope.of(context).requestFocus(FocusNode());
              print('手指按下回调');
            },
            child: Scaffold(
              appBar: AppBar(
                  title: Text("购房", style: TextStyle(color: Colors.grey[700])),
                  // leading: Icon(Icons.home),
                  centerTitle: false,
                  elevation: 0.0,
                  brightness: Brightness.light,
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.grey[700])),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title("电话咨询"),
                      if (state.salesmanItem.containsKey("phone"))
                        isSalemanOne
                            ? salemanOne()
                            : salemans(state.salesmanItem),
                      title("预约咨询"),
                      inputField("姓名", "请输入您的姓名"),
                      _sexRadio(),
                      inputField("电话", "请输入置业顾问电话"),
                      inputField("需求", "请输入意向"),
                      bottom(context),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  salemanOne() {
    String salemanOne = sharPre.get("SALEMANONE");
    Map<String, dynamic> item = jsonDecode(salemanOne);
    // print(item);
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              image: DecorationImage(
                  image: NetworkImage(item["headimgUrl"] != ""
                          ? item["headimgUrl"]
                          : imgWhenNull
                      // 'https://www.itying.com/images/flutter/2.png'
                      ),
                  fit: BoxFit.cover),
            ),
          ),
          Text(
            item["realName"] ?? "",
            // "赵四" + " " + "13429824005",
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          Text(
            item["phone"] ?? "",
            // "赵四" + " " + "13429824005",
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          Expanded(child: SizedBox()),
          InkWell(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.grey[200]),
              child: Icon(
                Icons.phone,
                size: 25,
                color: Colors.cyan,
              ),
            ),
            onTap: () {
              showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("提示"),
                    content: Text("是否拨打电话:" + item["phone"]),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("取消",
                            style: TextStyle(color: Colors.blue[200])),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      FlatButton(
                        child: Text("确定"),
                        onPressed: () async {
                          String url = 'tel:' + item["phone"];
                          //  'tel:13429824009';
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
                },
              );
            },
          )
        ],
      ),
    );
  }

  bottom(context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
      width: 400,
      height: 50,
      child: RaisedButton(
        splashColor: Colors.lightBlueAccent,
        child: Text("提交", style: TextStyle(color: Colors.white, fontSize: 18)),
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
            if (value != null && value) {
              BlocProvider.of<BuyinghouseBloc>(context)
                ..add(BuyinghouseEvent.checkphone(valuePhone))
                ..add(BuyinghouseEvent.sendworkflow(
                    valueName, valuePhone, valueRemark, groupValue.toString()));
            }
          });
        },
        textColor: Colors.white,
        color: Colors.cyan,
        elevation: 2,
      ),
    );
  }

  phoneField(String name, String tips) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(top: 0),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 20),
          Expanded(
              child: Container(
            alignment: Alignment.centerLeft,
            height: 50,
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(5.0)),
            child: Text(
              tips,
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
          ))
        ],
      ),
    );
  }

  inputField(String name, String tips) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(top: 0),
      child: Row(
        children: [
          Container(
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 50,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(5.0)),
              child: Center(
                child: TextField(
                    maxLines: 3,
                    minLines: 1,
                    keyboardType: name == "电话"
                        ? TextInputType.number
                        : TextInputType.text,
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      hintText: tips,
                      border: InputBorder.none,
                      isDense: true,
                      hintStyle:
                          TextStyle(color: Colors.grey[400], fontSize: 16),
                    ),
                    onChanged: (val) {
                      switch (name) {
                        case "姓名":
                          setState(() {
                            valueName = val;
                          });
                          break;
                        case "电话":
                          setState(() {
                            valuePhone = val;
                          });
                          break;
                        case "需求":
                          setState(() {
                            valueRemark = val;
                          });
                          break;
                      }
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }

  _sexRadio() {
    return Container(
      margin: EdgeInsets.only(top: 0),
      child: Row(
        children: <Widget>[
          Text(
            "性别",
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 15),
          Radio(
            value: 1,
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
          ),
          Text("先生",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
          SizedBox(width: 30),
          Radio(
            value: 2,
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
          ),
          Text("女士",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
        ],
      ),
    );
  }

  title(String name) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(
        name,
        style: TextStyle(
            color: Colors.grey[700], fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }

  salemans(Map<String, dynamic> item) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              image: DecorationImage(
                  image: NetworkImage(item["headimgUrl"] != ""
                          ? item["headimgUrl"]
                          : imgWhenNull
                      // 'https://www.itying.com/images/flutter/2.png'
                      ),
                  fit: BoxFit.cover),
            ),
          ),
          Text(
            item["realName"] ?? "",
            // "赵四" + " " + "13429824005",
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          Text(
            item["phone"] ?? "",
            // "赵四" + " " + "13429824005",
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          Expanded(child: SizedBox()),
          InkWell(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.grey[200]),
              child: Icon(
                Icons.phone,
                size: 25,
                color: Colors.cyan,
              ),
            ),
            onTap: () {
              showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("提示"),
                    content: Text("是否拨打电话:" + item["phone"]),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("取消",
                            style: TextStyle(color: Colors.blue[200])),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      FlatButton(
                        child: Text("确定"),
                        onPressed: () async {
                          String url = 'tel:' + item["phone"];
                          //  'tel:13429824009';
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
                },
              );
            },
          )
        ],
      ),
    );
  }
}
