import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/auth/auth_bloc.dart';
import 'package:flutter_ui/application/auth/sing_in_form/sign_in_form_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/components/SignUpLink.dart';
import 'package:flutter_ui/presentation/components/form.dart';
import 'package:flutter_ui/presentation/components/signInButton.dart';
import 'package:flutter_ui/presentation/components/whiteTick.dart';
import 'package:flutter_ui/presentation/login/login_animation.dart';
import 'package:flutter_ui/presentation/login/styles.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  AnimationController _loginButtonController;
  String textFeid = "";
  // ignore: close_sinks   https://github.com/felangel/bloc/issues/587
  // SignInFormBloc _signInFormBloc;
  // var animationStatus = 0;

  @override
  void initState() {
    super.initState();
    _loginButtonController = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);
    // _signInFormBloc = SignInFormBloc();
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await _loginButtonController.forward();
      await _loginButtonController.reverse();
    } on TickerCanceled {}
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          child: AlertDialog(
            title: Text('您确认吗?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('否'),
              ),
              FlatButton(
                onPressed: () =>
                    // Navigator.pushReplacementNamed(context, "/home"),
                    ExtendedNavigator.of(context).replace(Routes.splashPage),
                child: Text('是'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return BlocProvider(
        create: (context) => getIt<SignInFormBloc>(),
        child: BlocConsumer<SignInFormBloc, SignInFormState>(
            listener: (context, state) {
          state.authFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                FlushbarHelper.createError(
                  message: failure.map(
                    // Use localized strings here in your apps
                    cancelledByUser: (_) => '取消',
                    serverError: (_) => '服务器异常',
                    phoneAlreadyInUse: (_) => '手机已被注册',
                    invalidCellPhoneNumber: (_) => '无效手机号',
                    invalidVerificationCode: (_) => '无效验证码',
                    invalidMobileAndSMSCodeCombination: (_) => '无效的手机号验证码',
                  ),
                ).show(context);
              },
              (_) {
                ExtendedNavigator.of(context).replace(
                    Routes.pinCodeVerificationScreen,
                    arguments: PinCodeVerificationScreenArguments(
                        phoneNumber: state.phoneNumber.getOrCrash()));
              },
            ),
          );
        }, builder: (context, state) {
          return WillPopScope(
              onWillPop: _onWillPop,
              child: Scaffold(
                body: Container(
                    decoration: BoxDecoration(
                      image: backgroundImage,
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: <Color>[
                            // const Color.fromRGBO(38, 51, 197, 0.8),
                            const Color.fromRGBO(62, 82, 201, 0.8),
                            const Color.fromRGBO(255, 255, 255, 0.9),
                          ],
                          stops: [0.2, 1.0],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(0.0, 1.0),
                        )),
                        child: ListView(
                          padding: const EdgeInsets.all(0.0),
                          children: <Widget>[
                            Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Tick(image: tick),
                                    FormContainer(),
                                    SignUp()
                                  ],
                                ),
                                !state.isObtaining
                                    ? Padding(
                                        padding: EdgeInsets.only(bottom: 50.0),
                                        child: InkWell(
                                            onTap: () {
                                              BlocProvider.of<SignInFormBloc>(
                                                      context)
                                                  .add(
                                                SignInFormEvent
                                                    .getSMSVerificationPressed(),
                                              );
                                              _playAnimation();
                                            },
                                            child: SignIn()),
                                      )
                                    : StaggerAnimation(
                                        buttonController:
                                            _loginButtonController.view),
                              ],
                            ),
                          ],
                        ))),
              ));
        }));
  }

  getPhone() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xffe5e5e5))),
      ),
      child: TextField(
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
            hintText: "输入手机号",
            border: InputBorder.none,
            isDense: true,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
          ),
          textAlign: TextAlign.start,
          controller: TextEditingController.fromValue(
            TextEditingValue(
              text: textFeid,
              // 保持光标在最后
              selection: TextSelection.fromPosition(TextPosition(
                affinity: TextAffinity.downstream,
                offset: textFeid.length,
              )),
            ),
          ),
          onChanged: (val) {
            textFeid = val;
          }),
    );
  }
}
