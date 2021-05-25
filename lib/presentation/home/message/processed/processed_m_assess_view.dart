import 'package:flutter/material.dart';

class MassessView extends StatelessWidget {
  String requestData;

  MassessView(this.requestData) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 71,
            child: Text(
              "备注消息:",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 20),
              child: Text(
                requestData,
                style: TextStyle(fontSize: 15, color: Colors.grey[700]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
