import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_ui/application/messages/processed/processed_bloc.dart';
import 'package:flutter_ui/presentation/core/fintness_app_theme.dart';

class MessageHous extends StatefulWidget {
  @override
  _MessageHousState createState() => _MessageHousState();
}

class _MessageHousState extends State<MessageHous> {
  @override
  void initState() {
    BlocProvider.of<ProcessedBloc>(context)..add(ProcessedEvent.getHouseList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProcessedBloc, ProcessedState>(
      listener: (context, state) {
        // TODO: implement listener
        print(state.endListData);
      },
      builder: (context, state) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text("选择房间:",
                    style: TextStyle(
                      fontFamily: FitnessAppTheme.fontName,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.5,
                      color: Colors.grey[700],
                    )),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text("期数-栋数-单元-房间号",
                    style: TextStyle(
                      fontFamily: FitnessAppTheme.fontName,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.5,
                      color: Colors.grey[700],
                    )),
              )
            ],
          ),
          SizedBox(height: 10),
          if (state.chooseHouse.length != 0)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: state.chooseHouse.map((value) {
                return Container(
                  margin: EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(value,
                      style: TextStyle(
                        fontFamily: FitnessAppTheme.fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: 0.5,
                        color: Colors.blue,
                      )),
                );
              }).toList(),
            ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectButton(state.stagingList, 'Q', state.staging, state),
                // OutlineButton(
                //   onPressed: () async {
                //     await getshowModalBottomSheet(state.stagingList, 'Q');
                //   },
                //   child: Text(state.staging),
                // ),
                selectButton(state.buildingList, 'D', state.building, state),
                // OutlineButton(
                //   onPressed: () async {
                //     if (state.staging == "期数") {
                //       BotToast.showText(text: "请先选择期数");
                //       return;
                //     }
                //     await getshowModalBottomSheet(state.buildingList, 'D');
                //   },
                //   child: Text(state.building),
                // ),
                selectButton(state.entranceList, 'C', state.entrance, state),
                // OutlineButton(
                //   onPressed: () async {
                //     if (state.building == "栋数") {
                //       BotToast.showText(text: "请先选择栋数");
                //       return;
                //     }
                //     await getshowModalBottomSheet(state.entranceList, 'C');
                //   },
                //   child: Text(state.entrance),
                // ),
                selectButton(state.roomList, 'F', state.room, state),
                // OutlineButton(
                //   onPressed: () async {
                //     if (state.entrance == "单元") {
                //       BotToast.showText(text: "请先选择单元");
                //       return;
                //     }
                //     await getshowModalBottomSheet(state.roomList, 'F');
                //   },
                //   child: Text(state.room),
                // ),
                SizedBox(width: 10)
              ],
            ),
          ),
          if (state.staging != "期数" &&
              state.building != "栋数" &&
              state.entrance != "单元" &&
              state.room != "房间号")
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(25.0, 7.0, 25.0, 7.0),
                      margin: EdgeInsets.fromLTRB(10.0, 20.0, 30, 15),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(width: 1.0, color: Colors.blue),
                          borderRadius: BorderRadius.circular(3.0)),
                      child: Text(
                        "确认",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    onTap: () async {
                      if (state.staging == "期数" ||
                          state.building == "栋数" ||
                          state.entrance == "单元" ||
                          state.room == "房间号") {
                        BotToast.showText(text: "请选择完整房源");
                        return;
                      }
                      BlocProvider.of<ProcessedBloc>(context)
                        ..add(ProcessedEvent.saveHouseChoose());
                    }),
                // OutlineButton(
                //   onPressed: () {
                //     if (state.staging == "期数" ||
                //         state.building == "栋数" ||
                //         state.entrance == "单元" ||
                //         state.room == "房间号") {
                //       BotToast.showText(text: "请选择完整房源");
                //       return;
                //     }
                //     // if (state.chooseHouse.length >= 2) {
                //     //   BotToast.showText(text: "最多选两个");
                //     //   return;
                //     // }
                //     BlocProvider.of<ProcessedBloc>(context)
                //       ..add(ProcessedEvent.saveHouseChoose());
                //   },
                //   child: Text("确认"),
                // ),
              ],
            ),
          SizedBox(height: 10)
        ]);
      },
    );
  }

  selectButton(List list, String key, String name, state) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
        margin: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0)),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16.0,
          ),
        ),
      ),
      onTap: () async {
        if (name == "栋数" && state.staging == "期数") {
          BotToast.showText(text: "请先选择期数");
          return;
        }
        if (name == "单元" && state.building == "栋数") {
          BotToast.showText(text: "请先选择栋数");
          return;
        }
        if (name == "房间号" && state.entrance == "单元") {
          BotToast.showText(text: "请先选择单元");
          return;
        }
        await getshowModalBottomSheet(list, key);
      },
    );
  }

  Future getshowModalBottomSheet(list, type) async {
    await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 250.0,
                // decoration: BoxDecoration(color: Colors.yellow),
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, i) => InkWell(
                    child: Container(
                      height: 60,
                      child: Center(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            type == 'F' ? list[i]["serialNumber"] : list[i],
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      Navigator.of(context).pop(
                        // type == 'F' ? list[i]["serialNumber"] : list[i],
                        list[i],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
        }).then((value) {
      print(value);
      if (value == "取消" || value == null) {
      } else {
        print(type);

        BlocProvider.of<ProcessedBloc>(context)
          ..add(ProcessedEvent.saveHouseData(value, type));
        if (type != 'F') {
          BlocProvider.of<ProcessedBloc>(context)
            ..add(ProcessedEvent.getHouseListData());
        }
      }
    });
  }
}
