import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/presentation/home/customer/new_follow_up_page.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';

class BottomButton extends StatefulWidget {
  BottomButton({Key key}) : super(key: key);

  @override
  _BottomButtonState createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        children: <Widget>[
          InkWell(
            child: Container(
              width: 110.0,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.edit, color: Colors.grey, size: 17.0),
                  Text(
                    '完善资料',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            onTap: () {
              ExtendedNavigator.of(context).push(Routes.perfectInformation);
            },
          ),
          Expanded(
              child: GestureDetector(
            onTap: () {
              ExtendedNavigator.of(context).push(Routes.newFollowUp);
              // Navigator.push(
              //   context,
              //   new MaterialPageRoute(builder: (context) => new NewFollowUp()),
              // );
            },
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(color: Colors.blue[300]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.control_point, color: Colors.white, size: 25.0),
                  SizedBox(width: 3.0),
                  Text('新增跟进',
                      style: TextStyle(color: Colors.white, fontSize: 15.0))
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
