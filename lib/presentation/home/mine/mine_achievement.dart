import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/echarts/echarts_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/home/mine/echarts_achieve_data.dart';
import 'package:flutter_ui/presentation/home/mine/echarts_all_data.dart';
import 'package:flutter_ui/presentation/home/mine/echarts_kind_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MineAchievement extends StatefulWidget {
  @override
  _MineAchievementState createState() => _MineAchievementState();
}

class _MineAchievementState extends State<MineAchievement> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            getIt<EchartsBloc>()..add(EchartsEvent.getHouseName()),
        child: BlocConsumer<EchartsBloc, EchartsState>(
            listener: (context, state) async {},
            builder: (BuildContext context, state) {
              return DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                    elevation: 0.1,
                    backgroundColor: Colors.blue[400],
                    title: Text('业绩-' + state.houseName),
                    toolbarHeight: 100.0,
                    bottom: PreferredSize(
                        preferredSize: Size.fromHeight(48),
                        child: Container(
                          height: 40.0,
                          decoration: BoxDecoration(color: Colors.white),
                          child: TabBar(
                            unselectedLabelColor: Colors.black,
                            indicatorColor: Colors.blue,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelColor: Colors.blue,
                            indicatorWeight: 2.0,
                            tabs: <Widget>[
                              mainTabBar('数据统计'),
                              mainTabBar('分类数据'),
                              mainTabBar('个人数据'),
                            ],
                          ),
                        )),
                  ),
                  body: TabBarView(
                    children: <Widget>[
                      EchartsAllData(),
                      EchartsKindData(),
                      EchartsAchieveData(),
                    ],
                  ),
                ),
              );
            }));
  }

  //tab导航栏
  mainTabBar(String tabName) {
    return Tab(
      child: Text(
        tabName,
        style: TextStyle(fontSize: 14.0, color: Colors.black54),
      ),
    );
  }
}

// // import 'package:fl_chart/fl_chart.dart';

// import 'package:flutter/material.dart';
// // import 'package:charts_flutter/flutter.dart';
// import 'package:flutter_echarts/flutter_echarts.dart';
// // import 'package:number_display/number_display.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_ui/application/echarts/echarts_bloc.dart';
// import 'package:flutter_ui/injection.dart';
// import 'package:flutter_ui/presentation/home/mine/echarts_bar.dart';
// import 'package:flutter_ui/presentation/home/mine/echarts_line.dart';
// import 'package:flutter_ui/presentation/home/mine/echarts_pie.dart';

// class MineAchievement extends StatefulWidget {
//   MineAchievement({Key key}) : super(key: key);

//   @override
//   _MineAchievementState createState() => _MineAchievementState();
// }

// class _MineAchievementState extends State<MineAchievement>
//     with TickerProviderStateMixin {
//   TabController _tabController;
//   @override
//   void initState() {
//     // TODO: implement initState
//     _tabController = new TabController(length: 3, vsync: this);
//     // _tabController.addListener(() {
//     //   print(_tabController.index);
//     //   if (_tabController.index == 1) {
//     //     BlocProvider.of<EchartsBloc>(context)..add(EchartsEvent.getPie());
//     //   }
//     // });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<EchartsBloc>(),
//       child: Scaffold(
//         // appBar: AppBar(
//         //   title: Text("业绩"),
//         // ),
//         backgroundColor: Colors.white,
//         body: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               title: Text("业绩"),
//               pinned: true,
//               // flexibleSpace: Container(
//               //   child:Text(""),
//               // ),
//             ),
//             SliverPadding(
//               padding: EdgeInsets.only(top: 10),
//               sliver: SliverToBoxAdapter(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
//                   child: Container(
//                     height: 40,
//                     // color: Colors.cyanAccent,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(width: 1, color: Colors.blue)),
//                     child: TabBar(
//                         controller: _tabController,
//                         labelColor: Colors.white,
//                         // indicatorWeight: 20,
//                         // indicatorColor: Colors.green,
//                         indicator: ShapeDecoration(
//                           color: Colors.blue,
//                           shape: new Border.all(
//                             color: Colors.blue,
//                           ),
//                         ),
//                         unselectedLabelColor: Colors.blue,
//                         tabs: [
//                           Tab(
//                             text: "数据统计",
//                           ),
//                           Tab(
//                             text: "综合数据",
//                           ),
//                           Tab(
//                             text: "业绩排名",
//                           )
//                         ]),
//                   ),
//                 ),
//               ),
//             ),
//             SliverFillRemaining(
//               child: TabBarView(
//                 physics: NeverScrollableScrollPhysics(),
//                 controller: this._tabController,
//                 children: [
//                   EchartsBarView(),
//                   EchaartsLineView(),
//                   EchaartsPieView(),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
