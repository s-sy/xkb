import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/house/house_bloc.dart';
import 'package:flutter_ui/presentation/core/fintness_app_theme.dart';

class HouseTitleView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  const HouseTitleView({Key key, this.animationController, this.animation})
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
              child:
                  BlocBuilder<HouseBloc, HouseState>(builder: (context, state) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (state.buildingList.length != 0)
                          Row(
                            children: <Widget>[
                              _getText("图例"),
                              SizedBox(width: 10.0),
                              _getText("待售"),
                              _getColors(Colors.green),
                              SizedBox(width: 10.0),
                              _getText("认购"),
                              _getColors(Colors.lightBlue),
                              SizedBox(width: 10.0),
                              _getText("签约"),
                              _getColors(Colors.red),
                              SizedBox(width: 10.0),
                              _getText("销控"),
                              _getColors(Colors.yellow),
                              SizedBox(width: 10.0),
                              _getText("管理员销控"),
                              _getColors(Colors.orange),
                            ],
                          ),
                        Text(
                          state.buildText +
                              state.houseText +
                              state.entranceText,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: FitnessAppTheme.fontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            letterSpacing: 0.5,
                            color: FitnessAppTheme.lightText,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })

              // InkWell(
              //   highlightColor: Colors.transparent,
              //   borderRadius: BorderRadius.all(Radius.circular(4.0)),
              //   onTap: () {},
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 8),
              //     child: Row(
              //       children: <Widget>[
              //         Text(
              //           subTxt,
              //           textAlign: TextAlign.left,
              //           style: TextStyle(
              //             fontFamily: FitnessAppTheme.fontName,
              //             fontWeight: FontWeight.normal,
              //             fontSize: 16,
              //             letterSpacing: 0.5,
              //             color: FitnessAppTheme.nearlyDarkBlue,
              //           ),
              //         ),
              //         SizedBox(
              //           height: 38,
              //           width: 26,
              //           child: Icon(
              //             Icons.arrow_forward,
              //             color: FitnessAppTheme.darkText,
              //             size: 18,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // )

              ),
        );
      },
    );
  }

  _getText(String value) {
    return Text(
      value,
      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
    );
  }

  _getColors(MaterialColor colors) {
    return Container(
      height: 11,
      width: 11,
      decoration: BoxDecoration(color: colors),
    );
  }
}
