import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/wxpage/wechat_home_page/wechathomepage_bloc.dart';
import 'package:flutter_ui/injection.dart';

class WechatSalesman extends StatefulWidget {
  final Map<String, dynamic> affData;

  const WechatSalesman({Key key, this.affData}) : super(key: key);
  @override
  _WechatSalesmanState createState() => _WechatSalesmanState();
}

class _WechatSalesmanState extends State<WechatSalesman> {
  String imgWhenNull =
      "https://img.0728jh.com/1332139872148000768/material/fb625605-48d3-4e89-b58e-cbda5b568beb.jpeg";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WechathomepageBloc>()
        ..add(WechathomepageEvent.getTaillsAll(widget.affData["id"])),
      child: BlocConsumer<WechathomepageBloc, WechathomepageState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                title: Text("置业顾问", style: TextStyle(color: Colors.grey[700])),
                elevation: 0.0,
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.grey[700])),
            body: Padding(
              padding: EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                    children: state.salesmanAll.map((item) {
                  return InkWell(
                    child: Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              image: DecorationImage(
                                  image: NetworkImage(item["headimgUrl"] != ""
                                          ? item["headimgUrl"]
                                          : imgWhenNull
                                      // 'https://www.itying.com/images/flutter/2.png'
                                      ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Text(
                            item["realName"],
                            // "赵四",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Expanded(child: SizedBox()),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                color: Colors.grey[100]),
                            child: Icon(
                              Icons.chat,
                              size: 22,
                              color: Colors.cyan,
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      // showDialog(
                      //     barrierDismissible: true,
                      //     context: context,
                      //     builder: (context) {
                      //       return AlertDialog(
                      //         title: Text("提示"),
                      //         content: Text("是否绑定该置业顾问？"),
                      //         actions: <Widget>[
                      //           FlatButton(
                      //             child: Text("取消",
                      //                 style:
                      //                     TextStyle(color: Colors.blue[200])),
                      //             onPressed: () {
                      //               Navigator.of(context).pop(false);
                      //             },
                      //           ),
                      //           FlatButton(
                      //             child: Text("确定"),
                      //             onPressed: () {
                      //               Navigator.of(context).pop(true);
                      //             },
                      //           )
                      //         ],
                      //       );
                      //     }).then((value) async {
                      //   print("balabalabali");
                      // });
                    },
                  );
                }).toList()),
              ),
            ),
          );
        },
      ),
    );
  }
}
