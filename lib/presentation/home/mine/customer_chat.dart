import 'package:flutter/material.dart';

class CustomerChat extends StatefulWidget {
  @override
  _CustomerChatState createState() => _CustomerChatState();
}

class _CustomerChatState extends State<CustomerChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("客户咨询")),
      body: Column(
        children: <Widget>[
          Container(
            child: Text("data"),
          ),
        ],
      ),
    );
  }
}
