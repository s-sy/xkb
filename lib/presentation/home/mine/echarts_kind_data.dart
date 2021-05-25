import 'dart:convert';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:flutter_ui/application/echarts/echarts_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/home/mine/indicator.dart';

class EchartsKindData extends StatefulWidget {
  @override
  _EchartsKindDataState createState() => _EchartsKindDataState();
}

class _EchartsKindDataState extends State<EchartsKindData> {
  // String weekday = "";
  List listDay = ["本周1", "本周2", "本周3", "本周4", "本周5", "本周6", "本周7"];
  List listMonth = [];
  List listWeek = [];
  String month = "";
  String day = "";
  String week = "";
  int portion = DateTime.now().month;
  int touchedIndex01;
  int touchedIndex02;
  int touchedIndex03;
  bool isDay = false;
  bool isMonth = true;
  bool isWeek = false;

  @override
  void initState() {
    super.initState();
    var today = DateTime.now();
    int iMonth = today.month;
    List list = [];
    for (int i = 1; i <= iMonth; i++) {
      list.add(i.toString() + "月");
    }
    setState(() {
      day = "本周" + today.weekday.toString();
      month = "本月";
      listMonth = list;
      week = "周";
    });
    BlocProvider.of<EchartsBloc>(context)
      ..add(EchartsEvent.getDuration(2, DateTime.now().month, "本月"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EchartsBloc, EchartsState>(
      listener: (context, state) {
        // if (state.isMonth && month != "本月") {
        //   setState(() {
        //     week = "第一周";
        //   });
        // }
      },
      builder: (context, state) {
        // return BlocProvider(
        //     create: (BuildContext context) => getIt<EchartsBloc>()
        //       // ..add(EchartsEvent.getDuration(1, DateTime.now().month, "今天")),
        //       ..add(EchartsEvent.getDuration(2, DateTime.now().month, "本周")),
        //     child: BlocConsumer<EchartsBloc, EchartsState>(
        //       listener: (context, state) async {
        //         if (state.isMonth) {
        //           setState(() {
        //             week = "第一周";
        //           });
        //         }
        //         print(state.kindGroupList);
        //       },
        //       builder: (BuildContext context, state) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text(month),
                    color: isMonth ? Colors.blue : Colors.white,
                    textColor: isMonth ? Colors.white : Colors.grey,
                    splashColor: Colors.lightBlueAccent,
                    onPressed: () {
                      getshowModalBottomSheet(listMonth, "month");
                    },
                  ),
                  // SizedBox(width: 20),
                  RaisedButton(
                    child: Text(week),
                    color: isWeek ? Colors.blue : Colors.white,
                    textColor: isWeek ? Colors.white : Colors.grey,
                    splashColor: Colors.lightBlueAccent,
                    onPressed: () {
                      if (isMonth) {
                        getshowModalBottomSheet(countWeek(state), "week");
                      }
                    },
                  ),
                  // SizedBox(width: 20),
                  RaisedButton(
                    child: Text(day),
                    color: isDay ? Colors.blue : Colors.white,
                    textColor: isDay ? Colors.white : Colors.grey,
                    splashColor: Colors.lightBlueAccent,
                    onPressed: () {
                      getshowModalBottomSheet(listDay, "day");
                    },
                  ),
                ],
              ),
              chartTitle("获客渠道"),
              showCharts(state.kindSceneList, state.kindSceneTitle, "01"),
              chartTitle("人员构成"),
              showCharts(state.kindUserRoleList, state.kindUserRoleTitle, "02"),
              chartTitle("获客方式"),
              // if (!state.isMonth && month != "本月")
              Column(
                children: state.kindGroupList.map((value) {
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
//               if (state.isMonth || month == "本月")
//                 Column(
//                   children: state.kindGroupList.map((value) {
//                     return Container(
//                       child: Column(
//                         children: [
//                           // Container(
//                           //   child: Text(value["groupName"]),
//                           // ),
//                           Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 20, right: 8, top: 10),
//                             child: Container(
//                               child: Echarts(
//                                 option: '''
// {
//     tooltip: {
//         trigger: 'axis',
//         axisPointer: {            // 坐标轴指示器，坐标轴触发有效
//             type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
//         }
//     },
//     legend: {
//         data: ${jsonEncode(state.weekTitle)},
//     },
//     grid: {
//         left: '3%',
//         right: '4%',
//         bottom: '3%',
//         containLabel: true
//     },
//     xAxis: [
//         {
//             type: 'category',
//             data: ['第1周', '第2周', '第3周', '第4周', '第5周', '第5周']
//         }
//     ],
//     yAxis: [
//         {
//             type: 'value'
//         }
//     ],
//     series: [
//         {
//             name: '直接访问',
//             type: 'bar',
//             emphasis: {
//                 focus: 'series'
//             },
//             data: [320, 332, 301, 334, 390, 330, 320]
//         },
//         {
//             name: '邮件营销',
//             type: 'bar',
//             stack: '广告',
//             emphasis: {
//                 focus: 'series'
//             },
//             data: [120, 132, 101, 134, 90, 230, 210]
//         },
//         {
//             name: '联盟广告',
//             type: 'bar',
//             stack: '广告',
//             emphasis: {
//                 focus: 'series'
//             },
//             data: [220, 182, 191, 234, 290, 330, 310]
//         },
//         {
//             name: '视频广告',
//             type: 'bar',
//             stack: '广告',
//             emphasis: {
//                 focus: 'series'
//             },
//             data: [150, 232, 201, 154, 190, 330, 410]
//         },
//         {
//             name: '搜索引擎',
//             type: 'bar',
//             data: [862, 1018, 964, 1026, 1679, 1600, 1570],
//             emphasis: {
//                 focus: 'series'
//             },
//         },
//         {
//             name: '百度',
//             type: 'bar',
//             barWidth: 5,
//             stack: '搜索引擎',
//             emphasis: {
//                 focus: 'series'
//             },
//             data: [620, 732, 701, 734, 1090, 1130, 1120]
//         },
//         {
//             name: '谷歌',
//             type: 'bar',
//             stack: '搜索引擎',
//             emphasis: {
//                 focus: 'series'
//             },
//             data: [120, 132, 101, 134, 290, 230, 220]
//         },
//         {
//             name: '必应',
//             type: 'bar',
//             stack: '搜索引擎',
//             emphasis: {
//                 focus: 'series'
//             },
//             data: [60, 72, 71, 74, 190, 130, 110]
//         },
//         {
//             name: '其他',
//             type: 'bar',
//             stack: '搜索引擎',
//             emphasis: {
//                 focus: 'series'
//             },
//             data: [62, 82, 91, 84, 109, 110, 120]
//         }
//     ]
// }
//   ''',
//                               ),
//                               height: 250,
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }).toList(),
//                 ),

              SizedBox(height: 50),
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
//               data: ${jsonEncode(state.kindUserRoleTitle)}
//     },
//     series: [
//               {
//                   name: '访问来源',
//                   type: 'pie',
//                   radius: '55%',
//                   center: ['55%', '38%'],
//                   data: ${jsonEncode(state.kindUserRoleList)},
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
//                       children: state.kindGroupList.map((value) {
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
//                   name: '访问来源',
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
        );
//             return SingleChildScrollView(
//               child: Column(children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     child: Echarts(
//                       option: '''
// {
//     backgroundColor: '#0f375f',
//     tooltip: {
//         trigger: 'axis',
//         axisPointer: {
//             type: 'shadow'
//         }
//     },
//     legend: {
//         data: ${jsonEncode(state.legendData)},
//         textStyle: {
//             color: '#ccc'
//         }
//     },
//     xAxis: {
//         data: ${jsonEncode(state.oneXAxisList)},
//         axisLine: {
//             lineStyle: {
//                 color: '#ccc'
//             }
//         }
//     },
//     yAxis: {
//         splitLine: {show: false},
//         axisLine: {
//             lineStyle: {
//                 color: '#ccc'
//             }
//         }
//     },
//     series: ${jsonEncode(state.series)}
// }
//   ''',
//                     ),
//                     height: 250,
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     OutlineButton(
//                       borderSide: state.duration == 1
//                           ? BorderSide(color: Colors.blue)
//                           : BorderSide(color: Colors.grey[100]),
//                       child: Text("周"),
//                       onPressed: () {
//                         BlocProvider.of<EchartsBloc>(context)
//                           ..add(EchartsEvent.changeDurtion(1))
//                           ..add(EchartsEvent.getDuration());
//                       },
//                     ),
//                     SizedBox(width: 20),
//                     OutlineButton(
//                       borderSide: state.duration == 2
//                           ? BorderSide(color: Colors.blue)
//                           : BorderSide(color: Colors.grey[100]),
//                       child: Text("${state.portion}月"),
//                       onPressed: () {
//                         this.getshowModalBottomSheet(state.monthList);
//                       },
//                     )
//                   ],
//                 ),
//               ]),
        // );
      },
    );
  }

