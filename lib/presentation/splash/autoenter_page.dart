import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/autoenter/autoenter_bloc.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';

class Autoenter extends StatefulWidget {
  // final String refresh;

  // const Autoenter({Key key, this.refresh}) : super(key: key);
  @override
  _AutoenterState createState() => _AutoenterState();
}

class _AutoenterState extends State<Autoenter> {
  // @override
  // void initState() {
  //   super.initState();
  //   if (widget.refresh == "refresh") {
  //     BlocProvider.of<AutoenterBloc>(context)..add(AutoenterEvent.getType());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // return BlocConsumer<AutoenterBloc, AutoenterState>(
    //     listener: (context, state) {
    //   state.map(
    //     initial: (_) {},
    //     brokerenter: (_) =>
    //         ExtendedNavigator.of(context).replace(Routes.splashPage),
    //     estateenter: (_) =>
    //         ExtendedNavigator.of(context).replace(Routes.platformPage),
    //   );
    // }, builder: (context, state) {
    //   return _PageWidget();
    // });
    BlocProvider.of<AutoenterBloc>(context)
      ..add(AutoenterEvent.getcoumerstype());
    return BlocListener<AutoenterBloc, AutoenterState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          brokerenter: (_) =>
              // ExtendedNavigator.of(context).replace(Routes.loginUserInfoPage),
              ExtendedNavigator.of(context).replace(Routes.splashPage),
          estateenter: (_) =>
              ExtendedNavigator.of(context).replace(Routes.platformPage),
          est: (_) =>
              ExtendedNavigator.of(context).replace(Routes.platformPage),
        );
      },
      child: _PageWidget(),
    );
  }
}

class _PageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
