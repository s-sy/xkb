import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/echarts/echarts_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/home/mine/indicator.dart';

class EchartsAllData extends StatefulWidget {
  @override
  _EchartsAllDataState createState() => _EchartsAllDataState();
}

class _EchartsAllDataState extends State<EchartsAllData> {
  // int touchedIndex;
  int touchedIndex01;
  int touchedIndex02;
  int touchedIndex03;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            getIt<EchartsBloc>()..add(EchartsEvent.getPie()),
        child: BlocConsumer<EchartsBloc, EchartsState>(
          listener: (context, state) async {},
          builder: (BuildContext context, state) {
            return SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.all(7.0),
              child: Column(
                children: [
                  chartTitle("获客渠道"),
                  showCharts(state.sceneList, state.sceneTitle, "01"),
                  chartTitle("人员构成"),
                  showCharts(state.userRoleList, state.userRoleTitle, "02"),
                  chartTitle("获客方式"),
                  Column(
                    children: state.groupList.map((value) {
                      return Container(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5.0),
                              child: Text(
                                value["groupName"],
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            showCharts(value["groupVosList"],
                                value["groupVosTitle"], "03"),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  //                 Padding(
                  //                   padding: const EdgeInsets.only(left: 20, right: 8, top: 10),
                  //                   child: Container(
                  //                     child: Echarts(
                  //                       option: '''
                  //   {
                  //   tooltip: {
                  //            trigger: 'item',
                  //             formatter: '{a} <br/>{b} : {c} ({d}%)'
                  //   },
                  //   legend: {
                  //             orient: 'vertical',
                  //             left: 'left',
                  //             data: ${jsonEncode(state.sceneTitle)}
                  //   },
                  //   series: [
                  //             {
                  //                 name: '客户来源',
                  //                 type: 'pie',
                  //                 radius: '55%',
                  //                 center: ['55%', '38%'],
                  //                 data: ${jsonEncode(state.sceneList)},
                  //                 emphasis: {
                  //                     itemStyle: {
                  //                         shadowBlur: 10,
                  //                         shadowOffsetX: 0,
                  //                         shadowColor: 'rgba(0, 0, 0, 0.5)'
                  //                     }
                  //                 }
                  //             }
                  //   ]
                  //   }
                  // ''',
                  //                     ),
                  //                     height: 250,
                  //                   ),
                  //                 ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 8, top: 10),
//                     child: Container(
//                       child: Echarts(
//                         option: '''
//                         {
//     tooltip: {
//              trigger: 'item',
//               formatter: '{a} <br/>{b} : {c} ({d}%)'
//     },
//     legend: {
//               orient: 'vertical',
//               left: 'left',
//               data: ${jsonEncode(state.userRoleTitle)}
//     },
//     series: [
//               {
//                   name: '人员构成',
//                   type: 'pie',
//                   radius: '55%',
//                   center: ['55%', '38%'],
//                   data: ${jsonEncode(state.userRoleList)},
//                   emphasis: {
//                       itemStyle: {
//                           shadowBlur: 10,
//                           shadowOffsetX: 0,
//                           shadowColor: 'rgba(0, 0, 0, 0.5)'
//                       }
//                   }
//               }
//     ]
// }
//   ''',
//                       ),
//                       height: 250,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 8, top: 10),
//                     child: Column(
//                       children: state.groupList.map((value) {
//                         return Container(
//                           child: Column(
//                             children: [
//                               Container(
//                                 child: Text(value["groupName"]),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 20, right: 8, top: 10),
//                                 child: Container(
//                                   child: Echarts(
//                                     option: '''
//     {
//     tooltip: {
//              trigger: 'item',
//               formatter: '{a} <br/>{b} : {c} ({d}%)'
//     },
//     legend: {
//               orient: 'vertical',
//               left: 'left',
//               data: ${jsonEncode(value['groupVosTitle'])}
//     },
//     series: [
//               {
//                   name: '流程',
//                   type: 'pie',
//                   radius: '55%',
//                   center: ['55%', '38%'],
//                   data: ${jsonEncode(value['groupVosList'])},
//                   emphasis: {
//                       itemStyle: {
//                           shadowBlur: 10,
//                           shadowOffsetX: 0,
//                           shadowColor: 'rgba(0, 0, 0, 0.5)'
//                       }
//                   }
//               }
//     ]
// }
//   ''',
//                                   ),
//                                   height: 250,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
                ],
              ),
            ));
          },
        ));
  }

