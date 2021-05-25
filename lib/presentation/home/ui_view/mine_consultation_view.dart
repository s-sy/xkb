import 'package:flutter/material.dart';
import 'package:flutter_ui/presentation/components/mineTabs.dart';

class MineConsultationView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  const MineConsultationView(
      {Key key, this.animationController, this.animation})
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
                children: <Widget>[
                  SizedBox(height: 10.0),
                  MineTabs(title: '客户咨询', icon: Icons.forum),
                  SizedBox(height: 1.0)
                ],
              )),
        );
      },
    );
  }
}
