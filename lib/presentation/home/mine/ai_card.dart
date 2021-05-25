// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_ui/presentation/components/border_dotted_line.dart';
// import 'package:flutter_ui/presentation/home/mine/screen_size_config.dart';

// class AiCard extends StatefulWidget {
//   @override
//   _AiCardState createState() => _AiCardState();
// }

// class _AiCardState extends State<AiCard> {
//   // Paint _paint = new Paint()
//   //   ..color = Colors.blueAccent
//   //   ..strokeCap = StrokeCap.round
//   //   ..isAntiAlias = true
//   //   ..strokeWidth = 5.0
//   //   ..style = PaintingStyle.stroke;
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("我的名片"
//             // , style: TextStyle(color: Colors.black)
//             ),
//         backgroundColor: Colors.grey[200],
//         elevation: 0,
//         shadowColor: Colors.black,
//       ),
//       backgroundColor: Colors.grey[100],
//       body: Column(
//         children: <Widget>[
//           Container(
//             height: 50,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border(
//                   bottom: BorderSide(width: 0.5, color: Color(0xffe5e5e5))),
//             ),
//             child: Row(
//               children: <Widget>[
//                 SizedBox(width: 10),
//                 Text("主推楼盘",
//                     style: TextStyle(color: Colors.grey[700], fontSize: 15)),
//                 Expanded(child: Text("")),
//                 Text("天门卓尔生活城",
//                     style: TextStyle(color: Colors.grey[500], fontSize: 15)),
//                 Icon(Icons.navigate_next, color: Colors.grey[400]),
//                 SizedBox(width: 10),
//               ],
//             ),
//           ),
//           // Expanded(
//           //   child:
//           SingleChildScrollView(
//               child: Container(
//             // margin: EdgeInsets.fromLTRB(50, 20, 50, 20),
//             // height: SizeConfig.blockSizeVertical * 65,
//             // width: SizeConfig.blockSizeHorizontal * 70, 把这里写死
//             height: 400,
//             decoration: BoxDecoration(color: Colors.blue),
//             child: Container(
//               margin: EdgeInsets.fromLTRB(15, 25, 15, 25),
//               decoration: BoxDecoration(color: Colors.blue),
//               child: Material(
//                 color: Colors.white,
//                 elevation: 2,
//                 shape: CouponShapeBorder(),
//                 child: Container(
//                   // alignment: Alignment.center,
//                   // padding: EdgeInsets.all(10),
//                   // height: 350,
//                   // width: 250,
//                   // height: SizeConfig.blockSizeVertical * 50,
//                   width: SizeConfig.blockSizeHorizontal * 60,

//                   child: Column(
//                     // mainAxisAlignment: MainAxisAlignment.spaceBetween, 没什么用了
//                     children: <Widget>[
//                       // SizedBox(height: 20),
//                       Container(
//                         width: 50,
//                         height: 50,
//                         margin: EdgeInsets.only(top: 10),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50.0),
//                           image: DecorationImage(
//                               image: NetworkImage(
//                                   'https://www.itying.com/images/flutter/7.png'),
//                               fit: BoxFit.cover),
//                         ),
//                       ),
//                       Container(
//                           child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: <Widget>[
//                           Image.asset(
//                             "assets/images/wheat_left.png",
//                             width: 50,
//                             height: 100,
//                           ),
//                           Column(
//                             children: <Widget>[
//                               Text(
//                                 "刘聪",
//                                 style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.grey[600]),
//                               ),
//                               SizedBox(height: 13),
//                               Text(
//                                 "13425478445",
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                           Image.asset(
//                             "assets/images/wheat_right.png",
//                             width: 50,
//                             height: 100,
//                           ),
//                         ],
//                       )),
//                       // SizedBox(height: 10),
//                       Container(
//                         height: 40,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5.0),
//                             color: Colors.grey[200]),
//                         child: Center(
//                           child: Text(
//                             "将心比心,买的放心",
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.grey[500],
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       ),
//                       // SizedBox(height: 18),
//                       // Container(
//                       //   width: 250.0,
//                       //   child: DashedRect(
//                       //       color: Colors.grey[300],
//                       //       strokeWidth: 1.0,
//                       //       gap: 3.0),
//                       // ),
//                       Container(
//                         height: 150,
//                         // margin: EdgeInsets.only(bottom: 10),
//                         // decoration: BoxDecoration(color: Colors.yellow[100]),
//                         child: Image.asset(
//                           "assets/images/wechat_code.png",
//                           // width: 50,
//                           // height: 100,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           )),
//           // ),
//           Expanded(child: Text("")),
//           Container(
//               margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
//               width: 300,
//               height: 50,
//               child: RaisedButton(
//                   color: Colors.blue[400],
//                   splashColor: Colors.lightBlueAccent,
//                   child: Text(
//                     "预览",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 17),
//                   ),
//                   onPressed: () {})),
//         ],
//       ),
//     );
//   }
// }

// class CouponShapeBorder extends ShapeBorder {
//   final double lineRate;

//   CouponShapeBorder({this.lineRate = 0.7});

//   @override
//   EdgeInsetsGeometry get dimensions => null;

//   @override
//   Path getInnerPath(Rect rect, {TextDirection textDirection}) {
//     return null;
//   }

//   @override
//   ShapeBorder scale(double t) {
//     return null;
//   }

//   @override
//   Path getOuterPath(Rect rect, {TextDirection textDirection}) {
//     var path = Path();
//     path.addRect(rect);

//     _formHoldLeft(path, rect);
//     _formHoldRight(path, rect);
//     path.fillType = PathFillType.evenOdd;
//     return path;
//   }

//   _formHoldLeft(Path path, Rect rect) {
//     path.addArc(
//         Rect.fromCenter(
//             center: Offset(0, lineRate * rect.height),
//             width: 23.0,
//             height: 23.0),
//         -pi / 2,
//         pi);
//   }

//   _formHoldRight(Path path, Rect rect) {
//     path.addArc(
//         Rect.fromCenter(
//             center: Offset(rect.width, lineRate * rect.height),
//             width: 23.0,
//             height: 23.0),
//         pi / 2,
//         pi);
//   }

//   @override
//   void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
//     var paint = Paint()
//       ..color = Colors.grey[300]
//       ..strokeWidth = 2.0
//       ..style = PaintingStyle.stroke
//       ..strokeJoin = StrokeJoin.round;
//     var _paint = Paint()
//       ..color = Colors.blue
//       ..strokeWidth = 2.0
//       ..style = PaintingStyle.stroke
//       ..strokeJoin = StrokeJoin.round;
//     canvas.drawLine(Offset(rect.width * 0.18, rect.height * 0.3),
//         Offset(rect.width * 0.35, 30), _paint);
//     // canvas.drawLine(Offset(30, 30), Offset(70, 30), _paint);
//     // canvas.drawLine(Offset(30, 34), Offset(70, 34), _paint);

//     canvas.drawLine(Offset(150, 30), Offset(190, 30), _paint);
//     canvas.drawLine(Offset(150, 34), Offset(190, 34), _paint);
//     // canvas.drawLine(Offset(0, lineRate * rect.height),
//     //     Offset(rect.width, lineRate * rect.height), paint); 实线
//     _drawDashLine(canvas, Offset(15, lineRate * rect.height), rect.width / 4,
//         rect.width - 30, paint);
//   }

//   _drawDashLine(
//       Canvas canvas, Offset start, double count, double length, Paint paint) {
//     var step = length / count / 2;
//     for (int i = 0; i < count; i++) {
//       var offset = start + Offset(2 * step * i, 0);
//       canvas.drawLine(offset, offset + Offset(0, step), paint);
//     }
//   }
// }

// // class PaintDemo extends CustomPainter {
// //   Paint _paint;

// //   PaintDemo() {
// //     _paint = Paint()
// //           ..color = Colors.blue // 画笔的颜色
// //           ..strokeWidth = 2.0 // 线的宽度
// //           ..style = PaintingStyle.fill // fill: 填充， stroke: 空心
// //         ;
// //   }

// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     canvas.drawLine(Offset(0, 0), Offset(40, 0), _paint);
// //     canvas.drawLine(Offset(0, 4), Offset(40, 4), _paint);

// //     // canvas.drawLine(Offset(110, 0), Offset(150, 0), _paint);
// //     // canvas.drawLine(Offset(110, 4), Offset(150, 4), _paint);

// //     // canvas.drawLine(Offset(40, 56), Offset(80, 56), _paint);
// //     // canvas.drawLine(Offset(40, 60), Offset(80, 60), _paint);

// //     // canvas.drawLine(Offset(150, 56), Offset(190, 56), _paint);
// //     // canvas.drawLine(Offset(150, 60), Offset(190, 60), _paint);

// //     // canvas.drawCircle(Offset(100, 100), 50, _paint);
// //     // Size size = Size(200, 300);
// //     // // 可以通过Offset和Size来创建一个Rect，Offset 决定他右上角的坐标    Size 决定他的大小
// //     // Rect rect = Offset(200, 200) & size;
// //     // canvas.drawRect(
// //     //     rect,
// //     //     Paint()
// //     //       ..color = Colors.red
// //     //       ..strokeWidth = 3.0);

// //     // // 绘制阴影
// //     // canvas.drawShadow(
// //     //     Path()
// //     //       ..moveTo(30.0, 500.0)
// //     //       ..lineTo(320.0, 500.0)
// //     //       ..lineTo(120.0, 660.0)
// //     //       ..lineTo(30.0, 660.0)
// //     //       ..close(),
// //     //     Colors.blue,
// //     //     3,
// //     //     false);
// //   }

// //   @override
// //   bool shouldRepaint(CustomPainter oldDelegate) {
// //     return true;
// //   }
// // }

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/mine/bloc/mine_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/home/mine/screen_size_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AiCard extends StatefulWidget {
  @override
  _AiCardState createState() => _AiCardState();
}

class _AiCardState extends State<AiCard> {
  String cachedSignInUser = "";
  String houseName = "";

  List<String> imagePaths = [];
  GlobalKey rootWidgetKey = GlobalKey();
  // List<Uint8List> images = List();
  // Uint8List pngBytes;
  _capturePng() async {
    try {
      RenderRepaintBoundary boundary =
          rootWidgetKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      String dir = (await getApplicationDocumentsDirectory()).path;
      File file = File(
          "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".png");
      await file.writeAsBytes(pngBytes);
      // images.add(pngBytes);
      setState(() {
        imagePaths.add(file.path);
      });
      return file.path;
    } catch (e) {
      print(e);
    }
    return null;
  }

  _getValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    houseName = sharedPreferences.get('HOUSESNAME');
    if (houseName == null) {
      String affiliateds = sharedPreferences.get('AFFILIATEDS');
      if (affiliateds != null) {
        houseName = jsonDecode(affiliateds)[0]["projectName"];
      }
    }
    setState(() {
      cachedSignInUser;
      houseName;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    _getValue();
    super.initState();
    // Future.delayed(Duration(seconds: 2), () {
    //   print(cachedSignInUser);
    // });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (context) => getIt<MineBloc>()..add(MineEvent.getErWeiCode()),
        child:
            BlocConsumer<MineBloc, MineState>(listener: (context, state) async {
          print(state.getErWeiCode);
        }, builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text("我的名片"),
                elevation: 0,
              ),
              backgroundColor: Colors.grey[100],
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(
                                width: 0.5, color: Color(0xffe5e5e5))),
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 10),
                          Text("主推楼盘",
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 15)),
                          Expanded(child: Text("")),
                          Text(
                              // "天门卓尔生活城",
                              houseName,
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 15)),
                          // Icon(Icons.navigate_next, color: Colors.grey[400]),
                          SizedBox(width: 20),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    RepaintBoundary(
                        key: rootWidgetKey,
                        child: Container(
                            height: 450,
                            width: 250,
                            decoration: BoxDecoration(color: Colors.blue),
                            child: Container(
                                margin: EdgeInsets.fromLTRB(15, 25, 15, 25),
                                decoration: BoxDecoration(color: Colors.blue),
                                child: Material(
                                  color: Colors.white,
                                  elevation: 2,
                                  shape: CouponShapeBorder(),
                                  child: Container(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: <Widget>[
                                          if (cachedSignInUser != "")
                                            Container(
                                              width: 50,
                                              height: 50,
                                              margin: EdgeInsets.only(top: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      // 'https://www.itying.com/images/flutter/7.png'
                                                      jsonDecode(
                                                              cachedSignInUser)[
                                                          'headimgUrl'],
                                                    ),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          SizedBox(height: 10),
                                          Container(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Image.asset(
                                                "assets/images/wheat_left.png",
                                                width: 50,
                                                height: 100,
                                              ),
                                              Column(
                                                children: <Widget>[
                                                  if (cachedSignInUser != "")
                                                    Text(
                                                      // "刘聪",
                                                      jsonDecode(
                                                              cachedSignInUser)[
                                                          'realName'],
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Colors.grey[600]),
                                                    ),
                                                  SizedBox(height: 13),
                                                  if (cachedSignInUser != "")
                                                    Text(
                                                      // "13425478445",
                                                      jsonDecode(
                                                              cachedSignInUser)[
                                                          'phone'],
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                ],
                                              ),
                                              Image.asset(
                                                "assets/images/wheat_right.png",
                                                width: 50,
                                                height: 100,
                                              ),
                                            ],
                                          )),
                                          SizedBox(height: 30),
                                          Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                color: Colors.grey[200]),
                                            child: Center(
                                              child: Text(
                                                "将心比心,买的放心",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey[500],
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Container(
                                            child: Text("微信扫码或长按",
                                                style: TextStyle(
                                                    color: Colors.grey[300])),
                                          ),
                                          Container(
                                            child: Text("查看小程序名片",
                                                style: TextStyle(
                                                    color: Colors.grey[300])),
                                          ),
                                          if (state.getErWeiCode != null &&
                                              state.getErWeiCode != "")
                                            Image.file(
                                              File(state.getErWeiCode),
                                              height: 100,
                                              // fit: BoxFit.fill,
                                            )
                                          // Container(
                                          //   height: 100,
                                          //   child:
                                          //       // Image.file(state.getErWeiCode, fit: BoxFit.cover)
                                          //       Image.asset(
                                          //     "assets/images/wechat_code.png",
                                          //     // state.getErWeiCode
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // ),
                                )))),
                    SizedBox(height: 40),
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        width: 300,
                        height: 50,
                        child: RaisedButton(
                            color: Colors.blue[400],
                            splashColor: Colors.lightBlueAccent,
                            child: Text(
                              "分享",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17),
                            ),
                            onPressed: () async {
                              // BlocProvider.of<MineBloc>(context)
                              //     .add(MineEvent.shareCode());
                              await this._capturePng();

                              // if (pngBytes != null) {
                              //   print(pngBytes);
                              //   File('my_image.jpg')
                              //       .writeAsBytes(pngBytes)
                              //       .then((value) => {
                              //             imagePaths.add(value.path),
                              //             Share.shareFiles(imagePaths)
                              //           });
                              // }
                              showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("提示"),
                                      content: Text("请确认是否分享"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("取消",
                                              style: TextStyle(
                                                  color: Colors.blue[200])),
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
                                          },
                                        ),
                                        FlatButton(
                                          child: Text("确定"),
                                          onPressed: () {
                                            if (imagePaths.isNotEmpty) {
                                              Share.shareFiles(imagePaths);
                                            } else {
                                              print('imagePaths并没有数据啊！！！');
                                            }
                                            Navigator.of(context).pop(true);
                                          },
                                        )
                                      ],
                                    );
                                  }).then((value) {
                                imagePaths.clear();
                                print("balabalabali");
                              });
                            })),
                    // Container(
                    //   height: 300,
                    //   child: ListView.builder(
                    //     itemBuilder: (context, index) {
                    //       return Image.memory(
                    //         images[index],
                    //         fit: BoxFit.cover,
                    //       );
                    //     },
                    //     itemCount: images.length,
                    //     scrollDirection: Axis.horizontal,
                    //   ),
                    // )
                  ],
                ),
              ));
        }));
  }
}