  chartTitle(String name) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(name,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
    );
  }

  showCharts(List list, List listTitle, String key) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        color: Colors.grey[100],
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                    pieTouchData:
                        PieTouchData(touchCallback: (pieTouchResponse) {
                      setState(() {
                        if (pieTouchResponse.touchInput is FlLongPressEnd ||
                            pieTouchResponse.touchInput is FlPanEnd) {
                          if (key == "01") {
                            touchedIndex01 = -1;
                          } else if (key == "02") {
                            touchedIndex02 = -1;
                          } else if (key == "03") {
                            touchedIndex03 = -1;
                          }
                          // touchedIndex = -1;
                        } else {
                          if (key == "01") {
                            touchedIndex01 =
                                pieTouchResponse.touchedSectionIndex;
                          } else if (key == "02") {
                            touchedIndex02 =
                                pieTouchResponse.touchedSectionIndex;
                          } else if (key == "03") {
                            touchedIndex03 =
                                pieTouchResponse.touchedSectionIndex;
                          }
                          // touchedIndex = pieTouchResponse.touchedSectionIndex;
                        }
                      });
                    }),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections(list, key)),
              ),
            ),
            Expanded(child: SizedBox()),
            Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: 115,
                      child: showTitle(listTitle)),
                ]),
          ],
        ),
      ),
    );
  }

  showTitle(List list) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 0),
        scrollDirection: Axis.vertical,
        reverse: false,
        primary: true,
        shrinkWrap: true,
        itemCount: list.length,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemBuilder: (context, i) => Container(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Indicator(
                color: getColor(list[i]),
                text: list[i] + " ",
                isSquare: true,
              ),
            )));
  }

  getColor(String name) {
    switch (name) {
      //获客渠道
      case "公众号菜单":
        return Colors.brown;
      case "网站":
        return Colors.green;
      case "业务员":
        return Colors.yellow;
      case "经纪人":
        return Colors.purple;
      case "pla":
        return Colors.grey;
      case "未知":
        return Colors.blue;
      //人员构成
      case "注册经纪人":
        return Colors.purple;
      case "普通经纪人":
        return Colors.blue;
      case "中介公司":
        return Colors.brown;
      case "内部员工(非销售岗)":
        return Colors.yellow;
      case "内部员工(销售岗)":
        return Colors.grey;
      case "业主":
        return Colors.green;
      //获客方式
      case "全名经纪推荐":
        return Colors.green;
      case "自有客户":
        return Colors.blue;
      case "隐号客户":
        return Colors.brown;
      case "平台获客":
        return Colors.yellow;
    }
  }

  // ignore: missing_return
  List<PieChartSectionData> showingSections(List list, String key) {
    if (key == "01") {
      return List.generate(list.length, (i) {
        final isTouched = i == touchedIndex01;
        final double fontSize = isTouched ? 25 : 16;
        final double radius = isTouched ? 60 : 50;
        return PieChartSectionData(
          color: getColor(list[i]["name"]),
          value: list[i]["value"] * 1.0,
          title: list[i]["value"].toString(),
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      });
    } else if (key == "02") {
      return List.generate(list.length, (i) {
        final isTouched = i == touchedIndex02;
        final double fontSize = isTouched ? 25 : 16;
        final double radius = isTouched ? 60 : 50;
        return PieChartSectionData(
          color: getColor(list[i]["name"]),
          value: list[i]["value"] * 1.0,
          title: list[i]["value"].toString(),
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      });
    } else if (key == "03") {
      return List.generate(list.length, (i) {
        final isTouched = i == touchedIndex03;
        final double fontSize = isTouched ? 25 : 16;
        final double radius = isTouched ? 60 : 50;
        return PieChartSectionData(
          color: getColor(list[i]["name"]),
          value: list[i]["value"] * 1.0,
          title: list[i]["value"].toString(),
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      });
    }
  }
}
