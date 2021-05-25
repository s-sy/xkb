import 'package:flutter/material.dart';
import 'package:flutter_ui/presentation/core/app_widget.dart';
import 'package:flutter_ui/presentation/core/fintness_app_theme.dart';

class SignIn extends StatelessWidget {
  SignIn();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      height: 50.0,
      alignment: FractionalOffset.center,
      // decoration: BoxDecoration(
      //   color: const Color.fromRGBO(118, 188, 124, 1.0),
      //   borderRadius: BorderRadius.all(const Radius.circular(8.0)),
      // ),
      decoration: BoxDecoration(
        color: FitnessAppTheme.nearlyDarkBlue,
        gradient: LinearGradient(colors: [
          FitnessAppTheme.nearlyDarkBlue,
          HexColor('#6A88E5'),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        // shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: FitnessAppTheme.nearlyDarkBlue.withOpacity(0.4),
              offset: const Offset(8.0, 16.0),
              blurRadius: 16.0),
        ],
        borderRadius: BorderRadius.all(const Radius.circular(8.0)),
      ),
      child: Text(
        "获取短信验证码",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
