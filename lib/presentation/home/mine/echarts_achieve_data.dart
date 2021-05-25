import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:flutter_ui/application/echarts/echarts_bloc.dart';

class EchartsAchieveData extends StatefulWidget {
  @override
  _EchartsAchieveDataState createState() => _EchartsAchieveDataState();
}

class _EchartsAchieveDataState extends State<EchartsAchieveData> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  String month = "";
  String day = "";
  String week = "";
  bool isDay = false;
  bool isMonth = true;
  bool isWeek = false;
  bool isSalesman = false;
  List listMonth = [];
  int monthIndex = 0;
  int weekIndex = 0;
  String salesman = "";
  String salesmanId = "";

  @override
  void initState() {
    super.initState();
    BlocProvider.of<EchartsBloc>(context)
      ..add(EchartsEvent.getFastreport(2, DateTime.now().month, "自己", "总月", 0));
    List list = [];
    for (int i = 1; i <= DateTime.now().month; i++) {
      list.add(i.toString() + "月");
    }
    setState(() {
      day = "本周";
      week = "周";
      month = "月";
      salesman = "置业顾问";
      listMonth = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EchartsBloc, EchartsState>(listener: (context, state) {
      // print(state.personnelYear);
    }, builder: (context, state) {
      return SingleChildScrollView(
          child: Column(children: [
        SizedBox(height: 5),
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
            RaisedButton(
              child: Text(week),
              color: isWeek ? Colors.blue : Colors.white,
              textColor: isWeek ? Colors.white : Colors.grey,
              splashColor: Colors.lightBlueAccent,
              onPressed: () {
                if (isWeek) {
                  getshowModalBottomSheet(countWeek(state), "week");
                }
              },
            ),
            RaisedButton(
              child: Text(day),
              color: isDay ? Colors.blue : Colors.white,
              textColor: isDay ? Colors.white : Colors.grey,
              splashColor: Colors.lightBlueAccent,
              onPressed: () {
                setState(() {
                  isMonth = false;
                  isWeek = false;
                  isDay = true;
                  month = "月";
                  week = "周";
                  if (!isSalesman) {
                    salesmanId = "自己";
                  }
                });
                BlocProvider.of<EchartsBloc>(context)
                  ..add(EchartsEvent.getFastreport(
                      1, DateTime.now().month, salesmanId, day, 0));
                // getshowModalBottomSheet(listDay, "day");
              },
            ),
          ],
        ),
        if (state.isManager)
          RaisedButton(
            child: Text(salesman),
            color: isSalesman ? Colors.blue : Colors.white,
            textColor: isSalesman ? Colors.white : Colors.grey,
            splashColor: Colors.lightBlueAccent,
            onPressed: () {
              getshowModalBottomSheet(state.allSalesman, "salesman");
            },
          ),
        SizedBox(height: 5),

        // AspectRatio(
        //   aspectRatio: 1.50,
        //   child: Padding(
        //     padding: const EdgeInsets.only(
        //         right: 18.0, left: 12.0, top: 24, bottom: 12),
        //     child: Container(
        //       decoration: const BoxDecoration(
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(8.0),
        //           ),
        //           color: Colors.white),
        //       child: LineChart(
        //         mainData(state.personnelYear),
        //       ),
        //     ),
        //   ),
        // ),
        //         [
        // {product: '周1', '2015': 43.3},
        // {product: '周2', '2015': 83.1},
        // {product: '周3', '2015': 86.4},
        // {product: '周4', '2015': 72.4},
        // {product: '周5', '2015': 43.3},
        // {product: '周6', '2015': 83.1},
        // {product: '周7', '2015': 86.4},
        // {product: '周8', '2015': 83.1},
        // {product: '周9', '2015': 86.4},
        // {product: '周十', '2015': 83.1},
        // {product: '周一', '2015': 86.4},
        // {product: '周二', '2015': 86.4},
        // ]
        showEcharts(state.personnelYear, 'shared', 'registrations'),
        showEcharts(state.personnelYear, 'invite', 'appoint'),
        SizedBox(height: 30),
        remark("shared:", "分享人数"),
        remark("registrations:", "注册人数"),
        remark("invite:", "邀约办理多少次"),
        remark("appoint:", "下定、认筹审核多少次"),
        SizedBox(height: 50),
//         Container(
//           child: Echarts(option: '''
//      {
//     legend: {},
//     tooltip: {},
//     dataset: {
//         dimensions: ['key', 'appoint'],
//         source:
//         ${jsonEncode(state.personnelYear)}
//     },
//     xAxis: {type: 'category'},
//     yAxis: {},
//     series: [
//         {type: 'bar',emphasis:{
//             itemStyle:{
//               color: '#a90025',
//               shadowBlur:10,
//               shadowOffsetX:0,
//               shadowColor: 'rgba(0,0,0,0.5)'
//             }
//           },
//         },
//     ]
// }
//               '''),
//           height: 250,
//         ),
//             Container(
//               child: Echarts(
//                 option: '''
//     {
//     title: {
//         text: '某站点用户访问来源',
//         subtext: '纯属虚构',
//         left: 'center'
//     },
//     tooltip: {
//         trigger: 'item',
//         formatter: '{a} <br/>{b} : {c} ({d}%)'
//     },
//     legend: {
//         orient: 'vertical',
//         left: 'left',
//         data: ['直接访问', '中介', '经纪人', '小程序', '公众号']
//     },
//     series: [
//         {
//             name: '访问来源',
//             type: 'pie',
//             radius: '55%',
//             center: ['50%', '60%'],
//             data: ${jsonEncode(kkk)},
//             emphasis: {
//                 itemStyle: {
//                     shadowBlur: 10,
//                     shadowOffsetX: 0,
//                     shadowColor: 'rgba(0, 0, 0, 0.5)'
//                 }
//             }
//         }
//     ]
// }
//   ''',
//               ),
//               height: 250,
//             ),
      ]));
    });
  }

  showEcharts(List list, String key01, String key02) {
    return Container(
      child: Echarts(option: '''
     {
    legend: {},
    tooltip: {},
    dataset: {
        dimensions: ['key', ${jsonEncode(key01)} , ${jsonEncode(key02)}],
        source:
        ${jsonEncode(list)}
    },
    xAxis: {type: 'category'},
    yAxis: {},
    series: [ 
      {type: 'bar',},
      {type: 'bar',},
    ]
}
              '''),
      height: 250,
    );
  }

  countWeek(state) {
    List list = [];
    for (int i = 1; i <= state.personnelYear.length; i++) {
      list.add("第" + i.toString() + "周");
    }
    return list;
  }

  remark(String key, String name) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
          width: 130,
          child: Text(key,
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
          width: 150,
          child: Text(name,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
        ),
      ],
    );
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
                            key == "salesman" ? list[i]["realName"] : list[i],
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
                          isWeek = true;
                          isMonth = true;
                          isDay = false;
                          week = "周";
                          monthIndex = i + 1;
                          if (!isSalesman) {
                            salesmanId = "自己";
                          }
                        } else if (key == "week") {
                          week = list[i];
                          isWeek = true;
                          isMonth = true;
                          isDay = false;
                          if (!isSalesman) {
                            salesmanId = "自己";
                          }
                          weekIndex = i;
                        } else if (key == "salesman") {
                          salesman = list[i]["realName"];
                          isSalesman = true;
                          salesmanId = list[i]["id"];
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
            ..add(EchartsEvent.getFastreport(
                2, monthIndex, salesmanId, month, 0));
        } else if (key == "week") {
          // 这里缺接口 需要通过周来查看天的数据
          BlocProvider.of<EchartsBloc>(context)
            ..add(EchartsEvent.getFastreport(
                3, monthIndex, salesmanId, week, weekIndex));
        } else if (key == "salesman") {
          if (isMonth && !isWeek && !isDay) {
            BlocProvider.of<EchartsBloc>(context)
              ..add(EchartsEvent.getFastreport(
                  2, DateTime.now().month, salesmanId, "总月", 0));
          } else if (isMonth && isWeek && !isDay) {
            if (week.startsWith("第")) {
              // 这里缺接口 需要通过周来查看天的数据
              BlocProvider.of<EchartsBloc>(context)
                ..add(EchartsEvent.getFastreport(
                    3, monthIndex, salesmanId, week, weekIndex));
            } else {
              BlocProvider.of<EchartsBloc>(context)
                ..add(EchartsEvent.getFastreport(
                    2, monthIndex, salesmanId, month, 0));
            }
          } else if (!isMonth && !isWeek && isDay) {
            BlocProvider.of<EchartsBloc>(context)
              ..add(EchartsEvent.getFastreport(
                  1, DateTime.now().month, salesmanId, day, 0));
          }

          // BlocProvider.of<EchartsBloc>(context)
          //   ..add(EchartsEvent.getFastreport(
          //       1, DateTime.now().month, salesmanId, day));
        }
      }
    });
  }

  // LineChartData mainData(List list) {
  //   return LineChartData(
  //     gridData: FlGridData(
  //       show: true,
  //       drawVerticalLine: true,
  //       getDrawingHorizontalLine: (value) {
  //         return FlLine(
  //           color: const Color(0xff37434d),
  //           strokeWidth: 1,
  //         );
  //       },
  //       getDrawingVerticalLine: (value) {
  //         return FlLine(
  //           color: const Color(0xff37434d),
  //           strokeWidth: 1,
  //         );
  //       },
  //     ),
  //     titlesData: FlTitlesData(
  //       show: true,
  //       bottomTitles: SideTitles(
  //         showTitles: true,
  //         reservedSize: 22,
  //         getTextStyles: (value) => const TextStyle(
  //             color: Color(0xff68737d),
  //             fontWeight: FontWeight.bold,
  //             fontSize: 16),
  //         getTitles: (value) {
  //           switch (value.toInt()) {
  //             case 0:
  //               return '12月';
  //             case 2:
  //               return '2月';
  //             case 4:
  //               return '4月';
  //             case 6:
  //               return '6月';
  //             case 8:
  //               return '8月';
  //             case 10:
  //               return '10月';
  //           }
  //           return '';
  //         },
  //         margin: 8,
  //       ),
  //       leftTitles: SideTitles(
  //         showTitles: true,
  //         getTextStyles: (value) => const TextStyle(
  //           color: Color(0xff67727d),
  //           fontWeight: FontWeight.bold,
  //           fontSize: 15,
  //         ),
  //         getTitles: (value) {
  //           switch (value.toInt()) {
  //             case 1:
  //               return "10";
  //             case 3:
  //               return '30';
  //             case 5:
  //               return '50';
  //           }
  //           return '';
  //         },
  //         reservedSize: 28,
  //         margin: 12,
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //         show: true,
  //         border: Border.all(color: const Color(0xff37434d), width: 1)),
  //     minX: 0,
  //     maxX: 11,
  //     minY: 0,
  //     maxY: 6,
  //     lineBarsData: [
  //       LineChartBarData(
  //         spots: [
  //           // FlSpot(0, getData(0, list)),
  //           FlSpot(1, getData(0, list)),
  //           FlSpot(2, getData(1, list)),
  //           FlSpot(3, getData(2, list)),
  //           FlSpot(4, getData(3, list)),
  //           // FlSpot(0, list[12]["shared"] *0.1),
  //           // FlSpot(1, list[1]["shared"] * 0.1),
  //           // FlSpot(2, list[2]["shared"] * 0.1),
  //           // FlSpot(3, list[3]["shared"] * 0.1),
  //           // FlSpot(4, list[4]["shared"] * 0.1),
  //           // FlSpot(5, list[5]["shared"]),
  //           // FlSpot(6, list[6]["shared"]),
  //           // FlSpot(7, list[7]["shared"]),
  //           // FlSpot(8, list[8]["shared"]),
  //           // FlSpot(9, list[9]["shared"]),
  //           // FlSpot(10, list[10]["shared"]),
  //           // FlSpot(11, list[11]["shared"]),
  //         ],
  //         isCurved: true,
  //         colors: gradientColors,
  //         barWidth: 5,
  //         isStrokeCapRound: true,
  //         dotData: FlDotData(
  //           show: false,
  //         ),
  //         belowBarData: BarAreaData(
  //           show: true,
  //           colors:
  //               gradientColors.map((color) => color.withOpacity(0.3)).toList(),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // double getData(int i, List list) {
  //   double data = 0.0;
  //   if (i > list.length - 1) {
  //     data = 0.0;
  //   } else {
  //     data = list[i]["appoint"] * 0.1;
  //   }
  //   return data;
  // }
}
