import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WechatNewsInformation extends StatefulWidget {
  final String url;

  const WechatNewsInformation({Key key, this.url}) : super(key: key);
  @override
  _WechatNewsInformationState createState() => _WechatNewsInformationState();
}

class _WechatNewsInformationState extends State<WechatNewsInformation> {
  Future<void> _launched;

  // Future<void> _launchInBrowser(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(
  //       url,
  //       forceSafariVC: false,
  //       forceWebView: false,
  //       headers: <String, String>{'my_header_key': 'my_header_value'},
  //     );
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    // const String toLaunch = 'https://www.baidu.com/';
    _launched = _launchInWebViewOrVC(widget.url);
  }

  // Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
  //   if (snapshot.hasError) {
  //     return Text('Error: ${snapshot.error}');
  //   } else {
  //     return const Text('');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    const String toLaunch = 'https://www.baidu.com/';
    return Scaffold(
        appBar: AppBar(
            title: Text("动态", style: TextStyle(color: Colors.grey[700])),
            elevation: 0.0,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.grey[700])),
        body: Center(
          child: ElevatedButton(
            onPressed: () => setState(() {
              //这里目前用不上了～～～～
              _launched = _launchInWebViewOrVC(toLaunch);
            }),
            child: const Text('Launch in app'),
          ),
        ));
  }

  // @override
  // Widget build(BuildContext context) {
  //   const String toLaunch = 'https://www.baidu.com/';
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("ddd"),
  //     ),
  //     body: ListView(
  //       children: <Widget>[
  //         Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             // Padding(
  //             //   padding: const EdgeInsets.all(16.0),
  //             //   child: TextField(
  //             //       onChanged: (String text) => _phone = text,
  //             //       decoration: const InputDecoration(
  //             //           hintText: 'Input the phone number to launch')),
  //             // ),
  //             // ElevatedButton(
  //             //   onPressed: () => setState(() {
  //             //     _launched = _makePhoneCall('tel:$_phone');
  //             //   }),
  //             //   child: const Text('Make phone call'),
  //             // ),
  //             // const Padding(
  //             //   padding: EdgeInsets.all(16.0),
  //             //   child: Text(toLaunch),
  //             // ),
  //             // ElevatedButton(
  //             //   onPressed: () => setState(() {
  //             //     _launched = _launchInBrowser(toLaunch);
  //             //   }),
  //             //   child: const Text('Launch in browser'),
  //             // ),
  //             const Padding(padding: EdgeInsets.all(16.0)),
  //             ElevatedButton(
  //               onPressed: () => setState(() {
  //                 _launched = _launchInWebViewOrVC(toLaunch);
  //               }),
  //               child: const Text('Launch in app'),
  //             ),
  //             // ElevatedButton(
  //             //   onPressed: () => setState(() {
  //             //     _launched = _launchInWebViewWithJavaScript(toLaunch);
  //             //   }),
  //             //   child: const Text('Launch in app(JavaScript ON)'),
  //             // ),
  //             // ElevatedButton(
  //             //   onPressed: () => setState(() {
  //             //     _launched = _launchInWebViewWithDomStorage(toLaunch);
  //             //   }),
  //             //   child: const Text('Launch in app(DOM storage ON)'),
  //             // ),
  //             // const Padding(padding: EdgeInsets.all(16.0)),
  //             // ElevatedButton(
  //             //   onPressed: () => setState(() {
  //             //     _launched = _launchUniversalLinkIos(toLaunch);
  //             //   }),
  //             //   child: const Text(
  //             //       'Launch a universal link in a native app, fallback to Safari.(Youtube)'),
  //             // ),
  //             // const Padding(padding: EdgeInsets.all(16.0)),
  //             // ElevatedButton(
  //             //   onPressed: () => setState(() {
  //             //     _launched = _launchInWebViewOrVC(toLaunch);
  //             //     Timer(const Duration(seconds: 5), () {
  //             //       print('Closing WebView after 5 seconds...');
  //             //       closeWebView();
  //             //     });
  //             //   }),
  //             //   child: const Text('Launch in app + close after 5 seconds'),
  //             // ),
  //             const Padding(padding: EdgeInsets.all(16.0)),
  //             // FutureBuilder<void>(future: _launched, builder: _launchStatus),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

}
