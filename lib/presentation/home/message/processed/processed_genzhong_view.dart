import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_ui/application/messages/processed/processed_bloc.dart';
import 'package:flutter_ui/presentation/core/fintness_app_theme.dart';

class Genzhong extends StatefulWidget {
  @override
  _GenzhongState createState() => _GenzhongState();
}

class _GenzhongState extends State<Genzhong> {
  bool valueb = false;
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
        return Column(children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text("跟踪办理",
                    style: TextStyle(
                      fontFamily: FitnessAppTheme.fontName,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.5,
                      color: Colors.grey[700],
                    )),
              ),
              Checkbox(
                onChanged: (bool value) {
                  setState(() {
                    valueb = value;
                  });
                  BlocProvider.of<ProcessedBloc>(context)
                    ..add(ProcessedEvent.changefollowState());
                },
                value: this.valueb,
              )
            ],
          ),
        ]);
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
                height: 350.0,
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
