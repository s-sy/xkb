import 'package:flutter/material.dart';

class MessageTabbarView extends StatefulWidget {
  @override
  _MessageTabbarViewState createState() => _MessageTabbarViewState();
}

class _MessageTabbarViewState extends State<MessageTabbarView>
    with TickerProviderStateMixin {
  double itemHeight = 88.0;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity, child: Container(child: Text("1234")));
  }
}
