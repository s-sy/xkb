import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/house/house_bloc.dart';

class HouseingButtomView extends StatelessWidget {
  final int ls;
  final List<dynamic> lists;
  final AnimationController animationController;
  final Animation animation;
  const HouseingButtomView(
      {Key key, this.ls, this.lists, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return FadeTransition(
              opacity: animation,
              child: new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30 * (1.0 - animation.value), 0.0),
                  child: Center(
                    child: Container(
                        height: 40,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: _buildbut(ls, lists),
                          ),
                        )),
                  )));
        });
  }

  List<Widget> _buildbut(ls, lists) {
    List<Widget> list = [];

    for (int i = 0; i < lists.length; i++) {
      list.add(BlocBuilder<HouseBloc, HouseState>(builder: (context, state) {
        return Container(
            margin: EdgeInsets.only(right: 10.0),
            child: InkWell(
              onTap: () {
                print("点击$ls");
                switch (ls) {
                  case 1:
                    BlocProvider.of<HouseBloc>(context)
                      ..add(HouseEvent.changebuilding(i, lists[i]))
                      ..add(HouseEvent.getListData());

                    break;
                  case 2:
                    BlocProvider.of<HouseBloc>(context)
                      ..add(HouseEvent.changehouse(i, lists[i]))
                      ..add(HouseEvent.getListData());

                    break;
                  case 3:
                    BlocProvider.of<HouseBloc>(context)
                      ..add(HouseEvent.changeentrance(i, lists[i]))
                      ..add(HouseEvent.getListData());

                    break;
                }
              },
              child: Stack(
                children: [
                  BlocBuilder<HouseBloc, HouseState>(
                    builder: (context, state) {
                      print(state.buildIndex);
                      return Container(
                          height: 30,
                          width: 80,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            border: Border.all(
                                width: 1,
                                color: (ls == 1
                                            ? state.buildIndex
                                            : ls == 2
                                                ? state.houseIndex
                                                : state.entranceIndex) ==
                                        i
                                    ? Colors.blue
                                    : Colors.grey),
                          ));
                    },
                  ),
                  Container(
                      height: 30,
                      width: 80,
                      child: Center(
                          child: Text(
                        lists[i],
                        style: TextStyle(
                            color: (ls == 1
                                        ? state.buildIndex
                                        : ls == 2
                                            ? state.houseIndex
                                            : state.entranceIndex) ==
                                    i
                                ? Colors.blue
                                : Colors.grey),
                      ))),
                ],
              ),
            ));
      }));
    }
    return list;
  }
}
