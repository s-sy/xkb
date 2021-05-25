import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';

class ContactsRemarks extends StatefulWidget {
  final String phone;
  final String contactAvatar;
  final String contactName;
  final String contactId;

  const ContactsRemarks(
      {Key key,
      this.phone,
      this.contactAvatar,
      this.contactName,
      this.contactId})
      : super(key: key);
  @override
  _ContactsRemarksState createState() => _ContactsRemarksState();
}

class _ContactsRemarksState extends State<ContactsRemarks> {
  String _nickName = "华仔";
  @override
  void initState() {
    // print(widget.contactAvatar);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
        // onPointerDown: (onPointerDown) {
        //   FocusScope.of(context).requestFocus(FocusNode());
        //   print('手指按下回调');
        // },
        child: Scaffold(
            appBar: AppBar(title: Text(widget.contactName), toolbarHeight: 40),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Container(
                    height: 100,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 15),
                          height: 75,
                          width: 75,
                          // decoration: BoxDecoration(border: Border.all(width: 1.0)),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(10)),
                            clipBehavior: Clip.antiAlias,
                            child: Image.network(widget.contactAvatar),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 25,
                                // decoration:
                                //     BoxDecoration(border: Border.all(width: 1.0)),
                                child: Text(
                                  // "德华",
                                  widget.contactName,
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              // SizedBox(height: 10),
                              // Container(
                              //   height: 20,
                              //   // decoration:
                              //   //     BoxDecoration(border: Border.all(width: 1.0)),
                              //   child: Text("昵称:" + _nickName,
                              //       style: TextStyle(color: Colors.grey)),
                              // ),
                              // Text("微信号：MM5558541",
                              //     style: TextStyle(color: Colors.grey)),
                              // Text("地区：湖北 天门",
                              //     style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 0.5, color: Color(0xffe5e5e5))),
                    ),
                    child: Row(
                      children: <Widget>[
                        Text("电话号码"),
                        SizedBox(width: 20),
                        Text(
                            // "1342548856",
                            widget.phone,
                            style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                  // Container(
                  //   height: 60,
                  //   margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  //   decoration: BoxDecoration(
                  //     border: Border(
                  //         bottom:
                  //             BorderSide(width: 0.5, color: Color(0xffe5e5e5))),
                  //   ),
                  //   child: Row(
                  //     children: <Widget>[
                  //       Text("昵称"),
                  //       SizedBox(width: 30),
                  //       Container(
                  //           width: 200,
                  //           height: 40,
                  //           // decoration: BoxDecoration(
                  //           //     color: Colors.grey[100],
                  //           //     borderRadius: BorderRadius.circular(5.0)),
                  //           child: TextField(
                  //             style: TextStyle(color: Colors.blue),
                  //             decoration: InputDecoration(
                  //                 hintText: '修改昵称',
                  //                 border: InputBorder.none,
                  //                 hintStyle: TextStyle(
                  //                     color: Colors.grey[400], fontSize: 14.0)),
                  //             textAlign: TextAlign.start,
                  //             textInputAction: TextInputAction.go,
                  //             onSubmitted: (value) {
                  //               // print(value);
                  //               showDialog(
                  //                   barrierDismissible: true,
                  //                   context: context,
                  //                   builder: (context) {
                  //                     return AlertDialog(
                  //                       title: Text("提示"),
                  //                       content: Text("是否修改昵称"),
                  //                       actions: <Widget>[
                  //                         FlatButton(
                  //                           child: Text("取消",
                  //                               style: TextStyle(
                  //                                   color: Colors.blue[200])),
                  //                           onPressed: () {
                  //                             Navigator.of(context).pop(false);
                  //                           },
                  //                         ),
                  //                         FlatButton(
                  //                           child: Text("确定"),
                  //                           onPressed: () {
                  //                             setState(() {
                  //                               _nickName = value;
                  //                             });
                  //                             Navigator.of(context).pop(true);
                  //                           },
                  //                         )
                  //                       ],
                  //                     );
                  //                   });
                  //             },
                  //             onChanged: (value) {
                  //               // print(value);
                  //             },
                  //           )),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 50),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.message, color: Colors.blue[300], size: 30),
                        SizedBox(width: 10),
                        Text("发消息",
                            style: TextStyle(
                                color: Colors.blue[300],
                                fontSize: 18,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                    onTap: () {
                      ExtendedNavigator.of(context).push(Routes.messageChat,
                          arguments: MessageChatArguments(
                            contactId: widget.contactId,
                            headImg: widget.contactAvatar,
                            contactName: widget.contactName,
                          ));
                    },
                  ),
                ],
              ),
            )));
  }
}
