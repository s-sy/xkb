import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_ui/domain/messages/i_message_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'messages_event.dart';
part 'messages_state.dart';
part 'messages_bloc.freezed.dart';

@injectable
class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  SharedPreferences _preferences;
  IMessagesFacade _iMessagesFacade;
  MessagesBloc(this._preferences, this._iMessagesFacade)
      : super(MessagesState.initial());

  @override
  Stream<MessagesState> mapEventToState(
    MessagesEvent event,
  ) async* {
    // TODO: implement mapEventToState
    yield* event.map(
      started: (e) {},
      dosth: (e) async* {
        //自己 1332164452899880962
        // jsonDecode(user)["id"] "1332159104952565762" "1332158637736460289" "1332159825970200578"
        var user = await _preferences.get('CACHED_SIGN_IN_USER');
        if (user == null) {
          return;
        }
        Map<String, dynamic> query = {"assigneeIn": jsonDecode(user)["id"]};
        // Map<String, dynamic> query = {"assigneeIn": "1318816530490961921"}; //秘书
        // Map<String, dynamic> query = {"assigneeIn": "1318816628100804610"}; //经理
        // Map<String, dynamic> query = {"assigneeIn": "1318816938164727810"}; //财务
        // Map<String, dynamic> query = {"assigneeIn": "1318816369681346562"};

        //测试服
        // Map<String, dynamic> query = {"assigneeIn": "1318816530490961921"}; //秘书
        // Map<String, dynamic> query = {"assigneeIn": "1318816369681346562"}; //顾问
        // Map<String, dynamic> query = {"assigneeIn": "1369102836608077825"}; //经理
        // Map<String, dynamic> query = {"assigneeIn":"1318816938164727810"};//财务
        var res = await _iMessagesFacade.getTask(query);
        print("推荐信息");
        // print(res);
        res.sort((a, b) => DateTime.parse(b["created"])
            .toLocal()
            .millisecondsSinceEpoch
            .compareTo(
                DateTime.parse(a["created"]).toLocal().millisecondsSinceEpoch));
        String affiliateds = _preferences.get('AFFILIATEDS');
        List list = json.decode(affiliateds);

        Map<String, dynamic> resluts = {};
        for (var i = 0; i < res.length; i++) {
          resluts[res[i]["processDefinitionId"]] =
              res[i]["processDefinitionId"];
        }
        // print(resluts);
        var userInfo = json.decode(_preferences.get('CACHED_SIGN_IN_USER'));
        String tenantId = userInfo["tenantId"];
        List<String> reslutsList = [];
        resluts.forEach((key, value) {
          reslutsList.add(key);
        });
        // print(reslutsList);

        for (var i = 0; i < reslutsList.length; i++) {
          Map<String, dynamic> definQuery = {
            "tenantId": tenantId,
            "definitionId": reslutsList[i]
          };
          var definitionRes =
              await _iMessagesFacade.getDefinitionlist(definQuery);
          // print(definitionRes);
          resluts[reslutsList[i]] = definitionRes['data'];
        }

        yield state.copyWith(
            doSth: res, projectList: list, definitionlist: resluts);
      },
      getHistory: (value) async* {
        // await _iMessagesFacade.getHistory();
      },
      unFreezedCustomer: (value) async* {
        String processedId = value.processedId;
        Map<String, dynamic> query = {
          "suspended": false
          // "frozenReasons": {"value": inputValue},
          // "suspendTask": "true"
        };
        var res = await _iMessagesFacade.unFrezzeprcessed(processedId, query);
        print(res);
      },
      getDelay: (value) async* {
        var query = {"current": 1, "size": 100, "workflowStatus": 3};
        var res = await _iMessagesFacade.getDelay(query);
        // print(res);
        // print(res["data"]["records"]);
        // var sth = state.doSth;
        // sth..add(res["data"]["records"]);
        // print(sth);
        // yield state.copyWith(doSth: sth);
      },
      getProcessDefinition: (value) async* {
        var userInfo = _preferences.get('CACHED_SIGN_IN_USER');
        if (userInfo == null) {
          return;
        }
        var user = jsonDecode(userInfo);
        // Map<String, dynamic> query = {
        //   'tenantIdIn': jsonDecode(user)["tenantId"]
        // };
        // var res = await _iHouseFacade.getProcessDefinition(query);
        // print(res);
        List iss = state.doSth;
        if (user['userRole'] == 'salesman') {
          List<dynamic> acquisitionList = []; //代办
          List<dynamic> oneDayList = []; //今日代办
          List<dynamic> thirdDayList = []; //三日逾期
          Map<String, dynamic> llls = state.definitionlist;
          Map<String, dynamic> def = {};
          llls.forEach((key, value) {
            var item = {};
            for (var i = 0; i < value.length; i++) {
              item[value[i]['variableId']] = value[i]['value'];
              item['definitionKey'] = value[i]['definitionKey'];
              // value[i].forEach((keys, values) {
              //   item[value[i]['variableId']] = value[i]['value'];
              // });
            }
            def[key] = item;
          });
          // print(def);
          var nowTime = new DateTime.now();
          for (var i = 0; i < iss.length; i++) {
            if (!iss[i]["suspended"]) {
              var id = iss[i]['processDefinitionId'];
              def.forEach((key, value) {
                if (key == id) {
                  //  iss[i]["defData"] = value;
                  if (value['definitionKey'] == 'broker') {
                    //全名经纪人
                    if (iss[i]["taskDefinitionKey"] == 'CategoryManagent' ||
                        iss[i]["taskDefinitionKey"] == 'Activity_0vv7s63') {
                      var createTime = DateTime.parse(iss[i]['created']);
                      var time = nowTime.difference(createTime);
                      // print(time.inDays);
                      // print(nowTime);
                      // print(createTime);
                      // print(iss[i]);

                      int date = int.parse(value['executionDuration']
                          .replaceAll(RegExp("[a-zA-Z]"), ""));
                      if (time.inMinutes >= (date - 1) * 24 * 60) {
                        oneDayList.add(iss[i]);
                      } else if (time.inMinutes < (date - 1) * 24 * 60 &&
                          time.inMinutes > (date - 3) * 24 * 60) {
                        thirdDayList.add(iss[i]);
                      } else {
                        acquisitionList.add(iss[i]);
                      }
                    } else {
                      acquisitionList.add(iss[i]);
                    }
                  } else if (value['definitionKey'] == 'enrecommend') {
                    //隐号推荐
                    // print(iss[i]);
                    if (iss[i]["taskDefinitionKey"] == 'Activity_0qvod3g') {
                      var createTime = DateTime.parse(iss[i]['created']);
                      var time = nowTime.difference(createTime);
                      int date = int.parse(value['depositDuration']
                          .replaceAll(RegExp("[a-zA-Z]"), ""));
                      if (time.inMinutes >= (date - 1) * 24 * 60) {
                        oneDayList.add(iss[i]);
                      } else if (time.inMinutes < (date - 1) * 24 * 60 &&
                          time.inMinutes > (date - 3) * 24 * 60) {
                        thirdDayList.add(iss[i]);
                      } else {
                        acquisitionList.add(iss[i]);
                      }
                    } else {
                      acquisitionList.add(iss[i]);
                    }
                  } else if (value['definitionKey'] == 'passenger') {
                    if (iss[i]["taskDefinitionKey"] == 'Activity_00h6h12') {
                      var createTime = DateTime.parse(iss[i]['created']);
                      var time = nowTime.difference(createTime);
                      int date = int.parse(value['depositDuration']
                          .replaceAll(RegExp("[a-zA-Z]"), ""));
                      if (time.inMinutes >= (date - 1) * 24 * 60) {
                        oneDayList.add(iss[i]);
                      } else if (time.inMinutes < (date - 1) * 24 * 60 &&
                          time.inMinutes > (date - 3) * 24 * 60) {
                        thirdDayList.add(iss[i]);
                      } else {
                        acquisitionList.add(iss[i]);
                      }
                    } else {
                      acquisitionList.add(iss[i]);
                    }
                  } else {
                    acquisitionList.add(iss[i]);
                  }
                }
              });
            }
          }
          // print(oneDayList);
          // print(thirdDayList);
          // print(acquisitionList);
          yield state.copyWith(
              oneDayList: oneDayList,
              thirdDayList: thirdDayList,
              waitWorkList: acquisitionList);
        } else {
          var ait = [];
          for (var i = 0; i < iss.length; i++) {
            if (!iss[i]["suspended"]) {
              ait.add(iss[i]);
            }
          }

          yield state.copyWith(waitWorkList: ait);
        }
      },
      getNewCoustomer: (value) async* {
        var userInfo = _preferences.get('CACHED_SIGN_IN_USER');
        if (userInfo == null) {
          return;
        }
        var user = jsonDecode(userInfo);
        if (user['userRole'] == 'salesman') {
          List list = state.doSth;
          List newCousterList = [];

          Map<String, dynamic> unfinainshQuery = {
            "taskDefinitionKey": 'CategoryManagent', // 经纪人邀约跟踪  未完成流程
            "unfinished": true,
            "taskAssignee": user['id']
          };
          List coustomer = [];

          var unFinRes =
              await _iMessagesFacade.getprocessCount(unfinainshQuery);
          var unFinResCopy = unFinRes;
          Map<String, dynamic> finainshQuery = {
            "taskDefinitionKey": 'CategoryManagent', // 经纪人邀约跟踪  完成流程
            "finished": true,
            "taskAssignee": user['id']
          };
          var finRes = await _iMessagesFacade.getprocessCount(finainshQuery);
          Map<String, dynamic> activityquery = {
            "taskDefinitionKey": 'Activity_1h77h4t', //自有 邀约
            "unfinished": true,
            "taskAssignee": user['id']
          };
          var unActRes = await _iMessagesFacade.getprocessCount(activityquery);

          Map<String, dynamic> querys = {
            "taskDefinitionKey": 'Activity_1h77h4t', //自有 邀约
            "finished": true,
            "taskAssignee": user['id']
          };
          var actRes = await _iMessagesFacade.getprocessCount(querys);
          unFinRes..addAll(unActRes);
          finRes..addAll(actRes);

          for (var m = 0; m < unFinRes.length; m++) {
            var isExit = true;
            for (var n = 0; n < finRes.length; n++) {
              if (unFinRes[m]['processInstanceId'] ==
                  finRes[n]['processInstanceId']) {
                // unFinResCopy[]
                isExit = false;
              }
            }
            if (isExit) {
              coustomer.add(unFinRes[m]);
            }
          }
          for (var j = 0; j < coustomer.length; j++) {
            for (var i = 0; i < list.length; i++) {
              if (coustomer[j]["processInstanceId"] ==
                  list[i]["processInstanceId"]) {
                newCousterList.add(list[i]);
              }
            }
          }
          // for (var m = 0; m < unActRes.length; m++) {
          //   var isExit = true;
          //   for (var n = 0; n < actRes.length; n++) {
          //     if (unActRes[m]['processInstanceId'] ==
          //         actRes[n]['processInstanceId']) {
          //       // unFinResCopy[]
          //       isExit = false;
          //     }
          //   }
          //   if (isExit) {
          //     coustomer.add(unActRes[m]);
          //   }
          // }
          // print()
          yield state.copyWith(newCousterList: newCousterList);
        }
      },
      getNewCoustomerNames: (value) async* {
        // oneDayList;
        // thirdDayList;
        // waitWorkList;
        // var couusterList = state.newCousterList;
        var getNameQuery = {
          "processInstanceIdIn": ffew(state.newCousterList),
          "variableValues": "customerName_gteq_5"
        };
        var getoneNameQuery = {
          "processInstanceIdIn": ffew(state.oneDayList),
          "variableValues": "customerName_gteq_5"
        };
        var getthirdNameQuery = {
          "processInstanceIdIn": ffew(state.thirdDayList),
          "variableValues": "customerName_gteq_5"
        };
        var getwaitWorkNameQuery = {
          "processInstanceIdIn": ffew(state.waitWorkList),
          "variableValues": "customerName_gteq_5"
        };

        List newCousterNameList =
            await _iMessagesFacade.getCoustomerName(getNameQuery);
        List oneDayNameList =
            await _iMessagesFacade.getCoustomerName(getoneNameQuery);
        List thirdDayNameList =
            await _iMessagesFacade.getCoustomerName(getthirdNameQuery);
        List waitWorkNameList =
            await _iMessagesFacade.getCoustomerName(getwaitWorkNameQuery);

        yield state.copyWith(
          newCousterNameList: newCousterNameList,
          oneDayNameList: oneDayNameList,
          thirdDayNameList: thirdDayNameList,
          waitWorkNameList: waitWorkNameList,
        );
      },
    );
  }

  String ffew(newCousterList) {
    String str = "";
    for (var p = 0; p < newCousterList.length; p++) {
      if (p == newCousterList.length - 1) {
        str = str + newCousterList[p]["processInstanceId"];
      } else {
        str = str + newCousterList[p]["processInstanceId"] + ',';
      }
    }
    return str;
  }
}
