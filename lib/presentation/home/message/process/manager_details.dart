import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/process/bloc/process_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/bean/consultant_bean.dart';
import 'package:flutter_ui/presentation/bean/process_bean.dart';
import 'package:flutter_ui/presentation/components/chat/public.dart';

class ManagerDetails extends StatefulWidget {
  final ProcessBean processBean;

  const ManagerDetails({Key key, this.processBean}) : super(key: key);
  @override
  _ProcessDetailsState createState() => _ProcessDetailsState();
}

class _ProcessDetailsState extends State<ManagerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('${widget.processBean.name}'),
        ),
        body: BlocProvider(
            create: (context) => getIt<ProcessBloc>(),
            child: BlocConsumer<ProcessBloc, ProcessState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Column(
                    children: <Widget>[
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 10),
                              _getHeader("客户信息"),
                              _getDetail(
                                  "客户:", "${widget.processBean.customerName}"),
                              _getDetail("电话:", "${widget.processBean.phone}"),
                              SizedBox(height: 10.0),
                              _getHeader("经纪人信息"),
                              _getDetail(
                                  "用户:", "${widget.processBean.brokerName}"),
                              _getDetail(
                                  "电话:", "${widget.processBean.brokerPhone}"),
                              _getDetail(
                                  "意向:", "${widget.processBean.introduction}"),
                              SizedBox(height: 10.0),
                              _getHeader("置业顾问"),
                              _getDetail(
                                  "用户:", "${widget.processBean.nickName}"),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                        width: 300,
                        height: 50,
                        child: RaisedButton(
                          splashColor: Colors.lightBlueAccent,
                          child: Text("处理"),
                          onPressed: () {},
                          textColor: Colors.white,
                          color: Colors.blue[500],
                          elevation: 2,
                        ),
                      ),
                    ],
                  );
                })));
  }

  _getHeader(String value) {
    return Container(
        width: 100,
        margin: EdgeInsets.fromLTRB(10, 10, 0, 5),
        child: Text(value,
            style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500)));
  }

  _getDetail(String key, String value) {
    return Container(
      height: 25,
      child: Row(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                key,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500),
              )),
          Container(
            width: 200,
            margin: EdgeInsets.only(left: 15),
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
