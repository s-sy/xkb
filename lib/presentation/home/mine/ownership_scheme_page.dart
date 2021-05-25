import 'package:flutter/material.dart';

class OwnershipSchemePage extends StatefulWidget {
  OwnershipSchemePage({Key key}) : super(key: key);

  @override
  _OwnershipSchemePageState createState() => _OwnershipSchemePageState();
}

class _OwnershipSchemePageState extends State<OwnershipSchemePage> {
  bool _isExpanded = false;
  bool _isExpanded02 = false;
  String _payWayContant = "付款方式";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('置业计划')),
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _ownershipModel('客户', '01'),
              _ownershipModel('面积', '02'),
              _ownershipModel('认购日期', '03'),
              _ownershipModel('预估单价', '04'),
              _ownershipModel('预估总价', '05'),
              _payWay(),
              _newPayWay(),
              _otherCost(),
            ],
          ),
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
          if (rightNum == '04') _moderRight04(),
          if (rightNum == '05') _moderRight05(),
        ],
      ),
    );
  }

  _moderRight01() {
    return Container(
      width: 150,
      // decoration: BoxDecoration(color: Colors.grey[100]),
      child: TextField(
        decoration: InputDecoration(
            hintText: '请输入手机号码查询',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 15.0)),
        keyboardType: TextInputType.phone,
      ),
    );
  }

  _moderRight02() {
    return Container(
      child: Row(
        children: <Widget>[
          _mustTOFill(),
          Container(
            child:
                Text('㎡', style: TextStyle(fontSize: 15, color: Colors.grey)),
          ),
          Container(
            child: Icon(
              Icons.navigate_next,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  _moderRight03() {
    return Row(
      children: <Widget>[
        Container(
          child:
              Text('请选择', style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
        Icon(
          Icons.navigate_next,
          color: Colors.grey,
        ),
      ],
    );
  }

  _moderRight04() {
    return Row(
      children: <Widget>[
        _mustTOFill(),
        Container(
          margin: EdgeInsets.fromLTRB(3, 0, 3, 0),
          child: Text('-', style: TextStyle(fontSize: 20, color: Colors.grey)),
        ),
        _mustTOFill(),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child:
              Text('元/㎡', style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
      ],
    );
  }

  _moderRight05() {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
          child: Text('0', style: TextStyle(fontSize: 15, color: Colors.grey)),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Text('元', style: TextStyle(fontSize: 14, color: Colors.grey)),
        )
      ],
    );
  }

  //付款方式折叠栏
  _payWay() {
    //  Container(
    //         width: 130,
    //         margin: EdgeInsets.fromLTRB(20, 10, 10, 0),
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
    //                 return Center(
    //                   child: Text('${level[_levelIndex]}',
    //                       style: TextStyle(
    //                           fontSize: 16.0,
    //                           color: Colors.blue,
    //                           fontWeight: FontWeight.w500)),
    //                 );
    //               },
    //               body: Container(
    //                 height: 140,
    //                 child: Scrollbar(
    //                   child: ListView.builder(
    //                     reverse: false,
    //                     itemBuilder: (BuildContext context, int index) {
    //                       return Card(
    //                           margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
    //                           color: Colors.grey[200],
    //                           child: InkWell(
    //                             child: Container(
    //                               height: 40,
    //                               alignment: Alignment.center,
    //                               child: Text(
    //                                 '${level[index]}',
    //                                 style: TextStyle(
    //                                     color: Colors.grey[700],
    //                                     fontWeight: FontWeight.w500,
    //                                     fontSize: 16),
    //                               ),
    //                             ),
    //                             onTap: () {
    //                               setState(() {
    //                                 _levelIndex = index;
    //                                 _isExpanded = false;
    //                               });
    //                             },
    //                           ));
    //                     },
    //                     itemCount: 4,
    //                   ),
    //                 ),
    //               ),
    //               isExpanded: _isExpanded, // 设置面板的状态，true展开，false折叠
    //             ),
    //           ],
    //         )),

    return Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: SingleChildScrollView(
          child: ExpansionPanelList(
            elevation: 0,
            expansionCallback: (int panelIndex, bool isExpanded) {
              setState(() {
                _isExpanded = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(12, 10, 0, 0),
                    child: Text(_payWayContant,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: _payWayContant != "付款方式"
                                ? Colors.blue
                                : Colors.black54)),
                  );
                },
                body: Row(
                  children: <Widget>[
                    _payContant('商业付款'),
                    _payContant('银行付款'),
                    _payContant('就不付款'),
                  ],
                ),
                isExpanded: _isExpanded, // 设置面板的状态，true展开，false折叠
              ),
            ],
          ),
        ));
  }

  _payContant(String payContant) {
    return InkWell(
      child: Container(
          margin: EdgeInsets.fromLTRB(12, 0, 0, 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.blue[300]),
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text(payContant,
                style: TextStyle(fontSize: 16.0, color: Colors.white)),
          )),
      onTap: () {
        setState(() {
          _payWayContant = payContant;
          _isExpanded = false;
        });
      },
    );
  }

  //新增付款方式
  _newPayWay() {
    return Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.control_point, color: Colors.blue, size: 25.0),
          Text('新增付款方式', style: TextStyle(fontSize: 16.0, color: Colors.blue))
        ],
      ),
    );
  }

  //其他费用,这也是个折叠栏
  _otherCost() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: SingleChildScrollView(
          child: ExpansionPanelList(
            elevation: 0,
            expansionCallback: (int panelIndex, bool isExpanded) {
              setState(() {
                _isExpanded02 = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(12, 10, 0, 0),
                    // decoration: BoxDecoration(border: Border.all(width: 1.0)),
                    child: Row(
                      children: <Widget>[
                        Text('其他费用',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500)),
                        SizedBox(width: 20),
                        Text('调整费用',
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.blue)),
                      ],
                    ),
                  );
                },
                body: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(97, 0, 0, 20),
                      child: Text('其他费用',
                          style: TextStyle(fontSize: 15.0, color: Colors.blue)),
                    )
                  ],
                ),
                isExpanded: _isExpanded02,
              ),
            ],
          ),
        ));
  }

  //必填输入框
  _mustTOFill() {
    return Container(
        width: 85,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(5.0)),
        child: TextField(
            decoration: InputDecoration(
                hintText: '必填',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13.0)),
            keyboardType: TextInputType.phone,
            textAlign: TextAlign.center));
  }
}
