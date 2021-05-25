import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/message/bloc/web_scoket_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RemindList extends StatefulWidget {
  @override
  _RemindListState createState() => _RemindListState();
}

class _RemindListState extends State<RemindList> {
  // List<RemindListBean> _listBean = [];
  List _list = [];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int count = 1;
  bool _isBottomSheet = false;

  @override
  void initState() {
    //这里20条，最近的时间排最前面
    // _listBean.add(
    //     RemindListBean(phone: "13421541220", time: "2021.01.17", number: "3"));
    // _listBean.add(
    //     RemindListBean(phone: "13412548771", time: "2021.01.12", number: "5"));
    // _listBean.add(
    //     RemindListBean(phone: "16874214447", time: "2010.05.08", number: "2"));
    super.initState();
  }

  // _onRefresh() async {
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   print("-------");
  //   //  BlocProvider.of<WebScoketBloc>(context).add(
  //   //                 WebScoketEvent.);
  //   _refreshController.refreshCompleted();
  // }

  // void _onLoading() async {
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   BlocProvider.of<WebScoketBloc>(context)
  //       .add(WebScoketEvent.managerRemindList(count));
  //   if (mounted)
  //     setState(() {
  //       count++;
  //     });
  //   _refreshController.loadComplete();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => getIt<WebScoketBloc>()
          ..add(const WebScoketEvent.batchUpdate())
          ..add(const WebScoketEvent.managerRemindList(1)),
        child: BlocConsumer<WebScoketBloc, WebScoketState>(
            listener: (context, state) async {
          print(state.managerRemindList);
          if (!_isBottomSheet) {
            for (int i = 0; i < state.managerRemindList.length; i++) {
              _list.add(state.managerRemindList[i]);
            }
          }
          if (_isBottomSheet && state.isManagerRemindDetails) {
            _openModalBottomSheetText(
                state.managerRemindDetails["matchingNumber"], context);
          }
        }, builder: (BuildContext context, state) {
          return SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: WaterDropMaterialHeader(),
              footer: CustomFooter(
                builder: (context, LoadStatus mode) {
                  Widget body;
                  if (mode == LoadStatus.idle) {
                    body = Text("pull up load");
                  } else if (mode == LoadStatus.loading) {
                    body = CupertinoActivityIndicator();
                  } else if (mode == LoadStatus.failed) {
                    body = Text("Load Failed!Click retry!");
                  } else if (mode == LoadStatus.canLoading) {
                    body = Text("release to load more");
                  } else {
                    body = Text("No more Data");
                  }
                  return Container(
                    height: 55.0,
                    child: Center(child: body),
                  );
                },
              ),
              controller: _refreshController,
              onRefresh: () async {
                await Future.delayed(Duration(milliseconds: 1000));
                if (count != 1) {
                  _list.clear();
                }
                BlocProvider.of<WebScoketBloc>(context)
                    .add(WebScoketEvent.managerRemindList(1));
                setState(() {
                  count = 1;
                });
                _refreshController.refreshCompleted();
              },
              onLoading: () async {
                await Future.delayed(Duration(milliseconds: 1000));
                BlocProvider.of<WebScoketBloc>(context)
                    .add(WebScoketEvent.managerRemindList(count + 1));
                if (mounted)
                  setState(() {
                    count++;
                  });
                _refreshController.loadComplete();
              },
              child: _listView(state, context));
        }));
  }

  _listView(state, context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      scrollDirection: Axis.vertical,
      reverse: false,
      primary: true,
      shrinkWrap: true,
      itemCount: _list.length,
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemBuilder: (context, i) => InkWell(
        child: Container(
          height: 50,
          margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                    text: _list[i]["phone"],
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                    children: [
                      TextSpan(
                          text: "号码在",
                          style: TextStyle(color: Colors.grey[700])),
                      TextSpan(
                          text: _list[i]["createTime"].substring(0, 16),
                          style: TextStyle(color: Colors.blue)),
                      TextSpan(
                          text: "被推荐了",
                          style: TextStyle(color: Colors.grey[700])),
                      // TextSpan(
                      //     text: _listBean[i].number,
                      //     style: TextStyle(color: Colors.blue)),
                      // TextSpan(
                      //     text: "次", style: TextStyle(color: Colors.grey[700])),
                    ]),
                textDirection: TextDirection.ltr,
              ),
              Icon(
                Icons.navigate_next,
                color: Colors.grey[500],
                size: 25,
              )
            ],
          ),
        ),
        onTap: () {
          // print(_list[i]["phone"]);
          if (_list[i]["phone"].toString().contains('**')) {
            BlocProvider.of<WebScoketBloc>(context).add(
                WebScoketEvent.managerRemindDetails(
                    _list[i]["phone"], _list[i]["tenantId"]));
            setState(() {
              _isBottomSheet = true;
            });
          } else {
            ExtendedNavigator.of(context).push(Routes.remindDetailsView,
                arguments: RemindDetailsViewArguments(
                  phone: _list[i]["phone"],
                  tenantId: _list[i]["tenantId"],
                ));
          }
          // ExtendedNavigator.of(context).push(Routes.remindDetailsView,
          //     arguments: RemindDetailsViewArguments(
          //       phone: _list[i]["phone"],
          //       tenantId: _list[i]["tenantId"],
          //     ));
        },
        onLongPress: () {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("提示"),
                  content: Text("删除不可恢复，确定要删除吗？"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("确定"),
                      onPressed: () {
                        setState(() {
                          _list.remove(_list[i]);
                        });
                        Navigator.of(context).pop(true);
                      },
                    )
                  ],
                );
              });
        },
      ),
    );
  }

  // List _bottomPhoneList(state) {
  //   List list = [];
  //   if (state.managerRemindDetails["matchingNumber"] != null) {
  //     list = state.managerRemindDetails["matchingNumber"];
  //   } else {
  //     list = ['暂无号码'];
  //   }
  //   return list;
  // }

  Future _openModalBottomSheetText(List list, context) async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              Container(
                  height: 250.0,
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, i) => InkWell(
                            splashColor: Colors.lightBlueAccent,
                            child: Container(
                              height: 50,
                              child: Center(
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    list[i] + " ",
                                    // maxLines: 1,
                                    // overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () async {
                              ExtendedNavigator.of(context)
                                  .push(Routes.remindDetailsView,
                                      arguments: RemindDetailsViewArguments(
                                        phone: list[i],
                                        tenantId: _list[i]["tenantId"],
                                      ));
                              Navigator.pop(context, '取消');
                            },
                          ))),
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
    setState(() {
      _isBottomSheet = false;
    });
    BlocProvider.of<WebScoketBloc>(context).add(WebScoketEvent.isBottomSheet());
  }
}
