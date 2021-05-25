import 'package:flutter/material.dart';

class HouseingBodyItem extends StatelessWidget {
  final String titleName;
  final String content;
  final Widget iconType;
  final AnimationController animationController;
  final Animation animation;

  const HouseingBodyItem({
    Key key,
    this.animationController,
    this.animation,
    this.titleName,
    this.iconType,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: new Transform(
              transform: new Matrix4.translationValues(
                  0.0, 30 * (1.0 - animation.value), 0.0),
              child: Container(
                  padding:
                      EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 20),
                  margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          titleName,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          ":",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            content,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ],
                  )),
            ),
          );
        });
  }
}
