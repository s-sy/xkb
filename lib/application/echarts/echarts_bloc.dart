import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_ui/domain/echarts/i_echarts.facade.dart';
import 'package:flutter_ui/domain/messages/i_message_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'echarts_event.dart';
part 'echarts_state.dart';
part 'echarts_bloc.freezed.dart';

@injectable
class EchartsBloc extends Bloc<EchartsEvent, EchartsState> {
  IEchartsFacade iEchartsFacade;
  IMessagesFacade iMessagesFacade;

  EchartsBloc(this.iEchartsFacade, this.iMessagesFacade)
      : super(EchartsState.initial());

  @override
  Stream<EchartsState> mapEventToState(
    EchartsEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {},
      getHouseName: (value) async* {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        String houseName = sharedPreferences.get('HOUSESNAME');
        if (houseName == null) {
          String affiliateds = sharedPreferences.get('AFFILIATEDS');
          if (affiliateds != null) {
            houseName = jsonDecode(affiliateds)[0]["projectName"];
          }
        }
        yield state.copyWith(houseName: houseName);
      },
      getPie: (value) async* {
        var res = await iEchartsFacade.getPie();
        if (res == null) {
          return;
        }
        print(res);
        List<dynamic> sceneVos = res["data"]["sceneVos"];
        List<String> sceneTitle = []; //
        List<Map<String, Object>> sceneList = [];

        List<dynamic> userRoleVos = res["data"]["userRoleVos"];
        List<String> userRoleTitle = []; //
        List<Map<String, Object>> userRoleList = [];

        List<dynamic> groupVos = res["data"]["groupVos"];
        List<Map<String, Object>> groupVosList = [];

        for (int i = 0; i < groupVos.length; i++) {
          List recommendList = groupVos[i]["recommendList"];
          List shareList = groupVos[i]["shareList"];
          List groupList = [];
          List groupTitle = [];
          for (int i = 0; i < recommendList.length; i++) {
            Map<String, Object> item = {'value': 0, 'name': ''};
            switch (recommendList[i]["classified"]) {
              case "0":
                groupTitle.add('全名经纪推荐');
                item['value'] = recommendList[i]["count"];
                item['name'] = '全名经纪推荐';
                groupList.add(item);
                break;
              case "1":
                groupTitle.add('自有客户');
                item['value'] = recommendList[i]["count"];
                item['name'] = '自有客户';
                groupList.add(item);
                break;
              case "2":
                groupTitle.add('隐号客户');
                item['value'] = recommendList[i]["count"];
                item['name'] = '隐号客户';
                groupList.add(item);
                break;
            }
          }
          for (int i = 0; i < shareList.length; i++) {
            Map<String, Object> item = {'value': 0, 'name': ''};
            switch (shareList[i]["classified"]) {
              case "3":
                groupTitle.add('平台获客');
                item['value'] = shareList[i]["count"];
                item['name'] = '平台获客';
                groupList.add(item);
                break;
            }
          }
          Map<String, Object> map = {
            "groupName": groupVos[i]["groupName"],
            "groupVosTitle": [],
            "groupVosList": [],
          };
          map["groupVosTitle"] = groupTitle;
          map["groupVosList"] = groupList;
          groupVosList.add(map);
        }
        for (var i = 0; i < userRoleVos.length; i++) {
          Map<String, Object> item = {'value': 0, 'name': ''};
          switch (userRoleVos[i]["userRole"]) {
            case "0":
              userRoleTitle.add('普通经纪人');
              item['value'] = userRoleVos[i]["count"];
              item['name'] = '普通经纪人';
              userRoleList.add(item);
              break;
            case "1":
              userRoleTitle.add('注册经纪人');
              item['value'] = userRoleVos[i]["count"];
              item['name'] = '注册经纪人';
              userRoleList.add(item);
              break;
            case "2":
              userRoleTitle.add('中介公司');
              item['value'] = userRoleVos[i]["count"];
              item['name'] = '中介公司';
              userRoleList.add(item);
              break;
            case "3":
              userRoleTitle.add('内部员工(非销售岗)');
              item['value'] = userRoleVos[i]["count"];
              item['name'] = '内部员工(非销售岗)';
              userRoleList.add(item);
              break;
            case "4":
              userRoleTitle.add('内部员工(销售岗)');
              item['value'] = userRoleVos[i]["count"];
              item['name'] = '内部员工(销售岗)';
              userRoleList.add(item);
              break;
            case "5":
              userRoleTitle.add('业主');
              item['value'] = userRoleVos[i]["count"];
              item['name'] = '业主';
              userRoleList.add(item);
              break;
          }
        }
        for (var i = 0; i < sceneVos.length; i++) {
          Map<String, Object> item = {'value': 0, 'name': ''};
          switch (sceneVos[i]["scene"]) {
            case 'non':
              sceneTitle.add('未知');
              item['value'] = sceneVos[i]['count'];
              item['name'] = '未知';
              sceneList.add(item);
              break;
            case 'age':
              sceneTitle.add('经纪人');
              item['value'] = sceneVos[i]['count'];
              item['name'] = '经纪人';
              sceneList.add(item);
              break;
            case 'mc':
              sceneTitle.add('营销中心');
              item['value'] = sceneVos[i]['count'];
              item['name'] = '营销中心';
              sceneList.add(item);
              break;
            case 'web':
              sceneTitle.add('网站');
              item['value'] = sceneVos[i]['count'];
              item['name'] = '网站';
              sceneList.add(item);
              break;
            case 'cle':
              sceneTitle.add('业务员');
              item['value'] = sceneVos[i]['count'];
              item['name'] = '业务员';
              sceneList.add(item);
              break;
            case 'meu':
              sceneTitle.add('公众号菜单');
              item['value'] = sceneVos[i]['count'];
              item['name'] = '公众号菜单';
              sceneList.add(item);
              break;
            default:
              sceneTitle.add(sceneVos[i]['scene']);
              item['value'] = sceneVos[i]['count'];
              item['name'] = sceneVos[i]['scene'];
              sceneList.add(item);
          }
        }
        // print(sceneList);
        // print("++++++++++++++++++++++++");
        // print(sceneList);
        // print(groupList);
        yield state.copyWith(
          sceneTitle: sceneTitle,
          sceneList: sceneList,
          userRoleTitle: userRoleTitle,
          userRoleList: userRoleList,
          // recommendTitle: recommendTitle,
          // recommendList: recommendList,
          // shareTitle: shareTitle,
          // shareList: shareList,
          groupList: groupVosList,
        );
      },
      getDuration: (value) async* {
        //String duration = '2'; // 1zhou 2yue 1查周， 2查月
        // String portion = '2'; // 第几月
        // var res =
        //     await iEchartsFacade.getDuration(value.duration, value.portion);
        var res =
            await iEchartsFacade.getDuration(value.duration, value.portion);
        int index = getKey(value.key);
        int countWeek = res["data"].length;
        bool isMonth = false;
        print(res);
        print(index);
        if (value.key.endsWith("月")) {
          isMonth = true;
          List sceneMonth = getMonth(res["data"], "sceneVos", "scene");
          print(sceneMonth);
          List roleMonth = getMonth(res["data"], "userRoleVos", "userRole");
          print(roleMonth);
          List groupMonth = getWayMonth(res["data"]);
          print(groupMonth);
          List sceneTitle = [];
          List sceneList = [];
          for (var i = 0; i < sceneMonth.length; i++) {
            Map<String, Object> item = {'value': 0, 'name': ''};
            switch (sceneMonth[i]["scene"]) {
              case 'non':
                sceneTitle.add('未知');
                item['value'] = sceneMonth[i]['count'];
                item['name'] = '未知';
                sceneList.add(item);
                break;
              case 'age':
                sceneTitle.add('经纪人');
                item['value'] = sceneMonth[i]['count'];
                item['name'] = '经纪人';
                sceneList.add(item);
                break;
              case 'mc':
                sceneTitle.add('营销中心');
                item['value'] = sceneMonth[i]['count'];
                item['name'] = '营销中心';
                sceneList.add(item);
                break;
              case 'web':
                sceneTitle.add('网站');
                item['value'] = sceneMonth[i]['count'];
                item['name'] = '网站';
                sceneList.add(item);
                break;
              case 'cle':
                sceneTitle.add('业务员');
                item['value'] = sceneMonth[i]['count'];
                item['name'] = '业务员';
                sceneList.add(item);
                break;
              case 'meu':
                sceneTitle.add('公众号菜单');
                item['value'] = sceneMonth[i]['count'];
                item['name'] = '公众号菜单';
                sceneList.add(item);
                break;
              default:
                sceneTitle.add(sceneMonth[i]['scene']);
                item['value'] = sceneMonth[i]['count'];
                item['name'] = sceneMonth[i]['scene'];
                sceneList.add(item);
            }
          }
          List userRoleTitle = [];
          List userRoleList = [];
          for (var i = 0; i < roleMonth.length; i++) {
            Map<String, Object> item = {'value': 0, 'name': ''};
            switch (roleMonth[i]["userRole"]) {
              case "0":
                userRoleTitle.add('普通经纪人');
                item['value'] = roleMonth[i]["count"];
                item['name'] = '普通经纪人';
                userRoleList.add(item);
                break;
              case "1":
                userRoleTitle.add('注册经纪人');
                item['value'] = roleMonth[i]["count"];
                item['name'] = '注册经纪人';
                userRoleList.add(item);
                break;
              case "2":
                userRoleTitle.add('中介公司');
                item['value'] = roleMonth[i]["count"];
                item['name'] = '中介公司';
                userRoleList.add(item);
                break;
              case "3":
                userRoleTitle.add('内部员工(非销售岗)');
                item['value'] = roleMonth[i]["count"];
                item['name'] = '内部员工(非销售岗)';
                userRoleList.add(item);
                break;
              case "4":
                userRoleTitle.add('内部员工(销售岗)');
                item['value'] = roleMonth[i]["count"];
                item['name'] = '内部员工(销售岗)';
                userRoleList.add(item);
                break;
              case "5":
                userRoleTitle.add('业主');
                item['value'] = roleMonth[i]["count"];
                item['name'] = '业主';
                userRoleList.add(item);
                break;
            }
          }
          List listFinalGroup = groupMonthList(groupMonth);

          // print(unSortList);
          // print(groupTitle);
          // print(groupList);
          // print(weekTitle);
          yield state.copyWith(
            kindSceneTitle: sceneTitle,
            kindSceneList: sceneList,
            kindUserRoleTitle: userRoleTitle,
            kindUserRoleList: userRoleList,
            kindGroupList: listFinalGroup,
            // weekTitle: weekTitle,
            // groupTitle: groupTitle,
            countWeek: countWeek,
            isMonth: isMonth,
          );
        } else {
          isMonth = false;
          List<dynamic> sceneVos = res["data"][index]["sceneVos"];
          if (sceneVos == null) {
            sceneVos = [];
          }
          List<String> sceneTitle = [];
          List<Map<String, Object>> sceneList = [];

          List<dynamic> userRoleVos = res["data"][index]["userRoleVos"];
          if (userRoleVos == null) {
            userRoleVos = [];
          }
          List<String> userRoleTitle = [];
          List<Map<String, Object>> userRoleList = [];

          List<dynamic> groupVos = res["data"][index]["groupVos"];
          if (groupVos == null) {
            groupVos = [];
          }
          List<Map<String, Object>> groupVosList = [];

          for (int i = 0; i < groupVos.length; i++) {
            List recommendList = groupVos[i]["recommendList"];
            List shareList = groupVos[i]["shareList"];
            List groupList = [];
            List groupTitle = [];
            for (int i = 0; i < recommendList.length; i++) {
              Map<String, Object> item = {'value': 0, 'name': ''};
              switch (recommendList[i]["classified"]) {
                case "0":
                  groupTitle.add('全名经纪推荐');
                  item['value'] = recommendList[i]["count"];
                  item['name'] = '全名经纪推荐';
                  groupList.add(item);
                  break;
                case "1":
                  groupTitle.add('自有客户');
                  item['value'] = recommendList[i]["count"];
                  item['name'] = '自有客户';
                  groupList.add(item);
                  break;
                case "2":
                  groupTitle.add('隐号客户');
                  item['value'] = recommendList[i]["count"];
                  item['name'] = '隐号客户';
                  groupList.add(item);
                  break;
              }
            }
            for (int i = 0; i < shareList.length; i++) {
              Map<String, Object> item = {'value': 0, 'name': ''};
              switch (shareList[i]["classified"]) {
                case "3":
                  groupTitle.add('平台获客');
                  item['value'] = shareList[i]["count"];
                  item['name'] = '平台获客';
                  groupList.add(item);
                  break;
              }
            }
            Map<String, Object> map = {
              "groupName": groupVos[i]["groupName"],
              "groupVosTitle": [],
              "groupVosList": [],
            };
            map["groupVosTitle"] = groupTitle;
            map["groupVosList"] = groupList;
            groupVosList.add(map);
          }
          for (var i = 0; i < userRoleVos.length; i++) {
            Map<String, Object> item = {'value': 0, 'name': ''};
            switch (userRoleVos[i]["userRole"]) {
              case "0":
                userRoleTitle.add('普通经纪人');
                item['value'] = userRoleVos[i]["count"];
                item['name'] = '普通经纪人';
                userRoleList.add(item);
                break;
              case "1":
                userRoleTitle.add('注册经纪人');
                item['value'] = userRoleVos[i]["count"];
                item['name'] = '注册经纪人';
                userRoleList.add(item);
                break;
              case "2":
                userRoleTitle.add('中介公司');
                item['value'] = userRoleVos[i]["count"];
                item['name'] = '中介公司';
                userRoleList.add(item);
                break;
              case "3":
                userRoleTitle.add('内部员工(非销售岗)');
                item['value'] = userRoleVos[i]["count"];
                item['name'] = '内部员工(非销售岗)';
                userRoleList.add(item);
                break;
              case "4":
                userRoleTitle.add('内部员工(销售岗)');
                item['value'] = userRoleVos[i]["count"];
                item['name'] = '内部员工(销售岗)';
                userRoleList.add(item);
                break;
              case "5":
                userRoleTitle.add('业主');
                item['value'] = userRoleVos[i]["count"];
                item['name'] = '业主';
                userRoleList.add(item);
                break;
            }
          }
          for (var i = 0; i < sceneVos.length; i++) {
            Map<String, Object> item = {'value': 0, 'name': ''};
            switch (sceneVos[i]["scene"]) {
              case 'non':
                sceneTitle.add('未知');
                item['value'] = sceneVos[i]['count'];
                item['name'] = '未知';
                sceneList.add(item);
                break;
              case 'age':
                sceneTitle.add('经纪人');
                item['value'] = sceneVos[i]['count'];
                item['name'] = '经纪人';
                sceneList.add(item);
                break;
              case 'mc':
                sceneTitle.add('营销中心');
                item['value'] = sceneVos[i]['count'];
                item['name'] = '营销中心';
                sceneList.add(item);
                break;
              case 'web':
                sceneTitle.add('网站');
                item['value'] = sceneVos[i]['count'];
                item['name'] = '网站';
                sceneList.add(item);
                break;
              case 'cle':
                sceneTitle.add('业务员');
                item['value'] = sceneVos[i]['count'];
                item['name'] = '业务员';
                sceneList.add(item);
                break;
              case 'meu':
                sceneTitle.add('公众号菜单');
                item['value'] = sceneVos[i]['count'];
                item['name'] = '公众号菜单';
                sceneList.add(item);
                break;
              default:
                sceneTitle.add(sceneVos[i]['scene']);
                item['value'] = sceneVos[i]['count'];
                item['name'] = sceneVos[i]['scene'];
                sceneList.add(item);
            }
          }
          yield state.copyWith(
            kindSceneTitle: sceneTitle,
            kindSceneList: sceneList,
            kindUserRoleTitle: userRoleTitle,
            kindUserRoleList: userRoleList,
            kindGroupList: groupVosList,
            countWeek: countWeek,
            isMonth: isMonth,
          );
        }
      },
      getDatePortion: (value) async* {
        var time = value.portion;
        yield state.copyWith(portion: time);
      },
      changeDurtion: (value) async* {
        yield state.copyWith(duration: value.i);
      },
      changePortion: (value) async* {
        yield state.copyWith(portion: value.i);
      },
      getFastreport: (value) async* {
        //3的时候查周，不为3的时候leaderweek没用
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        var userInfo = sharedPreferences.get('CACHED_SIGN_IN_USER');
        String userId = jsonDecode(userInfo)["id"];
        String houseId = sharedPreferences.get('HOUSEID');
        if (houseId == null) {
          String affiliateds = sharedPreferences.get('AFFILIATEDS');
          if (affiliateds != null) {
            houseId = jsonDecode(affiliateds)[0]["id"];
          }
        }
        bool isManager = false;
        if (jsonDecode(userInfo)["userRole"] == "manager" ||
            jsonDecode(userInfo)["userRole"] == "director") {
          isManager = true;
        }
        if (value.id != "自己") {
          userId = value.id;
        }
        if (value.key == "总月") {
          List listMonth = [];
          for (int i = 1; i <= DateTime.now().month; i++) {
            var res = await iEchartsFacade.getFastreport(2, i, userId, 0);
            if (res['ok']) {
              Map<String, dynamic> map = {
                "shared": 0, //分享
                "registrations": 0, //注册
                "invite": 0, //邀请了多少人
                "appoint": 0,
                "key": "",
              };
              for (int i = 0; i < res["data"].length; i++) {
                map["shared"] =
                    res["data"][i]["personnelDTO"]["shared"] + map["shared"];
                map["registrations"] = res["data"][i]["personnelDTO"]
                        ["registrations"] +
                    map["registrations"];
                map["invite"] = res["data"][i]["invite"] + map["invite"];
                map["appoint"] = res["data"][i]["appoint"] + map["appoint"];
              }
              switch (i) {
                case 1:
                  map["key"] = "1月";
                  break;
                case 2:
                  map["key"] = "2月";
                  break;
                case 3:
                  map["key"] = "3月";
                  break;
                case 4:
                  map["key"] = "4月";
                  break;
                case 5:
                  map["key"] = "5月";
                  break;
                case 6:
                  map["key"] = "6月";
                  break;
                case 7:
                  map["key"] = "7月";
                  break;
                case 8:
                  map["key"] = "8月";
                  break;
                case 9:
                  map["key"] = "9月";
                  break;
                case 10:
                  map["key"] = "10月";
                  break;
                case 11:
                  map["key"] = "11月";
                  break;
                case 12:
                  map["key"] = "12月";
                  break;
              }
              listMonth.add(map);
            }
          }
          var response = await iMessagesFacade.getSalesmanList(houseId);
          // print(response);
          yield state.copyWith(
            personnelYear: listMonth,
            allSalesman: response["data"],
            isManager: isManager,
          );
        } else if (value.key.endsWith("月")) {
          List listWeek = [];
          var res = await iEchartsFacade.getFastreport(
              value.duration, value.portion, userId, 0);
          // print(res);
          if (res['ok']) {
            for (int i = 0; i < res["data"].length; i++) {
              Map<String, dynamic> map = {
                "shared": 0,
                "registrations": 0,
                "invite": 0,
                "appoint": 0,
                "key": "",
              };
              switch (i) {
                case 0:
                  map["key"] = "第1周";
                  break;
                case 1:
                  map["key"] = "第2周";
                  break;
                case 2:
                  map["key"] = "第3周";
                  break;
                case 3:
                  map["key"] = "第4周";
                  break;
                case 4:
                  map["key"] = "第5周";
                  break;
                case 5:
                  map["key"] = "第6周";
                  break;
              }
              map["shared"] = res["data"][i]["personnelDTO"]["shared"];
              map["registrations"] =
                  res["data"][i]["personnelDTO"]["registrations"];
              map["invite"] = res["data"][i]["invite"];
              map["appoint"] = res["data"][i]["appoint"];
              listWeek.add(map);
            }
          }
          yield state.copyWith(personnelYear: listWeek);
        } else if (value.key.startsWith("第")) {
          //通过周来查天的数据还缺接口
          List listDay = [];
          // leaderweek 这里 就需要查周了
          var res = await iEchartsFacade.getFastreport(
              value.duration, value.portion, userId, value.weekIndex);
          if (res['ok']) {
            for (int i = 0; i < res["data"].length; i++) {
              Map<String, dynamic> map = {
                "shared": 0,
                "registrations": 0,
                "invite": 0,
                "appoint": 0,
                "key": "",
              };
              switch (i) {
                case 0:
                  map["key"] = "周1";
                  break;
                case 1:
                  map["key"] = "周2";
                  break;
                case 2:
                  map["key"] = "周3";
                  break;
                case 3:
                  map["key"] = "周4";
                  break;
                case 4:
                  map["key"] = "周5";
                  break;
                case 5:
                  map["key"] = "周6";
                  break;
                case 6:
                  map["key"] = "周7";
                  break;
              }
              map["shared"] = res["data"][i]["personnelDTO"]["shared"];
              map["registrations"] =
                  res["data"][i]["personnelDTO"]["registrations"];
              map["invite"] = res["data"][i]["invite"];
              map["appoint"] = res["data"][i]["appoint"];
              listDay.add(map);
            }
          }
          print(listDay);
          yield state.copyWith(personnelYear: listDay);
        } else if (value.key == "本周") {
          List listDay = [];
          var res = await iEchartsFacade.getFastreport(
              value.duration, value.portion, userId, 0);
          if (res['ok']) {
            for (int i = 0; i < res["data"].length; i++) {
              Map<String, dynamic> map = {
                "shared": 0,
                "registrations": 0,
                "invite": 0,
                "appoint": 0,
                "key": "",
              };
              switch (i) {
                case 0:
                  map["key"] = "周1";
                  break;
                case 1:
                  map["key"] = "周2";
                  break;
                case 2:
                  map["key"] = "周3";
                  break;
                case 3:
                  map["key"] = "周4";
                  break;
                case 4:
                  map["key"] = "周5";
                  break;
                case 5:
                  map["key"] = "周6";
                  break;
                case 6:
                  map["key"] = "周7";
                  break;
              }
              map["shared"] = res["data"][i]["personnelDTO"]["shared"];
              map["registrations"] =
                  res["data"][i]["personnelDTO"]["registrations"];
              map["invite"] = res["data"][i]["invite"];
              map["appoint"] = res["data"][i]["appoint"];
              listDay.add(map);
            }
          }
          print(listDay);
          yield state.copyWith(personnelYear: listDay);
        }
      },
    );
  }

  int getKey(String key) {
    int index = 0;
    switch (key) {
      //选月
      // case "本月":
      //   index = 100;
      // break;
      //选天
      case "本周1":
        index = 0;
        break;
      case "本周2":
        index = 1;
        break;
      case "本周3":
        index = 2;
        break;
      case "本周4":
        index = 3;
        break;
      case "本周5":
        index = 4;
        break;
      case "本周6":
        index = 5;
        break;
      case "本周7":
        index = 6;
        break;
      //选周
      case "第1周":
        index = 0;
        break;
      case "第2周":
        index = 1;
        break;
      case "第3周":
        index = 2;
        break;
      case "第4周":
        index = 3;
        break;
      case "第5周":
        index = 4;
        break;
      case "第6周":
        index = 5;
        break;
      // case "本周":
      //   index = getnowweek() - 1;
      //   break;
    }
    if (key.endsWith("月")) {
      index = 0; //这个没用了
    }
    return index;
  }

  int getnowweek() {
    var time = new DateTime.now(); //当前时间
    int day = time.day; //今天几号
    int week = time.weekday; // 今天周几
    while (true) {
      week--;
      day--;
      if (week == 0) {
        week = 7;
      }
      if (day == 1) {
        break;
      }
    }
    int k = 1;
    int y = 1;
    print(week);
    while (true) {
      week++;
      y++;
      if (week == 8) {
        k++;
        week = 1;
      }
      if (y == time.day) {
        break;
      }
    }
    print(k); //这个月的第几周
    return k;
  }

  getWayMonth(List list) {
    print(list);
    int groupVosCounts = 0;
    for (int i = 0; i < list.length; i++) {
      if (groupVosCounts <= list[i]["groupVos"].length) {
        groupVosCounts = list[i]["groupVos"].length;
      }
    }
    List groupMonth = [];
    for (int k = 0; k < groupVosCounts; k++) {
      List listGroup = [];
      for (int i = 0; i < list.length; i++) {
        listGroup.add(list[i]["groupVos"][k]);
      }
      groupMonth.add(listGroup);
    }
    print(groupMonth);

    return groupMonth;
  }

  getMonth(List list, String keyName, String valueName) {
    List listScen = [];
    for (int i = 0; i < list.length; i++) {
      List<dynamic> sceneVos = list[i][keyName];
      // List<String> sceneTitle = [];
      // List<Map<String, Object>> sceneList = [];
      listScen.add(sceneVos);
    }
    // print(listScen);
    List list02 = [];
    for (var i = 0; i < listScen.length; i++) {
      List list = listScen[i];
      for (int j = 0; j < list.length; j++) {
        list02.add(list[j]);
      }
    }
    // print(list02);
    List list03 = [];
    for (int i = 0; i < list02.length; i++) {
      bool isRepeat = false;
      String scene = "";
      for (int j = 0; j < list03.length; j++) {
        if (list03[j][valueName] == list02[i][valueName]) {
          isRepeat = true;
          scene = list02[i][valueName];
        }
      }
      if (!isRepeat) {
        list03.add(list02[i]);
      } else {
        for (int k = 0; k < list03.length; k++) {
          if (list03[k][valueName] == scene) {
            list03[k]["count"] = list03[k]["count"] + list02[i]["count"];
          }
        }
      }
    }
    // print(list03);
    return list03;
  }

  groupMonthList(List groupMonth) {
    List groupTitle = [];
    List groupList = [];
    for (int i = 0; i < groupMonth.length; i++) {
      List listWeek = groupMonth[i];
      List monthlist = [];
      for (int j = 0; j < listWeek.length; j++) {
        List recList = listWeek[j]["recommendList"];
        List shaList = listWeek[j]["shareList"];
        String groupName = listWeek[j]["groupName"];
        if (!groupTitle.contains(groupName)) {
          groupTitle.add(groupName);
        }

        List weekList = [];
        for (int k = 0; k < recList.length; k++) {
          Map<String, Object> item = {'value': 0, 'name': ''};
          switch (recList[k]["classified"]) {
            case "0":
              item['value'] = recList[k]["count"];
              item['name'] = '全名经纪推荐';
              weekList.add(item);
              break;
            case "1":
              item['value'] = recList[k]["count"];
              item['name'] = '自有客户';
              weekList.add(item);
              break;
            case "2":
              item['value'] = recList[k]["count"];
              item['name'] = '隐号客户';
              weekList.add(item);
              break;
          }
        }
        for (int k = 0; k < shaList.length; k++) {
          Map<String, Object> item = {'value': 0, 'name': ''};
          switch (shaList[k]["classified"]) {
            case "3":
              item['value'] = shaList[k]["count"];
              item['name'] = '平台获客';
              weekList.add(item);
              break;
          }
        }
        monthlist.add(weekList);
      }
      groupList.add(monthlist);
    }
    List unSortList = [];
    for (int i = 0; i < groupList.length; i++) {
      List list = [];
      for (int k = 0; k < groupList[i].length; k++) {
        for (int j = 0; j < groupList[i][k].length; j++) {
          list.add(groupList[i][k][j]);
        }
      }
      unSortList.add(list);
    }
    List listFinalGroup = [];
    for (int i = 0; i < unSortList.length; i++) {
      List list = [];
      List listTitle = [];
      for (int k = 0; k < unSortList[i].length; k++) {
        bool isRepeat = false;
        String name = "";
        for (int j = 0; j < list.length; j++) {
          if (list[j]["name"] == unSortList[i][k]["name"]) {
            isRepeat = true;
            name = unSortList[i][k]["name"];
          }
        }
        if (!isRepeat) {
          list.add(unSortList[i][k]);
        } else {
          for (int m = 0; m < list.length; m++) {
            if (list[m]["name"] == name) {
              list[m]["value"] = list[m]["value"] + unSortList[i][k]["value"];
            }
          }
        }
        if (!listTitle.contains(unSortList[i][k]["name"])) {
          listTitle.add(unSortList[i][k]["name"]);
        }
      }
      Map<String, dynamic> map = {
        "groupName": "",
        "groupVosTitle": [],
        "groupVosList": [],
      };
      map["groupVosList"] = list;
      map["groupName"] = groupTitle[i];
      map["groupVosTitle"] = listTitle;

      listFinalGroup.add(map);
    }
    print(listFinalGroup);
    return listFinalGroup;
  }
}
