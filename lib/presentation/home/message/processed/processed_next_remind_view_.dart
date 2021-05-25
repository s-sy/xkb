import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_ui/application/coustomer/coustomer_bloc.dart';
import 'package:flutter_ui/application/messages/processed/processed_bloc.dart';

class NextRemindView extends StatefulWidget {
  @override
  _NextRemindViewState createState() => _NextRemindViewState();
}

class _NextRemindViewState extends State<NextRemindView> {
  String showStringDate = "";
  String nextTime = "选择时间";
  // ddd(){
  //   Container(
  //           child: Row(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: <Widget>[
  //               Container(
  //                   margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
  //                   child: _isRemind
  //                       ? Icon(Icons.error_outline, color: Colors.red)
  //                       : Text("")),
  //               Container(
  //                 width: 85,
  //                 child: DateTimePicker(
  //                   decoration: InputDecoration(border: InputBorder.none),
  //                   type: DateTimePickerType.dateTime,
  //                   style: TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.w500,
  //                       color: _isTimeChanged ? Colors.blue : Colors.grey),
  //                   dateMask: 'yyyy-MM-dd',
  //                   controller: _controller2,
  //                   firstDate:
  //                       DateTime.parse(DateTime.now().toString()).toLocal(),
  //                   lastDate: DateTime(2100),
  //                   use24HourFormat: true,
  //                   locale: Locale('zh', 'CH'),
  //                   onChanged: (val) {
  //                     setState(() {
  //                       _valueChanged2 = val;
  //                       _isTimeChanged = true;
  //                     });
  //                 ),
  //               ),
  // }
  List list = [];
  // Future _openModalBottomSheetText() async {
  //   final option = await showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Container(
  //               // decoration: BoxDecoration(color: Colors.yellow),
  //               height: 250.0,
  //               child: ListView.builder(
  //                 itemCount: list.length,
  //                 itemBuilder: (context, i) => InkWell(
  //                   child: Container(
  //                     height: 60,
  //                     child: Center(
  //                       child: SingleChildScrollView(
  //                         physics: BouncingScrollPhysics(),
  //                         scrollDirection: Axis.horizontal,
  //                         child: Text(
  //                           list[i],
  //                           style: TextStyle(
  //                               color: Colors.grey[600],
  //                               fontSize: 15,
  //                               fontWeight: FontWeight.w500),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   onTap: () async {},
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             ListTile(
  //               title: Text('取消',
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(color: Colors.blue[200])),
  //               onTap: () {
  //                 Navigator.pop(context, '取消');
  //               },
  //             ),
  //           ],
  //         );
  //       });
  //   // print(option);
  // }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   BlocProvider.of<ProcessedBloc>(context)
  //     ..add(ProcessedEvent.getNextTimeData("123"));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProcessedBloc, ProcessedState>(
        listener: (context, state) {
      this.list = state.dateList;
      // print(state.microseconds);
      // if (state.processedItem['taskDefinitionKey'] == 'CategoryManagent' ||
      //     state.processedItem['taskDefinitionKey'] == "Activity_0vv7s63") {
      //   List lists = [];
      //   double date = state.microseconds / (24 * 60);
      //   print(date.floor());
      //   int time = date.floor();
      //   for (var i = 1; i <= time; i++) {
      //     lists.add("${i}天");
      //   }
      //   setState(() {
      //     list = lists;
      //   });
      // }
      // if (state.processedItem['taskDefinitionKey'] == 'Activity_0qvod3g') {
      //   var iss = state.enrecommendDate.difference(new DateTime.now());

      //   List lists = [];
      //   int time = iss.inDays;
      //   for (var i = 1; i <= time; i++) {
      //     lists.add("${i}天");
      //   }
      //   setState(() {
      //     list = lists;
      //   });
      // }
      // if (state.processedItem['taskDefinitionKey'] == 'Activity_1h77h4t' ||
      //     state.processedItem['taskDefinitionKey'] == 'Activity_0qk9snp') {
      //   List lists = [];
      //   int count = 20;
      //   for (var i = 1; i <= count; i++) {
      //     lists.add("${i}天");
      //   }
      //   setState(() {
      //     list = lists;
      //   });
      // }
    }, builder: (context, state) {
      return Container(
          padding: EdgeInsets.only(left: 10, right: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "下次提醒",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700]),
                  ),
                  //DropdownButton(items: [Text("123"),Text("456")], onChanged: (value) {  },)
                  Text(showStringDate,
                      style: TextStyle(
                        color: state.changTextColor ? Colors.red : Colors.blue,
                      )),

                  OutlineButton(
                      child: Text(
                        "${this.nextTime}",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      onPressed: () async {
                        await showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 250.0,
                                    child: ListView.builder(
                                      itemCount: state.dateList.length,
                                      itemBuilder: (context, i) => InkWell(
                                        child: Container(
                                          height: 60,
                                          child: Center(
                                            child: SingleChildScrollView(
                                              physics: BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                state.dateList[i],
                                                style: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ),
                                        onTap: () async {
                                          Navigator.of(context)
                                              .pop(state.dateList[i]);
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListTile(
                                    title: Text('取消',
                                        textAlign: TextAlign.center,
                                        style:
                                            TextStyle(color: Colors.blue[200])),
                                    onTap: () {
                                      Navigator.pop(context, '取消');
                                    },
                                  ),
                                ],
                              );
                            }).then((value) {
                          print(value);
                          var stringValue = value.toString().split("");
                          print(stringValue);
                          if (stringValue[stringValue.length - 1] == '天') {
                            BlocProvider.of<ProcessedBloc>(context)
                                .add(ProcessedEvent.saveNextDate(value));
                            setState(() {
                              nextTime = value;
                            });
                          }
                        });
                      }),
                ],
              ),
              state.changTextColor
                  ? Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Text(
                            "请从新选择时间",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    )
                  : SizedBox()
            ],
          ));
    });
  }
}
