import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/house/house_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/core/fintness_app_theme.dart';
import 'package:flutter_ui/presentation/home/ui_view/house_title_view.dart';
import 'package:flutter_ui/presentation/home/ui_view/houseing_buttom_view.dart';
import 'package:flutter_ui/presentation/home/ui_view/houselist_item_view.dart';

class HouseingScreen extends StatefulWidget {
  const HouseingScreen({Key key, this.animationController}) : super(key: key);

  final AnimationController animationController;
  @override
  _HouseingScreenState createState() => _HouseingScreenState();
}

class _HouseingScreenState extends State<HouseingScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();
    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });

    super.initState();
  }

  isEmptyData() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          // margin: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
          decoration: BoxDecoration(
            // border: Border.all(width: 1.0, color: Colors.grey[300]),
            image: DecorationImage(
                image: NetworkImage(
                    'https://img.0728jh.com/staticImg/konghu_gz.png'),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            "暂时没有房源信息",
            style: TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  void addAllListData() {
    const int count = 5;
    listViews.add(BlocBuilder<HouseBloc, HouseState>(builder: (context, state) {
      print(state.buildingList);

      return state.buildingList.length == 0
          ? Container(child: isEmptyData())
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Container(
                    height: 30,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text("期"),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          controller: ScrollController(),
                          child: HouseingButtomView(
                            ls: 1,
                            lists: state.buildingList,
                            animation: Tween<double>(begin: 0.0, end: 1.0)
                                .animate(CurvedAnimation(
                                    parent: widget.animationController,
                                    curve: Interval((1 / count) * 0, 1.0,
                                        curve: Curves.fastOutSlowIn))),
                            animationController: widget.animationController,
                          )))
                ]);
    }));
    listViews.add(BlocBuilder<HouseBloc, HouseState>(builder: (context, state) {
      print(state.housList);

      return state.buildingList.length == 0
          ? Container(child: Text(""))
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text("栋"),
                ),
                Expanded(
                    child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        controller: ScrollController(),
                        child: HouseingButtomView(
                          ls: 2,
                          lists: state.housList,
                          animation: Tween<double>(begin: 0.0, end: 1.0)
                              .animate(CurvedAnimation(
                                  parent: widget.animationController,
                                  curve: Interval((1 / count) * 0, 1.0,
                                      curve: Curves.fastOutSlowIn))),
                          animationController: widget.animationController,
                        )))
              ],
            );
    }));
    listViews.add(BlocBuilder<HouseBloc, HouseState>(builder: (context, state) {
      print(state.entranceList);

      return state.buildingList.length == 0
          ? Container(child: Center(child: Text("")))
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Container(
                    height: 30,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text("单元"),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          controller: ScrollController(),
                          child: HouseingButtomView(
                            ls: 3,
                            lists: state.entranceList,
                            animation: Tween<double>(begin: 0.0, end: 1.0)
                                .animate(CurvedAnimation(
                                    parent: widget.animationController,
                                    curve: Interval((1 / count) * 0, 1.0,
                                        curve: Curves.fastOutSlowIn))),
                            animationController: widget.animationController,
                          ))),
                ]);
    }));
    // listViews.add(
    //   TitleView(
    //     titleTxt: 'Your program',
    //     subTxt: 'Details',
    //     animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //         parent: widget.animationController,
    //         curve:
    //             Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
    //     animationController: widget.animationController,
    //   ),
    // );

    // listViews.add(
    //   WorkoutView(
    //     animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //         parent: widget.animationController,
    //         curve:
    //             Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
    //     animationController: widget.animationController,
    //   ),
    // );
    // listViews.add(
    //   RunningView(
    //     animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //         parent: widget.animationController,
    //         curve:
    //             Interval((1 / count) * 3, 1.0, curve: Curves.fastOutSlowIn))),
    //     animationController: widget.animationController,
    //   ),
    // );

    listViews.add(
      HouseTitleView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(BlocBuilder<HouseBloc, HouseState>(builder: (context, state) {
      return HouseListItemView(
        buildingList: state.buildingList, //期
        housList: state.housList, //栋
        entranceList: state.entranceList, //单元
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController,
                curve: Interval((1 / count) * 5, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController,
      );
    }));
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocProvider(
            create: (context) => getIt<HouseBloc>()
              ..add(HouseEvent.started())
              ..add(HouseEvent.getListData())
              ..add(HouseEvent.getSalesmanLists("空的懒得改了")),
            child: Stack(
              children: <Widget>[
                getMainListViewUI(),
                getAppBarUI(),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                )
              ],
            ),
          )),
    );
  }

  Widget getMainListViewUI() {
    return BlocBuilder<HouseBloc, HouseState>(builder: (context, state) {
      return ListView.builder(
        controller: scrollController,
        padding: EdgeInsets.only(
          top: AppBar().preferredSize.height +
              MediaQuery.of(context).padding.top +
              24,
          bottom: 62 + MediaQuery.of(context).padding.bottom,
        ),
        itemCount: listViews.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          widget.animationController.forward();
          return listViews[index];
        },
      );
    });
    // FutureBuilder<bool>(
    //   future: getData(),
    //   builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
    //     if (!snapshot.hasData) {
    //       return const SizedBox();
    //     } else {

    //     }
    //   },
    // );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController,
          builder: (BuildContext context, Widget child) {
            return FadeTransition(
              opacity: topBarAnimation,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FitnessAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: FitnessAppTheme.grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '房源',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22 + 6 - 6 * topBarOpacity,
                                      letterSpacing: 1.2,
                                      color: Colors.blue
                                      // FitnessAppTheme.darkerText,
                                      ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 38,
                            //   width: 38,
                            //   child: InkWell(
                            //     highlightColor: Colors.transparent,
                            //     borderRadius: const BorderRadius.all(
                            //         Radius.circular(32.0)),
                            //     onTap: () {
                            //       print("日期左边按钮");
                            //     },
                            //     child: Center(
                            //       child: Icon(
                            //         Icons.keyboard_arrow_left,
                            //         color: FitnessAppTheme.grey,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //     left: 8,
                            //     right: 8,
                            //   ),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Padding(
                            //         padding: const EdgeInsets.only(right: 8),
                            //         child: Icon(
                            //           Icons.calendar_today,
                            //           color: FitnessAppTheme.grey,
                            //           size: 18,
                            //         ),
                            //       ),
                            //       Text(
                            //         '15 May',
                            //         textAlign: TextAlign.left,
                            //         style: TextStyle(
                            //           fontFamily: FitnessAppTheme.fontName,
                            //           fontWeight: FontWeight.normal,
                            //           fontSize: 18,
                            //           letterSpacing: -0.2,
                            //           color: FitnessAppTheme.darkerText,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 38,
                            //   width: 38,
                            //   child: InkWell(
                            //     highlightColor: Colors.transparent,
                            //     borderRadius: const BorderRadius.all(
                            //         Radius.circular(32.0)),
                            //     onTap: () {
                            //       print("日期右边按钮");
                            //     },
                            //     child: Center(
                            //       child: Icon(
                            //         Icons.keyboard_arrow_right,
                            //         color: FitnessAppTheme.grey,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
