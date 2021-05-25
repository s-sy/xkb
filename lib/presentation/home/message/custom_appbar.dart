import 'package:flutter/material.dart';

class CustonAppBar extends StatelessWidget {
  const CustonAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**适配刘海屏顶部安全区域 */
    double paddingTop = MediaQuery.of(context).padding.top;
    return GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.fromLTRB(20, paddingTop + 10, 20, 0),
          padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19), color: Colors.grey[200]),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
              Expanded(
                  child: Text('搜索',
                      style: TextStyle(fontSize: 16, color: Colors.grey)))
            ],
          ),
        ));
  }
}
