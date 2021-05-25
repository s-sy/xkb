import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/messages/processed/processed_bloc.dart';

class ProcessedBeZhu extends StatefulWidget {
  @override
  _ProcessedBeZhuState createState() => _ProcessedBeZhuState();
}

class _ProcessedBeZhuState extends State<ProcessedBeZhu> {
  FocusNode userFocusNode;
  TextEditingController _editingController;

  @override
  void initState() {
    userFocusNode = FocusNode();
    _editingController = new TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, right: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            child: Text(
              "跟踪记录:",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700]),
            ),
          ),
          Expanded(
              child: GestureDetector(
            onTap: () {},
            child: TextField(
              focusNode: userFocusNode,
              maxLines: 4,
              autofocus: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: _editingController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink))),
              onChanged: (psValue) {
                // print(psValue);
                BlocProvider.of<ProcessedBloc>(context)
                  ..add(ProcessedEvent.savePS(psValue));
              },
              // onEditingComplete: () {
              //   print(_editingController.text);
              // },
              // onSubmitted: (value) {
              //   print(value);
              // }
            ),
          ))
        ],
      ),
    );
  }
}
