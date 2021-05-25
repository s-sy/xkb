import 'dart:async';
import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_ui/domain/wxpage/i_wx_page_facade.dart';
part 'wechathomepage_event.dart';
part 'wechathomepage_state.dart';
part 'wechathomepage_bloc.freezed.dart';

@injectable
class WechathomepageBloc
    extends Bloc<WechathomepageEvent, WechathomepageState> {
  IWxPageFacade _iWxPageFacade;
  SharedPreferences _preferences;
  WechathomepageBloc(this._iWxPageFacade, this._preferences)
      : super(WechathomepageState.initial());

  @override
  Stream<WechathomepageState> mapEventToState(
    WechathomepageEvent event,
  ) async* {
    yield* event.map(
      started: (value) async* {
        var projectItem = await _preferences.get("ProjectItem");
        print(projectItem);
        // yield state.copyWith(project: json.decode(projectItem));
        yield state.copyWith(project: value.affData);
      },
      getNotice: (value) async* {
        // var projectItem = await _preferences.get("ProjectItem");
        Map<String, dynamic> query = {
          "type": "1", //1 轮播图 2 公告
          "enable": "1",
          "affiliation": "2",
          "affiliationId": state.project["id"],
        };
        var result = await _iWxPageFacade.getNotice(query);
        var swiperList = [];
        if (result["data"] != null) {
          swiperList = result["data"]["listAdvertisementItem"];
        }

        Map<String, dynamic> querys = {
          "type": "2", //1 轮播图 2 公告
          "enable": "1",
          "affiliation": "2",
          "affiliationId": state.project["id"],
        };
        var results = await _iWxPageFacade.getNotice(querys);
        List notice = [];
        if (results["data"] != null) {
          var res = results["data"]["listAdvertisementItem"];
          notice = res;
        }
        print(notice);
        yield state.copyWith(swiperList: swiperList, notice: notice);
      },
      getapartmentlayout: (value) async* {
        Map<String, dynamic> query = {
          "current": 1,
          "size": 2,
          "descs": "is_stick",
          "affiliation": "2",
          "affiliationId": state.project["id"],
        };
        var result = await _iWxPageFacade.getapartmentlayout(query);
        if (!result.containsKey("data")) {
          return;
        }
        List apartmentlayout = result["data"]["records"];
        print(apartmentlayout);
        yield state.copyWith(apartmentlayout: apartmentlayout);
      },
      getNewsinformation: (value) async* {
        Map<String, dynamic> query = {
          "current": 1,
          "size": 3,
          "descs": "create_time",
          "affiliationId": state.project["id"],
        };
        var result = await _iWxPageFacade.getNewsinformation(query);
        if (!result.containsKey("data")) {
          return;
        }
        List newsinformation = result["data"]["records"];
        // print(newsinformation);
        yield state.copyWith(newsinformation: newsinformation);
      },
      getAwesomeshooting: (value) async* {
        Map<String, dynamic> query = {
          "current": 1,
          "size": 3,
          "descs": "create_time",
          "auditStatus": 1,
          "affiliationId": state.project["id"],
        };
        var result = await _iWxPageFacade.getAwesomeshooting(query);
        if (!result.containsKey("data")) {
          return;
        }
        List awesomeshooting = result["data"]["records"];
        print(awesomeshooting);
        yield state.copyWith(awesomeshooting: awesomeshooting);
      },
      getAwesomeshootingAll: (value) async* {
        //这里以后做一个下拉刷新
        Map<String, dynamic> query = {
          "current": 1,
          "size": 10,
          "descs": "create_time",
          "auditStatus": 1,
          "affiliationId": value.affData["id"],
        };
        var result = await _iWxPageFacade.getAwesomeshooting(query);
        List awesomeshooting = result["data"]["records"];
        print(awesomeshooting);
        yield state.copyWith(awesomeshootingAll: awesomeshooting);
      },
      getreadingReviews: (value) async* {
        Map<String, dynamic> query = {
          "current": 1,
          "size": 3,
          "descs": "create_time",
          "auditStatus": 1,
          "affiliationId": state.project["id"],
        };

        var result = await _iWxPageFacade.getReadingReviews(query);
        if (!result.containsKey("data")) {
          return;
        }
        List readingReviews = result["data"]["records"];
        print(readingReviews);
        yield state.copyWith(readingReviews: readingReviews);
      },
      getreadingReviewsAll: (value) async* {
        //这里以后做一个下拉刷新
        Map<String, dynamic> query = {
          "current": 1,
          "size": 10,
          "descs": "create_time",
          "auditStatus": 1,
          "affiliationId": value.affData["id"],
        };

        var result = await _iWxPageFacade.getReadingReviews(query);
        List readingReviews = result["data"]["records"];
        print(readingReviews);
        yield state.copyWith(readingReviewsAll: readingReviews);
      },
      gettotalviews: (value) async* {
        var result = await _iWxPageFacade.gettotalviews(state.project["id"]);

        print(result);
        yield state.copyWith(totalviews: result);

        //浏览量，评论TODO：
      },
      getQuestionsPage: (value) async* {
        Map<String, dynamic> query = {
          "current": 1,
          "size": 3,
          "descs": "create_time",
          "auditStatus": 1,
          "affiliationId": state.project["id"],
        };
        var result = await _iWxPageFacade.getQuestionsPage(query);
        if (!result.containsKey("data")) {
          return;
        }
        List questionsPage = result["data"]["records"];
        print(questionsPage);
        yield state.copyWith(questionsPage: questionsPage);
      },
      getQuestionsPageAll: (value) async* {
        //这里以后做一个下拉刷新
        Map<String, dynamic> query = {
          "current": 1,
          "size": 10,
          "descs": "create_time",
          "auditStatus": 1,
          "affiliationId": value.affData["id"],
        };
        var result = await _iWxPageFacade.getQuestionsPage(query);
        List questionsPage = result["data"]["records"];
        print(questionsPage);
        yield state.copyWith(questionsPageAll: questionsPage);
      },
      getPopupads: (_GetPopupads value) {},
      sendaddviews: (_Sendaddviews value) {},
      getTaills: (value) async* {
        String affId = state.project["id"];
        var result = await _iWxPageFacade.getTaills(affId);
        if (!result.containsKey("data")) {
          return;
        }
        print(result);
        yield state.copyWith(
          salesman: result["data"],
        );
      },
      getTaillsAll: (value) async* {
        // String affId = state.project["id"];
        var result = await _iWxPageFacade.getTaills(value.affId);
        print(result);
        if (!result.containsKey("data")) {
          return;
        }
        yield state.copyWith(
          salesmanAll: result["data"],
        );
      },
      houseInfo: (value) async* {
        var buddingDetails =
            await _iWxPageFacade.getBaseBudding(value.affData["id"]);
        print(buddingDetails);
        if (!buddingDetails.containsKey("data")) {
          return;
        }
        yield state.copyWith(houseInfo: buddingDetails["data"]);
      },
      apartmentlayoutList: (value) async* {
        Map<String, dynamic> query = {
          "current": 1,
          "size": 100,
          "descs": "sort",
          "affiliation": "2",
          "affiliationId": value.affData["id"],
        };

        var reslut = await _iWxPageFacade.getapartmentlayout(query);
        List apartmentlayout = reslut["data"]["records"];
        print(apartmentlayout);
        List listTag = tagNum(apartmentlayout);
        yield state.copyWith(
            apartmentlayoutAll: apartmentlayout, listTag: listTag);
      },
      getNewsinformationAll: (value) async* {
        // print(value.affData);
        Map<String, dynamic> query;
        switch (value.type) {
          case "qb":
            query = {
              "current": 1,
              "size": 10,
              "descs": "create_time",
              "affiliationId": value.affData["id"],
            };
            break;
          case "yh":
            query = {
              "current": 1,
              "size": 10,
              "descs": "create_time",
              "category": "1",
              "affiliationId": value.affData["id"],
            };
            break;
          case "hd":
            query = {
              "current": 1,
              "size": 10,
              "descs": "create_time",
              "category": "2",
              "affiliationId": value.affData["id"],
            };
            break;
          case "jd":
            query = {
              "current": 1,
              "size": 10,
              "descs": "create_time",
              "category": "3",
              "affiliationId": value.affData["id"],
            };
            break;
          case "dg":
            query = {
              "current": 1,
              "size": 10,
              "descs": "create_time",
              "category": "4",
              "affiliationId": value.affData["id"],
            };
            break;
        }
        var reslut = await _iWxPageFacade.getNewsinformation(query);
        var newsData = state.newsData;
        newsData.addAll(reslut["data"]["records"]);
        // print(newsData);
        yield state.copyWith(newsData: newsData);
        // print(reslut);
      },
      goconcern: (e) async* {
        //关注
        var project = await _preferences.get("ProjectItem");
        var userInfo = await _preferences.get("UserInfo");
        Map<String, dynamic> query = {
          "id": e.maps["id"],
          "attentionType": "6",
          "userId": jsonDecode(userInfo)["id"],
          "affiliationId": jsonDecode(project)["id"]
        };
        var reslut = await _iWxPageFacade.goconcern(query);
        print(reslut);
        yield state.copyWith(isFollow: reslut["ok"]);
      },
      apartmentConcerncennel: (value) async* {
        //取消关注
        Map<String, dynamic> query = {
          "id": "",
          "attentionType": "6",
          "userId": "",
        };
        var reslut = await _iWxPageFacade.apartmentConcerncennel(query);
        print(reslut);
      },
      getApartmentConcern: (value) async* {
        //我的关注列表
        var project = await _preferences.get("ProjectItem");
        var userInfo = await _preferences.get("UserInfo");
        Map<String, dynamic> query = {
          "attentionType": "6",
          "userId": jsonDecode(userInfo)["id"],
          "affiliationId": jsonDecode(project)["id"],
        };
        var reslut = await _iWxPageFacade.getApartmentConcern(query);
        print(reslut);
      },
      getTopicreply: (value) async* {
        //我的回复
        var project = await _preferences.get("ProjectItem");
        var userInfo = await _preferences.get("UserInfo");
        Map<String, dynamic> query = {
          "current": 1,
          "size": 100,
          "replyTypes": 3, // 1 炫拍 2 点评  3户型  4 问答
          "affiliationId": jsonDecode(project)["id"],
        };
        var reslut = await _iWxPageFacade.mineGetTopicreply(query);
        print(reslut);
        yield state.copyWith(
          reply: reslut["data"]["records"],
          userInfo: jsonDecode(userInfo),
        );
      },
      commentpreviews: (e) async* {
        //回复
        var project = await _preferences.get("ProjectItem");
        var userInfo = await _preferences.get("UserInfo");
        if (userInfo == null) {
          BotToast.showText(text: "请先登陆");
          return;
        }
        Map<String, dynamic> query = {
          "replyTypes": e.type, //1 炫拍，2 点评
          "typesId": e.id, //回复某条id
          "details": e.replyValue, //回复详情
          "replyClass": jsonDecode(userInfo)["id"] == e.createid
              ? "1"
              : "0", //that.dazzleBeatData.createId==getApp().globalData.wxUser.id?'1':'0',
          "affiliationId": e.affid,
        };
        var reslut = await _iWxPageFacade.commentdazzle(query);
        print(reslut);
        if (reslut.containsKey("data")) {
          if (reslut["data"]) {
            BotToast.showText(text: "提交成功，已发后台审核");
          } else {
            BotToast.showText(text: "提交失败");
          }
          // yield state.copyWith(isComment: true);
        }
      },
      apartmentlayoutOne: (value) async* {
        Map<String, dynamic> query = {
          // "current": 1,
          // "size": 100,
          // "descs": "sort",
          "id": value.maps["id"],
          "auditStatus": 1,
          // "affiliation": "2",
          // "affiliationId": value.affData["id"],
        };

        var reslut = await _iWxPageFacade.getapartmentlayout(query);
        List apartmentlayout = reslut["data"]["records"];
        print(apartmentlayout);
        yield state.copyWith(apartmentlayoutOne: apartmentlayout);
      },
    );
  }

  tagNum(listAll) {
    // List listAll = state.apartmentlayoutAll;
    List list = [];
    // print(listAll);
    for (int i = 0; i < listAll.length; i++) {
      if (!list.contains(listAll[i]["category"])) {
        list.add(listAll[i]["category"]);
      }
    }
    // print(list);
    List listNum = [];
    Map<String, dynamic> maps = {"category": "", "num": 0, "isSelect": false};
    for (int i = 0; i < list.length; i++) {
      int num = 0;
      for (int j = 0; j < listAll.length; j++) {
        if (list[i] == listAll[j]["category"]) {
          num++;
        }
      }
      maps = {"category": list[i], "num": num, "isSelect": false};
      listNum.add(maps);
    }
    // print(listNum);
    // listTag = listNum;
    return listNum;
  }
}
