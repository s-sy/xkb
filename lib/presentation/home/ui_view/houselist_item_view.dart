import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/house/house_bloc.dart';
import 'package:flutter_ui/presentation/core/fintness_app_theme.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';

class HouseListItemView extends StatefulWidget {
  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;
  final List<dynamic> buildingList;
  final List<dynamic> housList;
  final List<dynamic> entranceList;

  const HouseListItemView(
      {Key key,
      this.mainScreenAnimationController,
      this.mainScreenAnimation,
      this.buildingList,
      this.housList,
      this.entranceList})
      : super(key: key);

  @override
  _HouseListItemViewState createState() => _HouseListItemViewState();
}

class _HouseListItemViewState extends State<HouseListItemView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  List<String> areaListData = <String>[
    'assets/fitness_app/area1.png',
    'assets/fitness_app/area2.png',
    'assets/fitness_app/area3.png',
    'assets/fitness_app/area1.png',
  ];

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation,
          child: Transform(
              transform: Matrix4.translationValues(
                  0.0, 30 * (1.0 - widget.mainScreenAnimation.value), 0.0),
              child:
                  BlocBuilder<HouseBloc, HouseState>(builder: (context, state) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: ScrollController(),
                  child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _dealDate(state).map<Widget>((vlaue) {
                            return Row(
                              children: vlaue.map<Widget>((vlaue02) {
                                return InkWell(
                                  child: Container(
                                    height: 70,
                                    width: 80,
                                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[600],
                                            blurRadius: 5.0)
                                      ],
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: vlaue02["state"] == "1"
                                          ? Colors.lightBlue
                                          : vlaue02["state"] == "2"
                                              ? Colors.red
                                              : vlaue02["state"] == "3"
                                                  ? Colors.yellow
                                                  : vlaue02["state"] == "4"
                                                      ? Colors.orange
                                                      : Colors.green,
                                      // 0：待售；1：认购 2：签约 3：销控 4: 管理销控
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          vlaue02["serialNumber"],
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          vlaue02["floorage"] + "㎡",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        if (vlaue02["createId"] != null)
                                          _salemanName(
                                              state, vlaue02["createId"]),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    // print(vlaue02["serialNumber"]);
                                    ExtendedNavigator.of(context).push(
                                      Routes.houseingSelesControlScreen,
                                      arguments: {
                                        'imagepath': vlaue02,
                                        'buildingList': widget.buildingList,
                                        'housList': widget.housList,
                                        'entranceList': widget.entranceList,
                                        'buildEntranceList':
                                            state.buildEntranceList,
                                      },
                                    );
                                  },
                                );
                              }).toList(),
                            );
                          }).toList())),
                );
              })

              //     AspectRatio(
              //   aspectRatio: 0.75,
              //   child: Padding(
              //       padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              //       child: BlocBuilder<HouseBloc, HouseState>(
              //           builder: (context, state) {
              //         return state.buildEntranceList.length > 0
              //             ? GridView(
              //                 padding: const EdgeInsets.only(
              //                     left: 16, right: 16, top: 16, bottom: 16),
              //                 physics: const BouncingScrollPhysics(),
              //                 scrollDirection: Axis.vertical,
              //                 children: List<Widget>.generate(
              //                   state.buildEntranceList.length,
              //                   (int index) {
              //                     final int count =
              //                         state.buildEntranceList.length;
              //                     final Animation<double> animation =
              //                         Tween<double>(begin: 0.0, end: 1.0).animate(
              //                       CurvedAnimation(
              //                         parent: animationController,
              //                         curve: Interval((1 / count) * index, 1.0,
              //                             curve: Curves.fastOutSlowIn),
              //                       ),
              //                     );
              //                     animationController.forward();
              //                     return AreaView(
              //                       imagepath: state.buildEntranceList[index],
              //                       animation: animation,
              //                       animationController: animationController,
              //                     );
              //                   },
              //                 ),
              //                 gridDelegate:
              //                     SliverGridDelegateWithFixedCrossAxisCount(
              //                   crossAxisCount: state.cors.round(),
              //                   mainAxisSpacing: 10.0,
              //                   crossAxisSpacing: 5.0,
              //                   childAspectRatio: 1.25,
              //                 ),
              //               )
              //             : SizedBox(
              //                 height: 2,
              //               );
              //       })),

              ),
        );
      },
    );
  }
}

