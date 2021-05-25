import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_ui/application/coustomer/coustomer_bloc.dart';
import 'package:flutter_ui/application/messages/processed/processed_bloc.dart';
import 'package:flutter_ui/presentation/core/fintness_app_theme.dart';

class AssessView extends StatefulWidget {
  @override
  _AssessViewState createState() => _AssessViewState();
}

class _AssessViewState extends State<AssessView> {
  var pf = ['A', 'B', 'C', 'D'];
  var rate = "选择等级";
  List<Widget> getListWidgets() {
    List<Widget> list = [];

    for (int i = 0; i < 4; i++) {
      list.add(Container(
        child: Text(pf[i]),
      ));
    }
    return list;
  }

  Future _openModalBottomSheetText() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                  height: 250.0,
                  // height: 100.0,
                  child: ListView.builder(
                      itemCount: pf.length,
                      itemBuilder: (context, i) => InkWell(
                            child: Container(
                              height: 60,
                              child: Center(
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    pf[i],
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () async {
                              print("123");

                              Navigator.of(context).pop(pf[i]);
                            },
                          ))),
              // ListTile(
              //   title: Text('新增',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(color: Colors.blue)),
              //   onTap: () {
              //     showDialog(
              //         barrierDismissible: true,
              //         context: context,
              //         builder: (context) {
              //           return AlertDialog(
              //             title: Text("提示"),
              //             content: TextField(
              //               maxLines: 5,
              //               minLines: 1,
              //               textInputAction: TextInputAction.go,
              //               decoration: InputDecoration(
              //                 hintText: '请输入内容(不能用新增吧)',
              //                 border: InputBorder.none,
              //                 isDense: true,
              //                 hintStyle: TextStyle(color: Colors.grey[400]),
              //               ),
              //             ),
              //             actions: <Widget>[
              //               FlatButton(
              //                 child: Text("确定"),
              //                 onPressed: () {
              //                   Navigator.of(context).pop(true);
              //                 },
              //               )
              //             ],
              //           );
              //         });
              //   },
              // ),
              ListTile(
                title: Text('取消',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue[200])),
                onTap: () {
                  Navigator.pop(context, '取消');
                },
              ),
              SizedBox(
                height: 50,
              )
            ],
          );
        }).then((value) {
      if (value == 'A' || value == 'B' || value == 'C' || value == 'D') {
        setState(() {
          rate = value;
        });
        if (value == 'D') {
          BotToast.showText(text: "评D后其他顾问可重新发起跟踪流程");
        }
        BlocProvider.of<ProcessedBloc>(context)
            .add(ProcessedEvent.saveRate(value));
      } else if (value == '取消') {
        setState(() {
          rate = "选择等级";
        });
      }
    });
    // print(option);
  }

  List<Widget> getListWidegt() {
    List<Widget> list = [];
    for (int i = 0; i < pf.length; i++) {
      list.add(OutlineButton(
        onPressed: () {
          print(pf[i]);
          // BotB
          // BotToast.showAttachedWidget(attachedBuilder: null);
          setState(() {
            rate = pf[i];
          });

          BlocProvider.of<ProcessedBloc>(context)
              .add(ProcessedEvent.saveRate(pf[i]));
        },
        child: Text(pf[i]),
        // borderSide: BorderSide(
        //     color: BlocProvider.of<ProcessedBloc>(context).state.rate == pf[i]
        //         ? Colors.blue
        //         : Colors.grey)
      ));
    }
    return list;
  }

  @override
  void initState() {
    BlocProvider.of<ProcessedBloc>(context)..add(ProcessedEvent.getRate());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProcessedBloc, ProcessedState>(
        builder: (context, state) {
      return Container(
        //  margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.only(left: 10, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: <Widget>[
                Container(
                  child: Text(
                    "客户等级:",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700]),
                  ),
                ),
                if (state.rateList.length != 0 && rate == "选择等级")
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      // "客户等级",
                      state.rateList[0]['grade'] != null
                          ? state.rateList[0]['grade']
                          : "暂无评级",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: FitnessAppTheme.lightText
                          // Colors.grey[700]
                          ),
                    ),
                  ),
              ],
            ),
            // Container(
            //   width: 100,
            //   child: CupertinoPicker(
            //     itemExtent: 28,
            //     onSelectedItemChanged: (position) {
            //       print("the position is $position");
            //       BlocProvider.of<ProcessedBloc>(context)
            //           .add(ProcessedEvent.saveRate(pf[position]));
            //     },
            //     children: getListWidgets(),
            //   ),
            // ),
            Container(
              child: OutlineButton(
                  child: Text(
                    rate,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  onPressed: () {
                    print(state.processedData);
                    this._openModalBottomSheetText();
                    // BotToast.showAttachedWidget(
                    //     // crossPage:false,
                    //     enableSafeArea: true,
                    //     targetContext: context,
                    //     attachedBuilder: (context) {
                    //       return SingleChildScrollView(
                    //           physics: BouncingScrollPhysics(),
                    //           scrollDirection: Axis.horizontal,
                    //           child: Container(
                    //             decoration: BoxDecoration(
                    //                 color: Colors.white,
                    //                 borderRadius: BorderRadius.circular(10.0)),
                    //             margin: EdgeInsets.only(left: 20, right: 20),
                    //             padding: EdgeInsets.only(left: 5, right: 5),
                    //             child: Row(
                    //               mainAxisAlignment:
                    //                   MainAxisAlignment.spaceAround,
                    //               children: getListWidegt(),
                    //             ),
                    //           ));
                    //     });
                  }),
            ),
          ],
        ),
      );
    });
  }
}

