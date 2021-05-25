import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/house/house_control_bloc/house_control_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/home/houseing/houseing_seles_control/control_body.dart';

class HouseingSelesControlScreen extends StatefulWidget {
  @override
  _HouseingSelesControlScreenState createState() =>
      _HouseingSelesControlScreenState();
}

class _HouseingSelesControlScreenState extends State<HouseingSelesControlScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
//  Map<String, dynamic> data = {};
  // Widget tabBody = Container(
  //   color: FitnessAppTheme.background,
  // );

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    //  tabBody = ControlBody(data: data, animationController: animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> routedata = RouteData.of(context).arguments;
    print(routedata);
    // arguments:
    // {
    // 'imagepath': vlaue02,
    // 'buildingList': widget.buildingList,
    // 'housList': widget.housList,
    // 'entranceList': widget.entranceList,
    // }
    // setState(() {
    //   data = routedata;
    // });
    return Scaffold(
        body: BlocProvider<HouseControlBloc>(
            create: (context) => getIt<HouseControlBloc>()
              ..add(HouseControlEvent.started(routedata['imagepath']))
              ..add(HouseControlEvent.getProcessDefinition()),
            child: BlocBuilder<HouseControlBloc, HouseControlState>(
              builder: (context, state) {
                return Container(
                  child: ControlBody(
                    data: routedata['imagepath'],
                    buildingList: routedata['buildingList'],
                    housList: routedata['housList'],
                    entranceList: routedata['entranceList'],
                    buildEntranceList: routedata['buildEntranceList'],
                    // userInfo: state.userInfo,
                    animationController: animationController,
                  ),
                );
              },
            )));
  }
}