  countWeek(state) {
    List list = [];
    for (int i = 1; i <= state.countWeek; i++) {
      list.add("第" + i.toString() + "周");
    }
    return list;
  }

  int getnowweek() {
    var time = new DateTime.now(); //当前时间
    int day = time.day; //今天几号
    int week = time.weekday; // 今天周几
    while (true) {
      week--;
      day--;
      if (week == 0) {
        week = 7;
      }
      if (day == 1) {
        break;
      }
    }
    int k = 1;
    int y = 1;
    print(week);
    while (true) {
      week++;
      y++;
      if (week == 8) {
        k++;
        week = 1;
      }
      if (y == time.day) {
        break;
      }
    }
    print(k); //这个月的第几周
    return k;
  }

  Future getshowModalBottomSheet(List list, String key) async {
    await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 230.0,
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, i) => InkWell(
                    child: Container(
                      height: 55,
                      child: Center(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            list[i],
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      setState(() {
                        if (key == "month") {
                          month = list[i];
                          portion = i + 1;
                          isMonth = true;
                          isWeek = false;
                          isDay = false;
                          week = "周";
                        } else if (key == "week") {
                          week = list[i];
                          isWeek = true;
                          isMonth = true;
                          isDay = false;
                        } else if (key == "day") {
                          day = list[i];
                          isDay = true;
                          isMonth = false;
                          isWeek = false;
                        }
                      });
                      Navigator.pop(context, true);
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
                    style: TextStyle(color: Colors.blue[200])),
                onTap: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          );
        }).then((value) {
      if (value != null && value) {
        if (key == "month") {
          BlocProvider.of<EchartsBloc>(context)
            ..add(EchartsEvent.getDuration(2, portion, month));
        } else if (key == "week") {
          BlocProvider.of<EchartsBloc>(context)
            ..add(EchartsEvent.getDuration(2, portion, week));
        } else if (key == "day") {
          BlocProvider.of<EchartsBloc>(context)
            ..add(EchartsEvent.getDuration(1, DateTime.now().month, day));
        }
      }
    });
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
