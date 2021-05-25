import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/messages/processed/processed_bloc.dart';
import 'package:flutter_ui/presentation/core/fintness_app_theme.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_assess_view.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_beizhu_view.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_choose_house_view.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_choose_view.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_genzhong_view.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_m_assess_view.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_next_remind_view_.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_photoselect_view.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_photoshow_view.dart';
import 'package:flutter_ui/presentation/home/message/processed/processed_show_house_view.dart';

class ProcessedsView extends StatefulWidget {
  @override
  _ProcessedsViewState createState() => _ProcessedsViewState();
}

class _ProcessedsViewState extends State<ProcessedsView> {
  var pf = ['A', 'B', 'C', 'D'];
  String showStringDate = "";
  String _textFeid = "";
  // List<Widget> getListWidgets() {
  //   List<Widget> list = [];

  //   for (int i = 0; i < 4; i++) {
  //     list.add(Container(
  //       child: Text(pf[i]),
  //     ));
  //   }
  //   return list;
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProcessedBloc, ProcessedState>(
        builder: (context, state) {
      switch (state.userRole) {
        case "secretary":
          return Container(
            padding: EdgeInsets.only(right: 20, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          '当前流程:',
                          style: TextStyle(
                            fontFamily: FitnessAppTheme.fontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: 0.5,
                            color: FitnessAppTheme.lightText,
                            // fontSize: 16, fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          getPressedName(
                              state.processedItem['taskDefinitionKey']),
                          style: TextStyle(
                            // fontSize: 16
                            fontFamily: FitnessAppTheme.fontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            letterSpacing: 0.5,
                            color: FitnessAppTheme.lightText,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                /**
                 * 
                */
                ChooseView(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Text("通过"),
                //     Radio(
                //         value: 0,
                //         groupValue: state.groupValue,
                //         onChanged: (value) {
                //           BlocProvider.of<ProcessedBloc>(context)
                //               .add(ProcessedEvent.changeRadio(value));
                //         }),
                //     SizedBox(
                //       width: 50,
                //     ),
                //     Text("不通过"),
                //     Radio(
                //         value: 1,
                //         groupValue: state.groupValue,
                //         onChanged: (value) {
                //           BlocProvider.of<ProcessedBloc>(context)
                //             ..add(ProcessedEvent.changeRadio(value));
                //         }),
                //   ],
                // ),
              ],
            ),
          );
          break;
        case "salesman":
          if (state.processedItem["taskDefinitionKey"] == "CategoryManagent" ||
              state.processedItem["taskDefinitionKey"] == "Activity_0vv7s63" ||
              state.processedItem["taskDefinitionKey"] == "Activity_0qvod3g" ||
              state.processedItem["taskDefinitionKey"] == "Activity_1h77h4t" ||
              state.processedItem["taskDefinitionKey"] == "Activity_0qk9snp" ||
              state.processedItem["taskDefinitionKey"] == "Activity_0639vrl" ||
              state.processedItem["taskDefinitionKey"] == "Activity_00h6h12")
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            '当前流程:',
                            style: TextStyle(
                              fontFamily: FitnessAppTheme.fontName,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              letterSpacing: 0.5,
                              color: Colors.grey[700],
                              // fontSize: 16, fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            getPressedName(
                                state.processedItem['taskDefinitionKey']),
                            style: TextStyle(
                              // fontSize: 16
                              fontFamily: FitnessAppTheme.fontName,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              letterSpacing: 0.5,
                              color: FitnessAppTheme.lightText,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  if (state.processedData.length != 0 &&
                      (state.processedData.containsKey("recognition") &&
                          state.processedData["recognition"]["value"] ==
                              false) &&
                      (state.processedItem["taskDefinitionKey"] ==
                              "Activity_0vv7s63" ||
                          state.processedItem["taskDefinitionKey"] ==
                              "Activity_0qvod3g" ||
                          state.processedItem["taskDefinitionKey"] ==
                              "Activity_0qk9snp" ||
                          state.processedItem["taskDefinitionKey"] ==
                              "Activity_00h6h12"))
                    MessageHous(),
                  // SizedBox(height: 10),
                  if (state.processedData.length != 0 &&
                      state.processedItem["taskDefinitionKey"] ==
                          "Activity_0qk9snp" &&
                      state.processedData
                          .containsKey("Activity_0x97rbo_managerDeration") &&
                      state.processedData["Activity_0x97rbo_managerDeration"]
                              ["value"] !=
                          "")
                    MassessView(//这个经理拒绝的理由
                        state.processedData["Activity_0x97rbo_managerDeration"]
                            ["value"]),
                  if (state.processedData.length != 0 &&
                      state.processedItem["taskDefinitionKey"] ==
                          "Activity_0vv7s63" &&
                      state.processedData
                          .containsKey("Activity_1atwvxw_managerDeration") &&
                      state.processedData["Activity_1atwvxw_managerDeration"]
                              ["value"] !=
                          "")
                    MassessView(//这个经理拒绝的理由
                        state.processedData["Activity_1atwvxw_managerDeration"]
                            ["value"]),
                  if (state.processedData.length != 0 &&
                      state.processedItem["taskDefinitionKey"] ==
                          "Activity_00h6h12" &&
                      state.processedData
                          .containsKey("Activity_1f9gn7v_managerDeration") &&
                      state.processedData["Activity_1f9gn7v_managerDeration"]
                              ["value"] !=
                          "")
                    MassessView(//这个经理拒绝的理由
                        state.processedData["Activity_1f9gn7v_managerDeration"]
                            ["value"]),
                  if (state.processedData.length != 0 &&
                      state.processedItem["taskDefinitionKey"] ==
                          "Activity_0qvod3g" &&
                      state.processedData
                          .containsKey("Activity_1vkay0h_managerDeration") &&
                      state.processedData["Activity_1vkay0h_managerDeration"]
                              ["value"] !=
                          "")
                    MassessView(
                        state.processedData["Activity_1vkay0h_managerDeration"]
                            ["value"]),
                  if (!state.isUseDate) Genzhong(),
                  if (!state.followState) NextRemindView(),
                  if (state.processedItem["taskDefinitionKey"] !=
                      "Activity_0qvod3g")
                    AssessView(),
                  if (state.processedData.length != 0 &&
                      state.processedItem["taskDefinitionKey"] ==
                          "Activity_0vv7s63" &&
                      state.processedData
                          .containsKey("CategoryManagent_requestData") &&
                      state.processedData["CategoryManagent_requestData"]
                              ["value"] !=
                          "")
                    MassessView(
                        state.processedData["CategoryManagent_requestData"]
                            ["value"]),
                  if (state.processedData.length != 0 &&
                      state.processedItem["taskDefinitionKey"] ==
                          "Activity_0vv7s63" &&
                      state.processedData
                          .containsKey("CategoryManagent_imgData") &&
                      state.processedData["CategoryManagent_imgData"]
                              ["value"] !=
                          0)
                    ProcessedPhotoShowView(
                        lfPaddingSpace: 110,
                        imgData: state.processedData["CategoryManagent_imgData"]
                            ["value"]),

                  if (state.processedData.length != 0 &&
                      state.processedItem["taskDefinitionKey"] ==
                          "Activity_0qk9snp" &&
                      state.processedData
                          .containsKey("Activity_1h77h4t_requestData") &&
                      state.processedData["Activity_1h77h4t_requestData"]
                              ["value"] !=
                          "")
                    MassessView(
                        state.processedData["Activity_1h77h4t_requestData"]
                            ["value"]),
                  if (state.processedData.length != 0 &&
                      state.processedItem["taskDefinitionKey"] ==
                          "Activity_0qk9snp" &&
                      state.processedData
                          .containsKey("Activity_1h77h4t_imgData") &&
                      state.processedData["Activity_1h77h4t_imgData"]
                              ["value"] !=
                          0)
                    ProcessedPhotoShowView(
                        lfPaddingSpace: 110,
                        imgData: state.processedData["Activity_1h77h4t_imgData"]
                            ["value"]),
                  if (state.processedData.length != 0 &&
                      state.processedItem["taskDefinitionKey"] ==
                          "Activity_00h6h12" &&
                      state.processedData
                          .containsKey("Activity_0639vrl_requestData") &&
                      state.processedData["Activity_0639vrl_requestData"]
                              ["value"] !=
                          "")
                    MassessView(
                        state.processedData["Activity_0639vrl_requestData"]
                            ["value"]),
                  if (state.processedData.length != 0 &&
                      state.processedItem["taskDefinitionKey"] ==
                          "Activity_00h6h12" &&
                      state.processedData
                          .containsKey("Activity_0639vrl_imgData") &&
                      state.processedData["Activity_0639vrl_imgData"]
                              ["value"] !=
                          0)
                    ProcessedPhotoShowView(
                        lfPaddingSpace: 110,
                        imgData: state.processedData["Activity_0639vrl_imgData"]
                            ["value"]),
                  // if (state
                  //             .processedItem["taskDefinitionKey"] !=
                  //         "Activity_0qvod3g" &&
                  //     state.processedItem["taskDefinitionKey"] !=
                  //         "Activity_1h77h4t" &&
                  //     state.processedItem["taskDefinitionKey"] !=
                  //         "Activity_0qk9snp"
                  // // ( state.processedData
                  // //     .containsKey(""))
                  // )
                  //   FreezeView(),

                  if (state
                              .processedItem["taskDefinitionKey"] ==
                          "Activity_0vv7s63" ||
                      state
                              .processedItem["taskDefinitionKey"] ==
                          "Activity_0qk9snp" ||
                      state
                              .processedItem["taskDefinitionKey"] ==
                          "CategoryManagent" ||
                      state
                              .processedItem["taskDefinitionKey"] ==
                          "Activity_0qvod3g" ||
                      state
                              .processedItem["taskDefinitionKey"] ==
                          "Activity_1h77h4t" ||
                      state.processedItem["taskDefinitionKey"] ==
                          "Activity_0639vrl" ||
                      state.processedItem["taskDefinitionKey"] ==
                          "Activity_00h6h12")
                    ProcessedBeZhu(),
                  if (state
                              .processedItem["taskDefinitionKey"] ==
                          "Activity_0vv7s63" ||
                      state
                              .processedItem["taskDefinitionKey"] ==
                          "Activity_0qk9snp" ||
                      state
                              .processedItem["taskDefinitionKey"] ==
                          "CategoryManagent" ||
                      state
                              .processedItem["taskDefinitionKey"] ==
                          "Activity_0qvod3g" ||
                      state
                              .processedItem["taskDefinitionKey"] ==
                          "Activity_1h77h4t" ||
                      state.processedItem["taskDefinitionKey"] ==
                          "Activity_0639vrl" ||
                      state.processedItem["taskDefinitionKey"] ==
                          "Activity_00h6h12")
                    Container(
                      // decoration: BoxDecoration(color: Colors.red[100]),
                      padding: EdgeInsets.fromLTRB(0, 10, 30, 0),
                      child: JhPhotoPicker(
                          lfPaddingSpace: 20, callBack: (var img) {}),
                    ),
                ],
              ),
            );

          if (state.processedItem["taskDefinitionKey"] == "Activity_0fcrae3" ||
              state.processedItem["taskDefinitionKey"] == "Activity_10po9sk" ||
              state.processedItem["taskDefinitionKey"] == "Activity_1olkns4" ||
              state.processedItem["taskDefinitionKey"] == "Activity_1otznpp" ||
              state.processedItem["taskDefinitionKey"] == "Activity_0yyexii" ||
              state.processedItem["taskDefinitionKey"] == "Activity_00n2pwo" ||
              state.processedItem["taskDefinitionKey"] == "Activity_1cbo1ao" ||
              state.processedItem["taskDefinitionKey"] == "Activity_0cy1bz9" ||
              state.processedItem["taskDefinitionKey"] == "Activity_0ndvcvv" ||
              state.processedItem["taskDefinitionKey"] == "Activity_1xgd1ne" ||
              state.processedItem["taskDefinitionKey"] == "Activity_1v8yzn1" ||
              state.processedItem["taskDefinitionKey"] == "Activity_0ki46oj")
            // state.processedItem["taskDefinitionKey"] == "Activity_10po9sk")
            return Container(
                padding: EdgeInsets.only(left: 0, right: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              '当前流程:',
                              style: TextStyle(
                                fontFamily: FitnessAppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                letterSpacing: 0.5,
                                color: Colors.grey[700],
                                // fontSize: 16, fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              getPressedName(
                                  state.processedItem['taskDefinitionKey']),
                              style: TextStyle(
                                // fontSize: 16
                                fontFamily: FitnessAppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                letterSpacing: 0.5,
                                color: FitnessAppTheme.lightText,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    if ((state.processedItem["taskDefinitionKey"] ==
                                "Activity_0fcrae3" ||
                            state.processedItem["taskDefinitionKey"] ==
                                "Activity_0ki46oj" ||
                            state.processedItem["taskDefinitionKey"] ==
                                "Activity_0cy1bz9" ||
                            state.processedItem["taskDefinitionKey"] ==
                                "Activity_1v8yzn1") &&
                        state.processedData.length != 0 &&
                        (state.processedData.containsKey("recognition") &&
                            state.processedData["recognition"]["value"] ==
                                true))
                      MessageHous(),
                    if (state.processedItem["taskDefinitionKey"] ==
                            "Activity_0ki46oj" &&
                        state.processedData
                            .containsKey("Activity_1gaipmg_managerDeration") &&
                        state.processedData["Activity_1gaipmg_managerDeration"]
                                ["value"] !=
                            "")
                      MassessView(state
                              .processedData["Activity_1gaipmg_managerDeration"]
                          ["value"]),
                    if (state.processedItem["taskDefinitionKey"] ==
                            "Activity_00n2pwo" &&
                        state.processedData
                            .containsKey("Activity_0kdzv8w_managerDeration") &&
                        state.processedData["Activity_0kdzv8w_managerDeration"]
                                ["value"] !=
                            "")
                      MassessView(state
                              .processedData["Activity_0kdzv8w_managerDeration"]
                          ["value"]),
                    if (state.processedItem["taskDefinitionKey"] ==
                            "Activity_0cy1bz9" &&
                        state.processedData
                            .containsKey("Activity_0zeqsng_managerDeration") &&
                        state.processedData["Activity_0zeqsng_managerDeration"]
                                ["value"] !=
                            "")
                      MassessView(state
                              .processedData["Activity_0zeqsng_managerDeration"]
                          ["value"]),

                    if (state.processedItem["taskDefinitionKey"] ==
                            "Activity_10po9sk" &&
                        state.processedData
                            .containsKey("Activity_0ar3k0c_managerDeration") &&
                        state.processedData["Activity_0ar3k0c_managerDeration"]
                                ["value"] !=
                            "")
                      MassessView(state
                              .processedData["Activity_0ar3k0c_managerDeration"]
                          ["value"]),
                    if (state.processedItem["taskDefinitionKey"] == //平台签合同
                            "Activity_0ndvcvv" &&
                        state.processedData
                            .containsKey("Activity_1o336vo_managerDeration") &&
                        state.processedData["Activity_1o336vo_managerDeration"]
                                ["value"] !=
                            "")
                      MassessView(state
                              .processedData["Activity_1o336vo_managerDeration"]
                          ["value"]),
                    if (state.processedItem[
                                "taskDefinitionKey"] == //隐号流程的合同签订合同
                            "Activity_1otznpp" &&
                        state.processedData
                            .containsKey("Activity_0lnm3vn_managerDeration") &&
                        state.processedData["Activity_0lnm3vn_managerDeration"]
                                ["value"] !=
                            "")
                      MassessView(state
                              .processedData["Activity_0lnm3vn_managerDeration"]
                          ["value"]),
                    if (state.processedItem["taskDefinitionKey"] ==
                            "Activity_1olkns4" &&
                        state.processedData
                            .containsKey("Activity_0sjwc2q_managerDeration") &&
                        state.processedData["Activity_0sjwc2q_managerDeration"]
                                ["value"] !=
                            "")
                      MassessView(state
                              .processedData["Activity_0sjwc2q_managerDeration"]
                          ["value"]),
                    if (state.processedItem["taskDefinitionKey"] ==
                            "Activity_0fcrae3" &&
                        state.processedData
                            .containsKey("Activity_1p4qp4l_managerDeration") &&
                        state.processedData["Activity_1p4qp4l_managerDeration"]
                                ["value"] !=
                            "")
                      MassessView(state
                              .processedData["Activity_1p4qp4l_managerDeration"]
                          ["value"]),
                    if (state.processedItem["taskDefinitionKey"] ==
                            "Activity_1xgd1ne" &&
                        state.processedData
                            .containsKey("Activity_19m52i0_managerDeration") &&
                        state.processedData["Activity_19m52i0_managerDeration"]
                                ["value"] !=
                            "")
                      MassessView(state
                              .processedData["Activity_19m52i0_managerDeration"]
                          ["value"]),
                    // if (state.processedItem["taskDefinitionKey"] ==
                    //         "Activity_00n2pwo" &&
                    //     state.processedData
                    //         .containsKey("Activity_0kdzv8w_managerDeration") &&
                    //     state.processedData["Activity_0kdzv8w_managerDeration"]
                    //             ["value"] !=
                    //         "")
                    //   MassessView(state
                    //           .processedData["Activity_0kdzv8w_managerDeration"]
                    //       ["value"]),
                    if (state.processedItem["taskDefinitionKey"] == //隐号银行
                            "Activity_0yyexii" &&
                        state.processedData
                            .containsKey("Activity_0tkddk1_managerDeration") &&
                        state.processedData["Activity_0tkddk1_managerDeration"]
                                ["value"] !=
                            "")
                      MassessView(state
                              .processedData["Activity_0tkddk1_managerDeration"]
                          ["value"]),

                    if (state
                                .processedItem["taskDefinitionKey"] ==
                            "Activity_0fcrae3" ||
                        state
                                .processedItem["taskDefinitionKey"] ==
                            "Activity_00n2pwo" ||
                        state
                                .processedItem["taskDefinitionKey"] ==
                            "Activity_0cy1bz9" ||
                        state.processedItem["taskDefinitionKey"] ==
                            "Activity_1xgd1ne" ||
                        state.processedItem["taskDefinitionKey"] ==
                            "Activity_0ki46oj")
                      ProcessedBeZhu(),
                    if (state
                                .processedItem["taskDefinitionKey"] ==
                            "Activity_0fcrae3" ||
                        state
                                .processedItem["taskDefinitionKey"] ==
                            "Activity_00n2pwo" ||
                        state
                                .processedItem["taskDefinitionKey"] ==
                            "Activity_0cy1bz9" ||
                        state.processedItem["taskDefinitionKey"] ==
                            "Activity_1xgd1ne" ||
                        state.processedItem["taskDefinitionKey"] ==
                            "Activity_0ki46oj")
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 30, 0),
                        child: JhPhotoPicker(
                            lfPaddingSpace: 20, callBack: (var img) {}),
                      ),

                    if (state.processedItem["taskDefinitionKey"] ==
                            "Activity_1v8yzn1" &&
                        state.processedData
                            .containsKey("Activity_0k719dd_managerDeration") &&
                        state.processedData["Activity_0k719dd_managerDeration"]
                                ["value"] !=
                            "")
                      MassessView(state
                              .processedData["Activity_0k719dd_managerDeration"]
                          ["value"]),
                    if (state
                                .processedItem["taskDefinitionKey"] ==
                            "Activity_10po9sk" ||
                        state
                                .processedItem["taskDefinitionKey"] ==
                            "Activity_1otznpp" ||
                        state.processedItem["taskDefinitionKey"] ==
                            "Activity_1cbo1ao" ||
                        state.processedItem["taskDefinitionKey"] ==
                            "Activity_0ndvcvv")
                      ProcessedBeZhu(),
                    if (state
                                .processedItem["taskDefinitionKey"] ==
                            "Activity_10po9sk" ||
                        state
                                .processedItem["taskDefinitionKey"] ==
                            "Activity_1otznpp" ||
                        state.processedItem["taskDefinitionKey"] ==
                            "Activity_1cbo1ao" ||
                        state.processedItem["taskDefinitionKey"] ==
                            "Activity_0ndvcvv")
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 30, 0),
                        child: JhPhotoPicker(
                            lfPaddingSpace: 20, callBack: (var img) {}),
                      ),

                    if (state.processedItem["taskDefinitionKey"] ==
                            "Activity_1olkns4" ||
                        state.processedItem["taskDefinitionKey"] ==
                            "Activity_1v8yzn1")
                      ProcessedBeZhu(),
                    if (state.processedItem["taskDefinitionKey"] ==
                            "Activity_1olkns4" ||
                        state.processedItem["taskDefinitionKey"] ==
                            "Activity_1v8yzn1")
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 30, 0),
                        child: JhPhotoPicker(
                            lfPaddingSpace: 20, callBack: (var img) {}),
                      ),
                    if (state.processedItem["taskDefinitionKey"] == //隐号银行
                        "Activity_0yyexii")
                      ProcessedBeZhu(),
                    if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_0yyexii")
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 30, 0),
                        child: JhPhotoPicker(
                            lfPaddingSpace: 20, callBack: (var img) {}),
                      ),

                    // Row(
                    //   children: [
                    //     Container(child: Text("备注：")),
                    //     Expanded(
                    //         child: TextField(
                    //       maxLines: 4,
                    //       decoration: InputDecoration(
                    //           border: OutlineInputBorder(
                    //               borderSide: BorderSide(color: Colors.pink))),
                    //       onChanged: (zDValue) {
                    //         print(zDValue);
                    //         BlocProvider.of<ProcessedBloc>(context)
                    //           ..add(ProcessedEvent.saveZDValue(zDValue));
                    //       },
                    //     )),
                    //   ],
                    // ),
                  ],
                ));
          return Container(
            child: SizedBox(
              height: 10,
            ),
          );
          break;
        case "manager":
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          '当前流程:',
                          style: TextStyle(
                            // fontSize: 16, fontWeight: FontWeight.w500
                            fontFamily: FitnessAppTheme.fontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: 0.5,
                            color: FitnessAppTheme.lightText,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          getPressedName(
                              state.processedItem['taskDefinitionKey']),
                          style: TextStyle(
                            // fontSize: 16
                            fontFamily: FitnessAppTheme.fontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            letterSpacing: 0.5,
                            color: FitnessAppTheme.lightText,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (state.processedItem["taskDefinitionKey"] ==
                        "ManagerAssigns" ||
                    state.processedItem["taskDefinitionKey"] ==
                        "Activity_1u7ja7r" ||
                    state.processedItem["taskDefinitionKey"] ==
                        "Activity_0lpau4d")
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text("经理分配"),
                      ),
                      Container(
                          width: 150,
                          child: DropdownButton<String>(
                            hint: Text('请选择'),
                            value: state.manageAssignmentUser,
                            items: state.salesmanList
                                .map<DropdownMenuItem<String>>((item) {
                              return DropdownMenuItem(
                                  child: Text(item), value: item);
                            }).toList(),
                            onChanged: (itemValue) {
                              BlocProvider.of<ProcessedBloc>(context).add(
                                  ProcessedEvent.saveManageAssignmentUser(
                                      itemValue));
                            },
                          )),
                    ],
                  ),
                // if ((state.processedItem["taskDefinitionKey"] ==
                //             "Activity_1p4qp4l" ||
                //         state.processedItem["taskDefinitionKey"] ==
                //             "Activity_0ar3k0c" ||
                //         state.processedItem["taskDefinitionKey"] ==
                //             "Activity_0sjwc2q") &&
                //     state.processedData.containsKey("requestData"))
                //   Container(
                //     child: Row(
                //       children: [
                //         Container(
                //           child: Text("备注："),
                //         ),
                //         Container(
                //           child:
                //               Text(state.processedData["requestData"]["value"]),
                //         ),
                //       ],
                //     ),
                //   ),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_0k719dd" &&
                    state.processedData
                        .containsKey("Activity_1v8yzn1_requestData") &&
                    state.processedData["Activity_1v8yzn1_requestData"]
                            ["value"] !=
                        "")
                  MassessView(state
                      .processedData["Activity_1v8yzn1_requestData"]["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_0k719dd" &&
                    state.processedData
                        .containsKey("Activity_1v8yzn1_imgData") &&
                    state.processedData["Activity_1v8yzn1_imgData"]["value"]
                            .length !=
                        0)
                  ProcessedPhotoShowView(
                      lfPaddingSpace: 110,
                      imgData: state.processedData["Activity_1v8yzn1_imgData"]
                          ["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_1f9gn7v" &&
                    state.processedData
                        .containsKey("Activity_00h6h12_requestData") &&
                    state.processedData["Activity_00h6h12_requestData"]
                            ["value"] !=
                        "")
                  MassessView(state
                      .processedData["Activity_00h6h12_requestData"]["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_1f9gn7v" &&
                    state.processedData
                        .containsKey("Activity_00h6h12_imgData") &&
                    state.processedData["Activity_00h6h12_imgData"]["value"]
                            .length !=
                        0)
                  ProcessedPhotoShowView(
                      lfPaddingSpace: 110,
                      imgData: state.processedData["Activity_00h6h12_imgData"]
                          ["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_19m52i0" &&
                    state.processedData
                        .containsKey("Activity_1xgd1ne_requestData") &&
                    state.processedData["Activity_1xgd1ne_requestData"]
                            ["value"] !=
                        "")
                  MassessView(state
                      .processedData["Activity_1xgd1ne_requestData"]["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_19m52i0" &&
                    state.processedData
                        .containsKey("Activity_1xgd1ne_imgData") &&
                    state.processedData["Activity_1xgd1ne_imgData"]["value"]
                            .length !=
                        0)
                  ProcessedPhotoShowView(
                      lfPaddingSpace: 110,
                      imgData: state.processedData["Activity_1xgd1ne_imgData"]
                          ["value"]),

                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_1vkay0h" &&
                    state.processedData
                        .containsKey("Activity_0qvod3g_requestData") &&
                    state.processedData["Activity_0qvod3g_requestData"]
                            ["value"] !=
                        "")
                  MassessView(state
                      .processedData["Activity_0qvod3g_requestData"]["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_1vkay0h" &&
                    state.processedData
                        .containsKey("Activity_0qvod3g_imgData") &&
                    state.processedData["Activity_0qvod3g_imgData"]["value"]
                            .length !=
                        0)
                  ProcessedPhotoShowView(
                      lfPaddingSpace: 110,
                      imgData: state.processedData["Activity_0qvod3g_imgData"]
                          ["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_1atwvxw" &&
                    state.processedData
                        .containsKey("Activity_0vv7s63_requestData") &&
                    state.processedData["Activity_0vv7s63_requestData"]
                            ["value"] !=
                        "")
                  MassessView(state
                      .processedData["Activity_0vv7s63_requestData"]["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_1atwvxw" &&
                    state.processedData
                        .containsKey("Activity_0vv7s63_imgData") &&
                    state.processedData["Activity_0vv7s63_imgData"]["value"]
                            .length !=
                        0)
                  ProcessedPhotoShowView(
                      lfPaddingSpace: 110,
                      imgData: state.processedData["Activity_0vv7s63_imgData"]
                          ["value"]),

                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_0zeqsng" &&
                    state.processedData
                        .containsKey("Activity_0cy1bz9_requestData") &&
                    state.processedData["Activity_0cy1bz9_requestData"]
                            ["value"] !=
                        "")
                  MassessView(state
                      .processedData["Activity_0cy1bz9_requestData"]["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_0zeqsng" &&
                    state.processedData
                        .containsKey("Activity_0cy1bz9_imgData") &&
                    state.processedData["Activity_0cy1bz9_imgData"]["value"]
                            .length !=
                        0)
                  ProcessedPhotoShowView(
                      lfPaddingSpace: 110,
                      imgData: state.processedData["Activity_0cy1bz9_imgData"]
                          ["value"]),

                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_1p4qp4l" &&
                    state.processedData
                        .containsKey("Activity_0fcrae3_requestData") &&
                    state.processedData["Activity_0fcrae3_requestData"]
                            ["value"] !=
                        "")
                  MassessView(state
                      .processedData["Activity_0fcrae3_requestData"]["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_1p4qp4l" &&
                    state.processedData
                        .containsKey("Activity_0fcrae3_imgData") &&
                    state.processedData["Activity_0fcrae3_imgData"]["value"]
                            .length !=
                        0)
                  ProcessedPhotoShowView(
                      lfPaddingSpace: 110,
                      imgData: state.processedData["Activity_0fcrae3_imgData"]
                          ["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_0ar3k0c" &&
                    state.processedData
                        .containsKey("Activity_10po9sk_requestData") &&
                    state.processedData["Activity_10po9sk_requestData"]
                            ["value"] !=
                        "")
                  MassessView(state
                      .processedData["Activity_10po9sk_requestData"]["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_0ar3k0c" &&
                    state.processedData
                        .containsKey("Activity_10po9sk_imgData") &&
                    state.processedData["Activity_10po9sk_imgData"]["value"]
                            .length !=
                        0)
                  ProcessedPhotoShowView(
                      lfPaddingSpace: 110,
                      imgData: state.processedData["Activity_10po9sk_imgData"]
                          ["value"]),

                if (state.processedItem["taskDefinitionKey"] == //隐号合同审核显示
                        "Activity_0lnm3vn" &&
                    state.processedData
                        .containsKey("Activity_1otznpp_requestData") &&
                    state.processedData["Activity_1otznpp_requestData"]
                            ["value"] !=
                        "")
                  MassessView(state
                      .processedData["Activity_1otznpp_requestData"]["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_0lnm3vn" &&
                    state.processedData
                        .containsKey("Activity_1otznpp_imgData") &&
                    state.processedData["Activity_1otznpp_imgData"]["value"]
                            .length !=
                        0)
                  ProcessedPhotoShowView(
                      lfPaddingSpace: 110,
                      imgData: state.processedData["Activity_1otznpp_imgData"]
                          ["value"]),

                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_1o336vo" &&
                    state.processedData
                        .containsKey("Activity_0ndvcvv_requestData") &&
                    state.processedData["Activity_0ndvcvv_requestData"]
                            ["value"] !=
                        "")
                  MassessView(state
                      .processedData["Activity_0ndvcvv_requestData"]["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_1o336vo" &&
                    state.processedData
                        .containsKey("Activity_0ndvcvv_imgData") &&
                    state.processedData["Activity_0ndvcvv_imgData"]["value"]
                            .length !=
                        0)
                  ProcessedPhotoShowView(
                      lfPaddingSpace: 110,
                      imgData: state.processedData["Activity_0ndvcvv_imgData"]
                          ["value"]),

                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_0sjwc2q" &&
                    state.processedData
                        .containsKey("Activity_1olkns4_requestData") &&
                    state.processedData["Activity_1olkns4_requestData"]
                            ["value"] !=
                        "")
                  MassessView(state
                      .processedData["Activity_1olkns4_requestData"]["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_0sjwc2q" &&
                    state.processedData
                        .containsKey("Activity_1olkns4_imgData") &&
                    state.processedData["Activity_1olkns4_imgData"]["value"]
                            .length !=
                        0)
                  ProcessedPhotoShowView(
                      lfPaddingSpace: 110,
                      imgData: state.processedData["Activity_1olkns4_imgData"]
                          ["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_0x97rbo" &&
                    state.processedData
                        .containsKey("Activity_0qk9snp_requestData") &&
                    state.processedData["Activity_0qk9snp_requestData"]
                            ["value"] !=
                        "")
                  MassessView(state
                      .processedData["Activity_0qk9snp_requestData"]["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_0x97rbo" &&
                    state.processedData
                        .containsKey("Activity_0qk9snp_imgData") &&
                    state.processedData["Activity_0qk9snp_imgData"]["value"]
                            .length !=
                        0)
                  ProcessedPhotoShowView(
                      lfPaddingSpace: 110,
                      imgData: state.processedData["Activity_0qk9snp_imgData"]
                          ["value"]),

                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_0tkddk1" &&
                    state.processedData
                        .containsKey("Activity_0yyexii_requestData") &&
                    state.processedData["Activity_0yyexii_requestData"]
                            ["value"] !=
                        "")
                  MassessView(state
                      .processedData["Activity_0yyexii_requestData"]["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_0tkddk1" &&
                    state.processedData
                        .containsKey("Activity_0yyexii_imgData") &&
                    state.processedData["Activity_0yyexii_imgData"]["value"]
                            .length !=
                        0)
                  ProcessedPhotoShowView(
                      lfPaddingSpace: 110,
                      imgData: state.processedData["Activity_0yyexii_imgData"]
                          ["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_0kdzv8w" &&
                    state.processedData
                        .containsKey("Activity_00n2pwo_requestData") &&
                    state.processedData["Activity_00n2pwo_requestData"]
                            ["value"] !=
                        "")
                  MassessView(state
                      .processedData["Activity_00n2pwo_requestData"]["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_0kdzv8w" &&
                    state.processedData
                        .containsKey("Activity_00n2pwo_imgData") &&
                    state.processedData["Activity_00n2pwo_imgData"]["value"]
                            .length !=
                        0)
                  ProcessedPhotoShowView(
                      lfPaddingSpace: 110,
                      imgData: state.processedData["Activity_00n2pwo_imgData"]
                          ["value"]),
                if (state.processedItem["taskDefinitionKey"] == "FreezeAudit" &&
                    state.processedData
                        .containsKey("FreezeAudit_requestData") &&
                    state.processedData["FreezeAudit_requestData"]["value"] !=
                        "")
                  MassessView(
                      state.processedData["FreezeAudit_requestData"]["value"]),
                if ((state.processedData.containsKey("recognition") &&
                        state.processedData["recognition"]["value"] == false &&
                        (state.processedItem["taskDefinitionKey"] ==
                                "Activity_1atwvxw" ||
                            state.processedItem["taskDefinitionKey"] ==
                                "Activity_1vkay0h" ||
                            state.processedItem["taskDefinitionKey"] ==
                                "Activity_0x97rbo" ||
                            state.processedItem["taskDefinitionKey"] ==
                                "Activity_1f9gn7v")) ||
                    (state.processedData.containsKey("recognition") &&
                        state.processedData["recognition"]["value"] == true &&
                        (state.processedItem["taskDefinitionKey"] ==
                                "Activity_1p4qp4l" ||
                            state.processedItem["taskDefinitionKey"] ==
                                "Activity_1gaipmg" ||
                            state.processedItem["taskDefinitionKey"] ==
                                "Activity_0zeqsng" ||
                            state.processedItem["taskDefinitionKey"] ==
                                "Activity_0k719dd")))
                  ShowHouseView(), //控房列表展示
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_1gaipmg" &&
                    state.processedData
                        .containsKey("Activity_0ki46oj_requestData") &&
                    state.processedData["Activity_0ki46oj_requestData"]
                            ["value"] !=
                        "")
                  MassessView(state
                      .processedData["Activity_0ki46oj_requestData"]["value"]),
                if (state.processedItem["taskDefinitionKey"] ==
                        "Activity_1gaipmg" &&
                    state.processedData
                        .containsKey("Activity_0ki46oj_imgData") &&
                    state.processedData["Activity_0ki46oj_imgData"]["value"]
                            .length !=
                        0)
                  ProcessedPhotoShowView(
                      lfPaddingSpace: 110,
                      imgData: state.processedData["Activity_0ki46oj_imgData"]
                          ["value"]),
                if (state
                            .processedItem["taskDefinitionKey"] ==
                        "Activity_1atwvxw" ||
                    state
                            .processedItem["taskDefinitionKey"] ==
                        "Activity_1p4qp4l" ||
                    state
                            .processedItem["taskDefinitionKey"] ==
                        "Activity_0ar3k0c" ||
                    state
                            .processedItem["taskDefinitionKey"] ==
                        "Activity_0sjwc2q" ||
                    state.processedItem["taskDefinitionKey"] == "FreezeAudit" ||
                    state
                            .processedItem["taskDefinitionKey"] ==
                        "Activity_1vkay0h" ||
                    state
                            .processedItem["taskDefinitionKey"] ==
                        "Activity_0lnm3vn" ||
                    state
                            .processedItem["taskDefinitionKey"] ==
                        "Activity_0tkddk1" ||
                    state
                            .processedItem["taskDefinitionKey"] ==
                        "Activity_0fvuxs2" ||
                    state
                            .processedItem["taskDefinitionKey"] ==
                        "Activity_0x97rbo" ||
                    state
                            .processedItem["taskDefinitionKey"] ==
                        "Activity_0kdzv8w" ||
                    state
                            .processedItem["taskDefinitionKey"] ==
                        "Activity_0zeqsng" ||
                    state
                            .processedItem["taskDefinitionKey"] ==
                        "Activity_1f9gn7v" ||
                    state
                            .processedItem["taskDefinitionKey"] ==
                        "Activity_1o336vo" ||
                    state
                            .processedItem["taskDefinitionKey"] ==
                        "Activity_19m52i0" ||
                    state.processedItem["taskDefinitionKey"] ==
                        "Activity_0k719dd" ||
                    state.processedItem["taskDefinitionKey"] ==
                        "Activity_1gaipmg")
                  Column(
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     Text("通过"),
                      //     Radio(
                      //         value: 0,
                      //         groupValue: state.groupValue,
                      //         onChanged: (value) {
                      //           BlocProvider.of<ProcessedBloc>(context)
                      //               .add(ProcessedEvent.changeRadio(value));
                      //         }),
                      //     SizedBox(
                      //       width: 50,
                      //     ),
                      //     Text("不通过"),
                      //     Radio(
                      //         value: 1,
                      //         groupValue: state.groupValue,
                      //         onChanged: (value) {
                      //           BlocProvider.of<ProcessedBloc>(context)
                      //             ..add(ProcessedEvent.changeRadio(value));
                      //         }),
                      //   ],
                      // ),
                      ChooseView(),
                      if (state.groupValue == 1) ProcessedBeZhu(),
                      // Container(
                      //   padding: EdgeInsets.only(left: 20, right: 20),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         width: 100,
                      //         child: Text("备注："),
                      //       ),
                      //       Expanded(
                      //           child: TextField(
                      //         maxLines: 4,
                      //         decoration: InputDecoration(
                      //             border: OutlineInputBorder(
                      //                 borderSide:
                      //                     BorderSide(color: Colors.pink))),
                      //         onChanged: (psValue) {
                      //           print(psValue);
                      //           BlocProvider.of<ProcessedBloc>(context)
                      //             ..add(ProcessedEvent.savePS(psValue));
                      //         },
                      //       ))
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
              ],
            ),
          );
          break;
        case "financial":
          if (state.processedItem["taskDefinitionKey"] == "Activity_07a78ln")
            return Container(
              // padding: EdgeInsets.only(left: 10, right: 20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            '当前流程:',
                            style: TextStyle(
                              // fontSize: 15, fontWeight: FontWeight.w500
                              fontFamily: FitnessAppTheme.fontName,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              letterSpacing: 0.5,
                              color: FitnessAppTheme.lightText,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            getPressedName(
                                state.processedItem['taskDefinitionKey']),
                            style: TextStyle(
                              fontFamily: FitnessAppTheme.fontName,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              letterSpacing: 0.5,
                              color: FitnessAppTheme.lightText,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  if (state.processedItem["taskDefinitionKey"] ==
                      "Activity_07a78ln")
                    ProcessedBeZhu(),
                  if (state.processedItem["taskDefinitionKey"] ==
                      "Activity_07a78ln")
                    Container(
                      padding: EdgeInsets.fromLTRB(30, 10, 40, 10),
                      child: JhPhotoPicker(
                          lfPaddingSpace: 20, callBack: (var img) {}),
                    ),
                ],
              ),
            );
          break;

        case "director":
          if (state.processedItem["taskDefinitionKey"] == "Activity_0fvuxs2")
            return Container(
              padding: EdgeInsets.only(left: 10, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          '当前流程:',
                          style: TextStyle(
                            // fontSize: 15, fontWeight: FontWeight.w500
                            fontFamily: FitnessAppTheme.fontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: 0.5,
                            color: FitnessAppTheme.lightText,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          getPressedName(
                              state.processedItem['taskDefinitionKey']),
                          style: TextStyle(
                            fontFamily: FitnessAppTheme.fontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            letterSpacing: 0.5,
                            color: FitnessAppTheme.lightText,
                          ),
                        ),
                      )
                    ],
                  ),
                  if (state.processedItem["taskDefinitionKey"] ==
                      "Activity_0fvuxs2")
                    ChooseView(),
                  if (state.groupValue == 1) ProcessedBeZhu(),
                ],
              ),
            );
          break;

        default:
          return SizedBox(
            height: 10,
          );
      }

      // return (state.userRole == "secretary" ||
      //         state.processedItem["taskDefinitionKey"] ==
      //             "Activity_1atwvxw") //salesman
      //     ? Container(
      //         padding: EdgeInsets.only(right: 20, left: 20),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: <Widget>[
      //                 Text("通过"),
      //                 Radio(
      //                     value: 0,
      //                     groupValue: state.groupValue,
      //                     onChanged: (value) {
      //                       BlocProvider.of<ProcessedBloc>(context)
      //                           .add(ProcessedEvent.changeRadio(value));
      //                     }),
      //                 SizedBox(
      //                   width: 50,
      //                 ),
      //                 Text("不通过"),
      //                 Radio(
      //                     value: 1,
      //                     groupValue: state.groupValue,
      //                     onChanged: (value) {
      //                       BlocProvider.of<ProcessedBloc>(context)
      //                           .add(ProcessedEvent.changeRadio(value));
      //                     }),
      //               ],
      //             ),
      //           ],
      //         ),
      //       )
      //     : state.userRole == "salesman" //secretary
      //         ? Container(
      //             child: Column(
      //               children: [
      //                 Container(
      //                     child: Row(
      //                   children: [
      //                     Container(
      //                       child: Text("下次提醒"),
      //                     ),
      //                     Container(
      //                         width: 300,
      //                         child: DropdownButton(
      //                           items: [
      //                             DropdownMenuItem(child: Text('北京')),
      //                             DropdownMenuItem(child: Text('上海')),
      //                             DropdownMenuItem(child: Text('湖北')),
      //                           ],
      //                           onChanged: (value) {},
      //                         )),
      //                   ],
      //                 )),
      //                 Container(
      //                   margin: EdgeInsets.only(top: 30),
      //                   child: Row(
      //                     children: [
      //                       Container(
      //                         child: Text("客户评价"),
      //                       ),
      //                       Container(
      //                         width: 100,
      //                         child: CupertinoPicker(
      //                           itemExtent: 28,
      //                           onSelectedItemChanged: (position) {
      //                             print("the position is $position");
      //                           },
      //                           children: getListWidgets(),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Container(
      //                   margin: EdgeInsets.only(top: 30),
      //                   child: Row(
      //                     children: [
      //                       Container(
      //                         child: Text("冻结"),
      //                       ),
      //                       Container(
      //                         margin: EdgeInsets.only(left: 100),
      //                         child: OutlineButton(
      //                           onPressed: () {},
      //                           child: Text("冻结"),
      //                         ),
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           )
      //         : state.userRole == "manager"
      //             ? Container(
      //                 child: Column(
      //                   children: [
      //                     if (state.processedItem["taskDefinitionKey"] ==
      //                         "ManagerAssigns")
      //                       Row(
      //                         children: [
      //                           Container(
      //                             child: Text("重新分配"),
      //                           ),
      //                           Container(
      //                               width: 100,
      //                               child: DropdownButton<String>(
      //                                 hint: Text('请选择'),
      //                                 value: state.manageAssignmentUser,
      //                                 items: state.salesmanList
      //                                     .map<DropdownMenuItem<String>>(
      //                                         (item) {
      //                                   return DropdownMenuItem(
      //                                       child: Text(item), value: item);
      //                                 }).toList(),
      //                                 onChanged: (itemValue) {
      //                                   BlocProvider.of<ProcessedBloc>(context)
      //                                       .add(ProcessedEvent
      //                                           .saveManageAssignmentUser(
      //                                               itemValue));
      //                                 },
      //                               )),
      //                         ],
      //                       )
      //                   ],
      //                 ),
      //               )
      //             : Container();
    });
  }

  String getPressedName(name) {
    String StrName = " ";
    switch (name) {
      case "ManagerCheckGuest":
        StrName = "客户审核";
        break;
      case "ManagerAssigns":
        StrName = "分配客户";
        break;
      case "CategoryManagent":
        StrName = "邀约客户";
        break;
      case "Activity_0vv7s63":
        StrName = "认筹/下定提交审核";
        break;
      case "Activity_1atwvxw":
        StrName = "管理员审核";
        break;
      case "Activity_0fcrae3":
        StrName = "客户认筹/下定提交审核";
        break;
      case "Activity_1p4qp4l":
        StrName = "认筹/下定确认";
        break;
      case "Activity_10po9sk":
        StrName = "签订合同提交审核";
        break;
      case "Activity_0ar3k0c":
        StrName = "合同审核";
        break;
      case "Activity_1olkns4":
        StrName = "银行放款提交审核";
        break;
      case "Activity_0sjwc2q":
        StrName = "银行放款审核";
        break;

      //自有
      case "Activity_1h77h4t":
        StrName = "邀约客户";
        break;
      case "Activity_0qk9snp":
        StrName = "认筹/下定提交审核";
        break;
      case "Activity_0x97rbo":
        StrName = "认筹/下定审核";
        break;
      case "Activity_0cy1bz9":
        StrName = "转定";
        break;
      case "Activity_0zeqsng":
        StrName = "转定审核";
        break;
      case "Activity_00n2pwo":
        StrName = "签订合同";
        break;
      case "Activity_0kdzv8w":
        StrName = "合同审核";
        break;
      case "Activity_1cbo1ao":
        StrName = "银行放款";
        break;
      case "Activity_1u7ja7r":
        StrName = "经理分配";
        break;

      //隐号推荐
      case "Activity_060ppeg":
        StrName = "人员判客";
        break;
      case "Activity_0037lus":
        StrName = "客户来访调配";
        break;
      case "Activity_0qvod3g":
        StrName = "认筹/下定跟踪";
        break;
      case "Activity_1vkay0h":
        StrName = "认筹/下定审核";
        break;
      case "Activity_0ki46oj":
        StrName = "转定";
        break;
      case "Activity_1gaipmg":
        StrName = "转定审核";
        break;
      case "Activity_1otznpp":
        StrName = "签订合同";
        break;
      case "Activity_0lnm3vn":
        StrName = "合同审核";
        break;
      case "Activity_0yyexii":
        StrName = "银行放款";
        break;
      case "Activity_0tkddk1":
        StrName = "银行放款审核";
        break;

      //房源
      case "Activity_0fvuxs2":
        StrName = "房源审核";
        break;
      case "":
        StrName = "Activity_0ossp3s";
        break;
      case "房源审核结束":
        break;

      //平台流程
      case "Activity_0639vrl":
        StrName = "邀约客户";
        break;
      case "Activity_00h6h12":
        StrName = "认筹/下定跟踪办理";
        break;
      case "Activity_1f9gn7v":
        StrName = "管理员审核";
        break;
      case "Activity_1v8yzn1":
        StrName = "转定";
        break;
      case "Activity_0k719dd":
        StrName = "转定审核";
        break;
      case "Activity_0ndvcvv":
        StrName = "签订合同";
        break;
      case "Activity_1o336vo":
        StrName = "合同审核";
        break;
      case "Activity_1xgd1ne":
        StrName = "银行放款";
        break;
      case "Activity_19m52i0":
        StrName = "银行放款审核";
        break;
      case "Activity_0lpau4d":
        StrName = "客户分配";
        break;
    }
    return StrName + " ";
  }
}