//这种listview方式可以不用了
_listFloor(List list) {
  return ListView.builder(
      // padding: EdgeInsets.only(top: 0),
      // scrollDirection: Axis.vertical,
      // reverse: false,
      // primary: true,
      // shrinkWrap: true,
      itemCount: list.length,
      // physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemBuilder: (context, i) =>
          // SingleChildScrollView(
          //       physics: BouncingScrollPhysics(),
          //       scrollDirection: Axis.horizontal,
          //       controller: ScrollController(),
          //       child: Container(
          //           height: 20,
          //           decoration: BoxDecoration(color: Colors.yellow),
          //           child:
          Container(
            child: Text(list[i]['floor']),
          ));
  //       ),
  // ));
}

_salemanName(state, String salemanId) {
  //一般只有一个置业顾问吧，就不做叠加了
  String name = "";
  for (int i = 0; i < state.salesman.length; i++) {
    if (state.salesman[i]['id'] == salemanId) {
      name = state.salesman[i]['realName'];
    }
  }
  return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: ScrollController(),
      child: Text(name + " "));
}

_dealDate(state) {
  List list = [];
  for (int i = 0; i < state.buildEntranceList.length; i++) {
    bool isContainer =
        list.contains(int.parse(state.buildEntranceList[i]['floor']));
    if (!isContainer) {
      list.add(int.parse(state.buildEntranceList[i]['floor']));
    }
  }
  list.sort();
  List listFinal = [];
  for (int i = list.length - 1; i >= 0; i--) {
    List list02 = [];
    for (int j = 0; j < state.buildEntranceList.length; j++) {
      if (list[i].toString() == state.buildEntranceList[j]['floor']) {
        list02.add(state.buildEntranceList[j]);
      }
    }
    listFinal.add(list02);
  }
  return listFinal;
}

class AreaView extends StatelessWidget {
  const AreaView({
    Key key,
    this.imagepath,
    this.animationController,
    this.animation,
  }) : super(key: key);

  final Map<String, dynamic> imagepath;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: imagepath["state"] == "1"
                    ? Colors.red
                    : imagepath["state"] == "2"
                        ? Colors.lightBlue
                        : imagepath["state"] == "3"
                            ? Colors.yellow
                            : imagepath["state"] == "4"
                                ? Colors.orange
                                : Colors.green,
                // 0：待售；1：认购 2：签约 3：销控 4: 管理销控
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: FitnessAppTheme.grey.withOpacity(0.4),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  splashColor: FitnessAppTheme.nearlyDarkBlue.withOpacity(0.2),
                  onTap: () {
                    print(imagepath["serialNumber"]);
                    ExtendedNavigator.of(context).push(
                      Routes.houseingSelesControlScreen,
                      // arguments: {
                      //   'imagepath': imagepath,
                      //   'buildingList': widget.buildingList,
                      //   'housList': widget.housList,
                      //   'entranceList': widget.entranceList,
                      //   'buildEntranceList': widget.buildEntranceList,
                      // },
                    );

                    //                   final List buildingList;
                    // final List housList;
                    // final List entranceList;
                    // state.buildEntranceList
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // Padding(
                      //     padding: const EdgeInsets.only(
                      //         top: 0, left: 10, right: 10),
                      //     child:
                      Text(
                        imagepath["serialNumber"],
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        imagepath["floorage"] + "㎡",
                        style: TextStyle(fontSize: 12),
                      ),

                      // Image.asset(imagepath),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class Routers {}
