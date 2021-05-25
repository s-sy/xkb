import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/auth/auth_bloc.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';

class SplashPage extends StatefulWidget {
  final String refresh;

  const SplashPage({Key key, this.refresh}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   if (widget.refresh == "refresh") {
  //     BlocProvider.of<AuthBloc>(context)..add(AuthBlocEvent.getRefresh());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthBloc>(context)..add(AuthBlocEvent.authCheckRequested());
    return BlocListener<AuthBloc, AuthBlocState>(
      listener: (context, state) {
        // if (widget.refresh == "refresh") {
        //   BlocProvider.of<AuthBloc>(context)..add(AuthBlocEvent.getRefresh());
        // }
        state.map(
          initial: (_) {},
          authenticated: (_) =>
              // ExtendedNavigator.of(context).replace(Routes.loginUserInfoPage),
              ExtendedNavigator.of(context)
                  .replace(Routes.fitnessAppHomeScreen),
          unauthenticated: (_) =>
              ExtendedNavigator.of(context).replace(Routes.loginScreen),
          loginOut: (_) =>
              ExtendedNavigator.of(context).replace(Routes.loginScreen),
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