class CouponShapeBorder extends ShapeBorder {
  final double lineRate;

  CouponShapeBorder({this.lineRate = 0.7});

  @override
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return null;
  }

  @override
  ShapeBorder scale(double t) {
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    var path = Path();
    path.addRect(rect);

    _formHoldLeft(path, rect);
    _formHoldRight(path, rect);
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  _formHoldLeft(Path path, Rect rect) {
    path.addArc(
        Rect.fromCenter(
            center: Offset(0, lineRate * rect.height),
            width: 23.0,
            height: 23.0),
        -pi / 2,
        pi);
  }

  _formHoldRight(Path path, Rect rect) {
    path.addArc(
        Rect.fromCenter(
            center: Offset(rect.width, lineRate * rect.height),
            width: 23.0,
            height: 23.0),
        pi / 2,
        pi);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    var paint = Paint()
      ..color = Colors.grey[300]
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;
    var _paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;
    canvas.drawLine(Offset(30, 30), Offset(70, 30), _paint);
    canvas.drawLine(Offset(30, 34), Offset(70, 34), _paint);

    canvas.drawLine(Offset(150, 30), Offset(190, 30), _paint);
    canvas.drawLine(Offset(150, 34), Offset(190, 34), _paint);
    // canvas.drawLine(Offset(0, lineRate * rect.height),
    //     Offset(rect.width, lineRate * rect.height), paint); 实线
    _drawDashLine(canvas, Offset(15, lineRate * rect.height), rect.width / 4,
        rect.width - 30, paint);
  }

  _drawDashLine(
      Canvas canvas, Offset start, double count, double length, Paint paint) {
    var step = length / count / 2;
    for (int i = 0; i < count; i++) {
      var offset = start + Offset(2 * step * i, 0);
      canvas.drawLine(offset, offset + Offset(0, step), paint);
    }
  }
}
