import 'package:flutter/material.dart';

class ChatInterface extends StatefulWidget {
  ChatInterface({Key key}) : super(key: key);

  @override
  _ChatInterfaceState createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text('data'),
          )
        ],
      ),
      bottomNavigationBar: _immediatelyChange(),
    );
  }

  //底部的立即兑换
  _immediatelyChange() {
    return Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: 50.0,
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 50.0,
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '立即兑换',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
