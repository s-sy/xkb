import 'dart:async';
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/auth/sing_in_form/sign_in_form_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/core/fintness_app_theme.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  PinCodeVerificationScreen(this.phoneNumber);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  StreamController<ErrorAnimationType> errorController;

  // bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<SignInFormBloc>(),
        child: BlocConsumer<SignInFormBloc, SignInFormState>(
            listener: (context, state) {
          state.authFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                // conditions for validating
                errorController.add(ErrorAnimationType
                    .shake); // Triggering error shake animation
                // FlushbarHelper.createError(
                //   message: failure.map(
                //     // Use localized strings here in your apps
                //     cancelledByUser: (_) => '取消',
                //     serverError: (_) => '服务器异常',
                //     phoneAlreadyInUse: (_) => '手机已被注册',
                //     invalidMobileAndSMSCodeCombination: (_) => '无效的手机号验证码',
                //   ),
                // ).show(context);
              },
              (_) async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                String userType = sharedPreferences.getString("UserType");
                if (userType == "estate") {
                  var project = await sharedPreferences.get("ProjectItem");
                  // print(project);
                  if (project != null) {
                    ExtendedNavigator.of(context)
                        .replace(Routes.wechatHomeScreen,
                            arguments: WechatHomeScreenArguments(
                              affData: jsonDecode(project),
                              msgPageTabIndex: 0,
                            ));
                  } else {
                    ExtendedNavigator.of(context).replace(Routes.platformPage);
                  }
                } else {
                  String userInfoString =
                      sharedPreferences.getString("CACHED_SIGN_IN_USER");
                  sharedPreferences.remove("ProjectItem"); //把这个信息清了，这样下次进好判断
                  if (jsonDecode(userInfoString)['userRole'] != "") {
                    ExtendedNavigator.of(context)
                        .replace(Routes.fitnessAppHomeScreen);
                  } else {
                    ExtendedNavigator.of(context)
                        .replace(Routes.loginUserInfoPage);
                  }
                }
                // ExtendedNavigator.of(context).push(Routes.fitnessAppHomeScreen);
                // context
                //     .bloc<AuthBloc>()
                //     .add(const AuthBlocEvent.authCheckRequested());
              },
            ),
          );
        }, builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.blue.shade50,
            key: scaffoldKey,
            body: GestureDetector(
              onTap: () {},
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 30),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: FlareActor(
                        "assets/pin_code/otp.flr",
                        animation: "otp",
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.center,
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '手机号验证',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 8),
                      child: RichText(
                        text: TextSpan(
                            text: "已发送验证码到",
                            children: [
                              TextSpan(
                                  text: widget.phoneNumber,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ],
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 30),
                          child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: FitnessAppTheme.nearlyDarkBlue,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 4,
                            obscureText: false,
                            obscuringCharacter: '*',
                            animationType: AnimationType.fade,
                            // validator: (v) {
                            //   if (v.length < 1) {
                            //     return "验证器";
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.underline,
                              // borderRadius: BorderRadius.circular(5),
                              fieldHeight: 60,
                              fieldWidth: 50,
                              activeColor: FitnessAppTheme.nearlyDarkBlue,
                              inactiveColor: Colors.grey.shade400,
                              selectedColor: Colors.black38,
                              activeFillColor: Colors.blue.shade50,
                              selectedFillColor: Colors.blue.shade50,
                              inactiveFillColor: Colors.blue.shade50,
                              // activeFillColor:
                              //     hasError ? Colors.orange : Colors.white,
                            ),
                            dialogConfig: DialogConfig(
                                dialogTitle: "粘贴验证码",
                                dialogContent: "确认粘贴此验证码",
                                affirmativeText: "确认",
                                negativeText: "取消"),
                            cursorColor: Colors.black,
                            animationDuration: Duration(milliseconds: 300),
                            textStyle: TextStyle(fontSize: 20, height: 1.6),
                            backgroundColor: Colors.blue.shade50,
                            enableActiveFill: true,
                            errorAnimationController: errorController,
                            controller: textEditingController,
                            keyboardType: TextInputType.number,
                            // boxShadows: [
                            //   BoxShadow(
                            //     offset: Offset(0, 1),
                            //     color: Colors.black12,
                            //     blurRadius: 10,
                            //   )
                            // ],
                            onCompleted: (v) {
                              print("Completed");
                            },
                            // onTap: () {
                            //   print("Pressed");
                            // },
                            onChanged: (value) =>
                                BlocProvider.of<SignInFormBloc>(context).add(
                                    SignInFormEvent.verificationChanged(value)),
                            // (value) {
                            //   print(value);
                            //   setState(() {
                            //     currentText = value;
                            //   });
                            // },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        state.isSubmitting ? "*请输入正确验证码" : "",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "未收到验证码? ",
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                          children: [
                            TextSpan(
                                text: " 重发",
                                recognizer: onTapRecognizer,
                                style: TextStyle(
                                    color: Color(0xFF5F7BDA),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))
                          ]),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                      child: ButtonTheme(
                        height: 50,
                        child: FlatButton(
                          onPressed: () {
                            formKey.currentState.validate();
                            Provider.of<SignInFormBloc>(context, listen: false)
                              ..add(
                                  SignInFormEvent.getPhone(widget.phoneNumber))
                              ..add(SignInFormEvent
                                  .signInWithPhoneAndSMSCodePressed());
                          },
                          child: Center(
                              child: Text(
                            "验证".toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: FitnessAppTheme.nearlyLightBlue,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: FitnessAppTheme.nearlyLightBlue,
                                offset: Offset(-1, 2),
                                blurRadius: 5)
                          ]),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     FlatButton(
                    //       child: Text("清空"),
                    //       onPressed: () {
                    //         textEditingController.clear();
                    //       },
                    //     ),
                    //     FlatButton(
                    //       child: Text("Set Text"),
                    //       onPressed: () {
                    //         textEditingController.text = "123456";
                    //       },
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
