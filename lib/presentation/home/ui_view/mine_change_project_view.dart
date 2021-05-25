import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MineChangeProjectView extends StatefulWidget {
  final List listHouse;
  final String house;
  final List listHouseId;
  final List listHouseShortCode;

  final AnimationController animationController;
  final Animation animation;

  const MineChangeProjectView(
      {Key key,
      this.listHouse,
      this.house,
      this.listHouseId,
      this.listHouseShortCode,
      this.animationController,
      this.animation})
      : super(key: key);

  @override
  _MineChangeProjectViewState createState() => _MineChangeProjectViewState();
}

const HOUSESNAME = "HOUSESNAME";
const HOUSEID = "HOUSEID";
const HOUSESHORTCODE = "HOUSESHORTCODE";

class _MineChangeProjectViewState extends State<MineChangeProjectView> {
  String houseName = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    houseName = widget.house;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.animation,
          child: new Transform(
              transform: new Matrix4.translationValues(
                  0.0, 30 * (1.0 - widget.animation.value), 0.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    child: Container(
                        height: 45.0,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.loop,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text('切换项目',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[700])),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Text(
                                "  " + houseName + "  ",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                            )
                          ],
                        )),
                    onTap: () {
                      _openModalBottomSheetText();
                    },
                  )
                ],
              )),
        );
      },
    );
  }

  Future _openModalBottomSheetText() async {
    await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  height: 150.0,
                  child: ListView.builder(
                      itemCount: widget.listHouse.length,
                      itemBuilder: (context, i) => Container(
                          height: 50,
                          child: Center(
                            child: InkWell(
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  "  " + widget.listHouse[i] + "  ",
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              onTap: () async {
                                setState(() {
                                  houseName = widget.listHouse[i];
                                });
                                SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                sharedPreferences.setString(
                                    HOUSESNAME, widget.listHouse[i]);
                                sharedPreferences.setString(
                                    HOUSEID, widget.listHouseId[i]);
                                sharedPreferences.setString(HOUSESHORTCODE,
                                    widget.listHouseShortCode[i]);
                                Navigator.pop(context, widget.listHouse[i]);
                              },
                            ),
                          )))),
              // ListTile(
              //   title: Text('新增',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(color: Colors.blue)),
              //   onTap: () {
              //     showDialog(
              //         barrierDismissible: true,
              //         context: context,
              //         builder: (context) {
              //           return AlertDialog(
              //             title: Text("提示"),
              //             content: TextField(
              //               maxLines: 5,
              //               minLines: 1,
              //               textInputAction: TextInputAction.go,
              //               decoration: InputDecoration(
              //                 hintText: '请输入内容(不能用新增吧)',
              //                 border: InputBorder.none,
              //                 isDense: true,
              //                 hintStyle: TextStyle(color: Colors.grey[400]),
              //               ),
              //             ),
              //             actions: <Widget>[
              //               FlatButton(
              //                 child: Text("确定"),
              //                 onPressed: () {
              //                   Navigator.of(context).pop(true);
              //                 },
              //               )
              //             ],
              //           );
              //         });
              //   },
              // ),
              ListTile(
                title: Text('取消',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue[200])),
                onTap: () {
                  Navigator.pop(context, '取消');
                },
              ),
            ],
          );
        });
    // print(option);
  }
}
