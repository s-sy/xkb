import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp();
  @override
  Widget build(BuildContext context) {
    return (FlatButton(
      padding: const EdgeInsets.only(
        top: 160.0,
      ),
      onPressed: null,
      child: Text(
        "未能接收短信? 请联系...",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: TextStyle(
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            color: Colors.white,
            fontSize: 12.0),
      ),
    ));
  }
}
