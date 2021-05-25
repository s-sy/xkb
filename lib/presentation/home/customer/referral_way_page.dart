import 'package:flutter/material.dart';
import 'package:flutter_ui/presentation/home/customer/bottom_button.dart';

class ReferralWay extends StatefulWidget {
  final Map<String, dynamic> listData;
  ReferralWay({Key key, this.listData}) : super(key: key);

  @override
  _ReferralWayState createState() => _ReferralWayState();
}

class _ReferralWayState extends State<ReferralWay> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Row(
    //     children: <Widget>[
    //       Container(
    //         child: Text(
    //           '经纪人：',
    //           style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
    //         ),
    //       ),
    //       Container(
    //         margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
    //         child: Text(
    //           '赵四',
    //           style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
    //         ),
    //       ),
    //       Container(
    //           margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
    //           child: Icon(Icons.phone, color: Colors.green)),
    //     ],
    //   ),
    // );
    // return Container(
    //     margin: EdgeInsets.only(top: 40),
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         SizedBox(width: 20),
    //         Text("经纪人:"),
    //         SizedBox(width: 10),
    //         Text(widget.listData['brokerName'] + " "),
    //         RaisedButton(
    //           onPressed: () {
    //             print(widget.listData);
    //           },
    //           child: Text("点击"),
    //         )
    //       ],
    //     ));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          way_head(),
          Expanded(
              child: Stepper(
            currentStep: _currentStep,
            onStepTapped: (int value) {
              // 点击步骤的序号触发的方法
              setState(() {
                _currentStep = value;
              });
            },
            //修改确认和取消的按钮
            controlsBuilder: (BuildContext context,
                {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return Row(
                children: <Widget>[],
              );
            },
            steps: <Step>[
              Step(
                  title: Text('2020-09-07 10:35'),
                  // subtitle: Text('跟进人 刘聪'),
                  content: step_content('预约9月3号盛世江尚看房'),
                  isActive: _currentStep == 0),
              Step(
                title: Text('2020-09-07 10:35'),
                content: step_content('预约9月3号盛世江尚看房'),
              ),
              Step(
                title: Text('2020-09-07 10:35'),
                content: step_content('预约9月3号盛世江尚看房'),
              ),
              Step(
                title: Text('2020-09-07 10:35'),
                content: step_content('预约9月3号盛世江尚看房'),
              ),
              Step(
                title: Text('2020-09-07 10:35'),
                content: step_content('预约9月3号盛世江尚看房'),
              ),
            ],
          )),
          // BottomButton(),
        ],
      ),
    );
  }

  //转介头部
  way_head() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              '转介(1)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                child: Text(
                  '经纪人:',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: Text(
                  // '赵四',
                  widget.listData['brokerName'] + " ",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Icon(Icons.phone, color: Colors.green)),
            ],
          )
        ],
      ),
    );
  }

  //进度的内容
  step_content(String content) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      width: MediaQuery.of(context).size.width,
      // decoration:
      //     BoxDecoration(border: Border.all(width: 1.0)),
      child: Text(content),
    );
  }
}
