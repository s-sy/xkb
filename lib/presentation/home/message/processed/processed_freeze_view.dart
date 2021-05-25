import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/messages/processed/processed_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FreezeView extends StatefulWidget {
  @override
  _FreezeViewState createState() => _FreezeViewState();
}

class _FreezeViewState extends State<FreezeView> {
  String inputValue = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              "冻结",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 100),
            child: OutlineButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return new AlertDialog(
                        title: Center(child: Text("温馨提示")),
                        content: new SingleChildScrollView(
                          child: new ListBody(
                            children: <Widget>[
                              new Text("您正在冻结客户，写清原因后点确定"),
                              Container(
                                  child: TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.pink))),
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    inputValue = value;
                                  });
                                },
                              ))
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: new Text("取消"),
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                          ),
                          FlatButton(
                            child: new Text("确定"),
                            onPressed: () {
                              // BlocProvider.of<ProcessedBloc>(context)
                              //     .add(ProcessedEvent.pushProcessed());
                              Navigator.of(context).pop(true);
                              // _editParentText();
                            },
                          ),
                        ],
                      );
                    }).then((value) {
                  if (value) {
                    BlocProvider.of<ProcessedBloc>(context)
                        .add(ProcessedEvent.frezzeCoumer(inputValue));

                    Navigator.of(context).pop("refresh");
                  }
                });
              },
              child: Text("冻结"),
            ),
          )
        ],
      ),
    );
  }
}
