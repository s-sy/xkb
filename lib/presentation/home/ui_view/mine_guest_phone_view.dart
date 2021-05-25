import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';

class MineGuestPhoneView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  const MineGuestPhoneView({Key key, this.animationController, this.animation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
              transform: new Matrix4.translationValues(
                  0.0, 30 * (1.0 - animation.value), 0.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    child: Container(
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: Colors.white60,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(width: 15.0),
                            Icon(Icons.settings_phone, color: Colors.grey),
                            SizedBox(width: 15.0),
                            Text('留客电话',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500)),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                "(18)",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        )),
                    onTap: () {
                      ExtendedNavigator.of(context).push(Routes.guestPhone);
                    },
                  )
                ],
              )),
        );
      },
    );
  }
}