// class AssessView extends StatelessWidget {
//   var pf = ['A', 'B', 'C', 'D'];

//   List<Widget> getListWidgets() {
//     List<Widget> list = [];

//     for (int i = 0; i < 4; i++) {
//       list.add(Container(
//         child: Text(pf[i]),
//       ));
//     }
//     return list;
//   }

//   List<Widget> getListWidegt(context) {
//     List<Widget> list = [];
//     for (int i = 0; i < pf.length; i++) {
//       list.add(
//           BlocBuilder<ProcessedBloc, ProcessedState>(builder: (context, state) {
//         return OutlineButton(
//             onPressed: () {
//               print(pf[i]);
//               // BotB
//               // BotToast.showAttachedWidget(attachedBuilder: null);
//               BlocProvider.of<ProcessedBloc>(context)
//                   .add(ProcessedEvent.saveRate(pf[i]));
//             },
//             child: Text(pf[i]),
//             borderSide: BorderSide(
//                 color: state.rate == pf[i] ? Colors.blue : Colors.grey));
//       }));
//     }
//     return list;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //  margin: EdgeInsets.only(top: 30),
//       padding: EdgeInsets.only(left: 30, right: 30),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             child: Text(
//               "客户评价",
//               style: TextStyle(fontSize: 18),
//             ),
//           ),
//           // Container(
//           //   width: 100,
//           //   child: CupertinoPicker(
//           //     itemExtent: 28,
//           //     onSelectedItemChanged: (position) {
//           //       print("the position is $position");
//           //       BlocProvider.of<ProcessedBloc>(context)
//           //           .add(ProcessedEvent.saveRate(pf[position]));
//           //     },
//           //     children: getListWidgets(),
//           //   ),
//           // ),
//           Container(
//             child: OutlineButton(
//                 child: Text("评价"),
//                 onPressed: () {
//                   BotToast.showAttachedWidget(
//                       // crossPage:false,

//                       enableSafeArea: true,
//                       targetContext: context,
//                       attachedBuilder: (context) {
//                         return Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10.0)),
//                           margin: EdgeInsets.only(left: 20, right: 20),
//                           padding: EdgeInsets.only(left: 5, right: 5),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: getListWidegt(context)),
//                         );
//                       });
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
