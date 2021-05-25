import 'package:flutter/material.dart';

class TestCustomer extends StatefulWidget {
  @override
  _TestCustomerState createState() => _TestCustomerState();
}

class _TestCustomerState extends State<TestCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // brightness: Brightness.dark,
        // backgroundColor: Colors.white,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        // toolbarHeight: 0,
        title: Text(
          "data",
          style: TextStyle(color: Colors.black),
        ),
      ),
      // extendBodyBehindAppBar: true,
      body: Center(
        child: Text("data"),
      ),
      // body: SafeArea(child: Container(color: Colors.red))
    );
  }
}
