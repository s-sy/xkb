import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/wxpage/wechat_mine/wechat_mine_bloc.dart';
import 'package:flutter_ui/injection.dart';

class WechatMineCustomer extends StatefulWidget {
  @override
  _WechatMineCustomerState createState() => _WechatMineCustomerState();
}

class _WechatMineCustomerState extends State<WechatMineCustomer> {
  String _textFeid = "";
  List _searchList = [];
  bool _isSearch = false;
  List list = [
    {
      "name": "赵四",
      "sex": "男",
      "tag": "正常",
      "phone": "13426587654",
    },
    {
      "name": "谢永强",
      "sex": "男",
      "tag": "无效客户",
      "phone": "16899875421",
    },
    {
      "name": "刘英",
      "sex": "女",
      "tag": "正常",
      "phone": "13566548752",
    },
    {
      "name": "宋小宝",
      "sex": "男",
      "tag": "正常",
      "phone": "18654876521",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            getIt<WechatMineBloc>()..add(WechatMineEvent.referrals()),
        child: BlocConsumer<WechatMineBloc, WechatMineState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                    title:
                        Text("我的客户", style: TextStyle(color: Colors.grey[700])),
                    elevation: 0.0,
                    brightness: Brightness.light,
                    backgroundColor: Colors.white,
                    iconTheme: IconThemeData(color: Colors.grey[700])),
                body:
                    // SingleChildScrollView(
                    //   child:
                    Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      searchHeader(state.customerList),
                      Expanded(
                        child: content(
                            _isSearch ? _searchList : state.customerList),
                      )
                    ],
                  ),
                ),
                // ),
              );
            }));
  }

  content(List list) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, i) => Container(
              height: 100,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[500],
                    blurRadius: 1.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          list[i]["customerName"],
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          getSex(list[i]["gender"]),
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.cyan),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Text(
                          getTag(list[i]["workflowStatus"]),
                          style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      list[i]["phone"],
                      style: TextStyle(color: Colors.grey[500], fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      list[i]["description"],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[500], fontSize: 15),
                    ),
                  ),
                ],
              ),
            ));
  }

  getSex(String name) {
    String sex = "";
    switch (name) {
      case "0":
        sex = "未知";
        break;
      case "1":
        sex = "男";
        break;
      case "2":
        sex = "女";
        break;
    }
    return sex;
  }

  getTag(String name) {
    String tag = "";
    switch (name) {
      case "0":
        tag = "正常";
        break;
      case "1":
        tag = "完结";
        break;
      case "2":
        tag = "冻结";
        break;
      case "3":
        tag = "延期";
        break;
      default:
        tag = "无效客户";
        break;
    }
    return tag;
  }

  searchHeader(List list) {
    return Container(
        height: 50,
        // decoration: BoxDecoration(color: Colors.white),
        child: Container(
          height: 40.0,
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.grey[200]),
          child: TextField(
              maxLines: 1,
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(
                hintText: "搜索客户",
                prefixIcon:
                    Icon(Icons.search, color: Colors.grey[400], size: 20),
                border: InputBorder.none,
                isDense: true,
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
              ),
              controller: TextEditingController.fromValue(
                TextEditingValue(
                  text: _textFeid,
                  // 保持光标在最后
                  selection: TextSelection.fromPosition(TextPosition(
                    affinity: TextAffinity.downstream,
                    offset: _textFeid.length,
                  )),
                ),
              ),
              onChanged: (val) {
                //一般是点击确定才出来，可能邓总要加的
              },
              onSubmitted: (val) {
                _searchList = [];
                if (val == "") {
                  setState(() {
                    _textFeid = val;
                    _isSearch = false;
                  });
                } else {
                  print(list);
                  for (int i = 0; i < list.length; i++) {
                    if (list[i]['customerName'].indexOf(val) != -1) {
                      _searchList.add(list[i]);
                    }
                  }
                  for (int i = 0; i < list.length; i++) {
                    if (list[i]['phone'].indexOf(val) != -1) {
                      _searchList.add(list[i]);
                    }
                  }
                  setState(() {
                    _isSearch = true;
                    _textFeid = val;
                  });
                }
              }),
        ));
  }
}
