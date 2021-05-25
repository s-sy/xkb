import 'package:flutter/material.dart';

class AboutUsIntroduce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("介绍")),
      body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Image(
                      image: AssetImage("assets/images/aboutUs.png"),
                      // width: 50,
                    )),
                Container(
                  child: Text(
                    "新客邦是一家扎根于房产平台的技术型服务公司，公司立足于本土化房产平台，更加细致深入服务于天门群众。公司秉承“客户至上，锐意进取”的经营理念，坚持“客户第一”的原则为广大客户提供优质的服务！",
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
