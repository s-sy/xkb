import 'package:flutter/material.dart';

class PerfectInformation extends StatefulWidget {
  @override
  _PerfectInformationState createState() => _PerfectInformationState();
}

class _PerfectInformationState extends State<PerfectInformation> {
  List _usedOfHouse = ["自住", "商用", "其他"];
  bool _isExpanded01 = false;
  int _index01 = 0;
  List _attentionHouse = ["开发商品牌", "周围人推荐", "地理环境", "教育资源", "其他"];
  bool _isExpanded02 = false;
  int _index02 = 0;
  List _houseType = ["三室两厅", "两室两厅", "三室一厅", "两室两厅", "其他"];
  bool _isExpanded03 = false;
  int _index03 = 0;
  List _houseArea = ["130平", "120平", "110平", "100平", "90平", "其他"];
  bool _isExpanded04 = false;
  int _index04 = 0;
  List _housePrice = ["50万以下", "50-60万", "60-80万", "随便", "自己写"];
  bool _isExpanded05 = false;
  int _index05 = 0;
  List _theWayToKnow = ["0728房网", "到店询问", "其他网站", "线下打听"];
  bool _isExpanded06 = false;
  int _index06 = 0;
  List _intendedProducts = ["住宅房", "门面房", "分配房", "其他"];
  bool _isExpanded07 = false;
  int _index07 = 0;
  List _followUpWay = ["来访", "致电", "微信", "其他"];
  bool _isExpanded08 = false;
  int _index08 = 0;
  List _intentionLevel = ["A", "B", "C", "D"];
  bool _isExpanded09 = false;
  int _index09 = 0;
  List _customerFrom = ["自由经纪人", "网站推荐", "线下访问", "其他"];
  bool _isExpanded10 = false;
  int _index10 = 0;
  // String _payWayContant = "付款方式";
  // bool _isExpandedXXX = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("客户资料")),
        // backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _headImage(),
              _mainInfoTab("名称", "请输入称呼"),
              _mainInfoTab("手机", "请输入手机号"),
              _mainInfoTab("性别", "请输入性别"),
              _ownershipModel("意向面积", "01"),
              _ownershipModel("意向价格", "02"),
              _ownershipModel("意向楼层", "03"),
              _gradeCustomer("购房用途", _usedOfHouse, _index01),
              _gradeCustomer("关注因素", _attentionHouse, _index02),
              _gradeCustomer("意向房型", _houseType, _index03),
              _gradeCustomer("认知途径", _theWayToKnow, _index06),
              _gradeCustomer("意向产品", _intendedProducts, _index07),
              _gradeCustomer("跟进方式", _followUpWay, _index08),
              _gradeCustomer("意向级别", _intentionLevel, _index09),
              _gradeCustomer("客户来源", _customerFrom, _index10),
              _bottomButton(),
            ],
          ),
        ));
  }

  bool _isExpanded(String dataKey) {
    switch (dataKey) {
      case "购房用途":
        return _isExpanded01;
      case "关注因素":
        return _isExpanded02;
      case "意向房型":
        return _isExpanded03;
      case "意向面积":
        return _isExpanded04;
      case "意向价格":
        return _isExpanded05;
      case "认知途径":
        return _isExpanded06;
      case "意向产品":
        return _isExpanded07;
      case "跟进方式":
        return _isExpanded08;
      case "意向级别":
        return _isExpanded09;
      case "客户来源":
        return _isExpanded10;
    }
  }

  //折叠栏01
  _gradeCustomer(String dataKey, List dataValue, int index) {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        margin: EdgeInsets.only(bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  // "客户等级",
                  dataKey,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                )),
            Container(
                width: 170,
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: ExpansionPanelList(
                  elevation: 0,
                  expansionCallback: (int panelIndex, bool isExpanded) {
                    setState(() {
                      if (dataKey == "购房用途") {
                        _isExpanded01 = !isExpanded;
                      } else if (dataKey == "关注因素") {
                        _isExpanded02 = !isExpanded;
                      } else if (dataKey == "意向房型") {
                        _isExpanded03 = !isExpanded;
                      } else if (dataKey == "意向面积") {
                        _isExpanded04 = !isExpanded;
                      } else if (dataKey == "意向价格") {
                        _isExpanded05 = !isExpanded;
                      } else if (dataKey == "认知途径") {
                        _isExpanded06 = !isExpanded;
                      } else if (dataKey == "意向产品") {
                        _isExpanded07 = !isExpanded;
                      } else if (dataKey == "跟进方式") {
                        _isExpanded08 = !isExpanded;
                      } else if (dataKey == "意向级别") {
                        _isExpanded09 = !isExpanded;
                      } else if (dataKey == "客户来源") {
                        _isExpanded10 = !isExpanded;
                      }
                    });
                  },
                  children: [
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Center(
                          child: Text(
                              // '${level[_levelIndex]}',
                              "  " + dataValue[index] + "  ",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.blue[300],
                                  fontWeight: FontWeight.w500)),
                        );
                      },
                      body: Container(
                        height: 140,
                        child: Scrollbar(
                          child: ListView.builder(
                            reverse: false,
                            itemBuilder: (BuildContext context, int i) {
                              return Card(
                                  margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                  color: Colors.blue[300],
                                  child: InkWell(
                                    child: Container(
                                      height: 45,
                                      alignment: Alignment.center,
                                      child: Text(
                                        // '${level[index]}',
                                        "  " + dataValue[i] + "  ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        if (dataKey == "购房用途") {
                                          _index01 = i;
                                          _isExpanded01 = false;
                                        } else if (dataKey == "关注因素") {
                                          _index02 = i;
                                          _isExpanded02 = false;
                                        } else if (dataKey == "意向房型") {
                                          _index03 = i;
                                          _isExpanded03 = false;
                                        } else if (dataKey == "意向面积") {
                                          _index04 = i;
                                          _isExpanded04 = false;
                                        } else if (dataKey == "意向价格") {
                                          _index05 = i;
                                          _isExpanded05 = false;
                                        } else if (dataKey == "认知途径") {
                                          _index06 = i;
                                          _isExpanded06 = false;
                                        } else if (dataKey == "意向产品") {
                                          _index07 = i;
                                          _isExpanded07 = false;
                                        } else if (dataKey == "跟进方式") {
                                          _index08 = i;
                                          _isExpanded08 = false;
                                        } else if (dataKey == "意向级别") {
                                          _index09 = i;
                                          _isExpanded09 = false;
                                        } else if (dataKey == "客户来源") {
                                          _index10 = i;
                                          _isExpanded10 = false;
                                        }
                                      });
                                    },
                                  ));
                            },
                            itemCount: dataValue.length,
                          ),
                        ),
                      ),
                      isExpanded: _isExpanded(dataKey),
                    ),
                  ],
                )),
          ],
        ));
  }

  _ownershipModel(String left, String rightNum) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
            child: Text(
              left,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
          ),
          if (rightNum == '01') _moderRight01(),
          if (rightNum == '02') _moderRight02(),
          if (rightNum == '03') _moderRight03(),
          // if (rightNum == '05') _moderRight05(),
        ],
      ),
    );
  }

  _moderRight01() {
    return Row(
      children: <Widget>[
        _mustTOFill("面积"),
        Container(
          margin: EdgeInsets.fromLTRB(3, 0, 3, 0),
          child: Text('-', style: TextStyle(fontSize: 20, color: Colors.grey)),
        ),
        _mustTOFill("面积"),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child:
              Text('    ㎡', style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
      ],
    );
  }

  _moderRight02() {
    return Row(
      children: <Widget>[
        _mustTOFill("价格"),
        Container(
          margin: EdgeInsets.fromLTRB(3, 0, 3, 0),
          child: Text('-', style: TextStyle(fontSize: 20, color: Colors.grey)),
        ),
        _mustTOFill("价格"),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child:
              Text('元/㎡', style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
      ],
    );
  }

  _moderRight03() {
    return Row(
      children: <Widget>[
        _mustTOFill("楼层"),
        Container(
          margin: EdgeInsets.fromLTRB(3, 0, 3, 0),
          child: Text('-', style: TextStyle(fontSize: 20, color: Colors.grey)),
        ),
        _mustTOFill("楼层"),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child:
              Text('    楼', style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
      ],
    );
  }

  // _moderRight02() {
  //   return Container(
  //     child: Row(
  //       children: <Widget>[
  //         _mustTOFill(),
  //         Container(
  //           child:
  //               Text('㎡', style: TextStyle(fontSize: 15, color: Colors.grey)),
  //         ),
  //         Container(
  //           child: Icon(
  //             Icons.navigate_next,
  //             color: Colors.grey,
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  _mustTOFill(String value) {
    return Container(
        width: 85,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(5.0)),
        child: TextField(
            decoration: InputDecoration(
                hintText: value,
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13.0)),
            keyboardType: TextInputType.phone,
            textAlign: TextAlign.center));
  }

//折叠栏02
  // _payWay() {
  //   return Container(
  //       margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
  //       child: SingleChildScrollView(
  //         child: ExpansionPanelList(
  //           elevation: 0,
  //           expansionCallback: (int panelIndex, bool isExpanded) {
  //             setState(() {
  //               _isExpanded = !isExpanded;
  //             });
  //           },
  //           children: [
  //             ExpansionPanel(
  //               headerBuilder: (BuildContext context, bool isExpanded) {
  //                 return Container(
  //                   margin: EdgeInsets.fromLTRB(12, 10, 0, 0),
  //                   child: Text(_payWayContant,
  //                       style: TextStyle(
  //                           fontSize: 15.0,
  //                           fontWeight: FontWeight.w500,
  //                           color: _payWayContant != "付款方式"
  //                               ? Colors.blue
  //                               : Colors.black54)),
  //                 );
  //               },
  //               body: Row(
  //                 children: <Widget>[
  //                   _payContant('商业付款'),
  //                   _payContant('银行付款'),
  //                   _payContant('就不付款'),
  //                 ],
  //               ),
  //               isExpanded: _isExpanded, // 设置面板的状态，true展开，false折叠
  //             ),
  //           ],
  //         ),
  //       ));
  // }

  // _payContant(String payContant) {
  //   return InkWell(
  //     child: Container(
  //         margin: EdgeInsets.fromLTRB(12, 0, 0, 20),
  //         // height: 50,
  //         // width: 100,
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(5.0),
  //             color: Colors.blue[300]),
  //         child: Container(
  //           padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
  //           child: Text(payContant,
  //               style: TextStyle(fontSize: 16.0, color: Colors.white)),
  //         )),
  //     onTap: () {
  //       setState(() {
  //         _payWayContant = payContant;
  //         _isExpanded = false;
  //       });
  //     },
  //   );
  // }

  _headImage() {
    return Container(
        height: 70,
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xffe5e5e5))),
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "头像",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black54),
              ),
            ),
            Expanded(child: Text("")),
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://www.itying.com/images/flutter/7.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Icon(Icons.navigate_next, color: Colors.grey))
          ],
        ));
  }

  _mainInfoTab(String keyName, String tipsName) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xffe5e5e5))),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              keyName,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: TextField(
              maxLines: 5,
              minLines: 1,
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(
                hintText: tipsName,
                border: InputBorder.none,
                isDense: true,
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
              ),
              // controller: TextEditingController(text: _textFeid),
              // onChanged: (val) {
              //   _textFeid = val;
              // }
            ),
          ),
        ],
      ),
    );
  }

  _bottomButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
      width: 300,
      height: 50,
      child: RaisedButton(
        splashColor: Colors.lightBlueAccent,
        child: Text("提交"),
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
              });
        },
        textColor: Colors.white,
        color: Colors.blue[500],
        elevation: 2,
      ),
    );
  }
}
