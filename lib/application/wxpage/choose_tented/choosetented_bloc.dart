import 'dart:async';
import 'dart:convert';
import 'package:flutter_ui/domain/wxpage/i_wx_page_facade.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_ui/infrastructure/utils/pac_code.dart';

part 'choosetented_event.dart';
part 'choosetented_state.dart';
part 'choosetented_bloc.freezed.dart';

@injectable
class ChoosetentedBloc extends Bloc<ChoosetentedEvent, ChoosetentedState> {
  IWxPageFacade _iWxPageFacade;
  ChoosetentedBloc(this._iWxPageFacade) : super(ChoosetentedState.initial());

  @override
  Stream<ChoosetentedState> mapEventToState(
    ChoosetentedEvent event,
  ) async* {
    yield* event.map(
      started: (value) async* {
        var pacdd = json.encode(PacCode.codeJson);
        var aaa = json.decode(pacdd);
        List pacd = [...aaa];
        var reslut = await _iWxPageFacade.getplatList();
        if (reslut["ok"]) {
          print(reslut);
          var platList = reslut["data"];
          for (var i = 0; i < platList.length; i++) {
            // platList[i]["platformProvince"] //省
            // platList[i]["platformCity"]  //市
            // platList[i]["platformCountry"]  //区
            pacd = await getname(platList[i], pacd);
            print(pacd);
          }
          for (var i = 0; i < pacd.length; i++) {
            if (!pacd[i].containsKey("listData")) {
              pacd.remove(pacd[i]);
              i--;
            }
          }
          print(pacd);
          for (var i = 0; i < pacd.length; i++) {
            for (var j = 0; j < pacd[i]["cityList"].length; j++) {
              if (!pacd[i]["cityList"][j].containsKey("listData")) {
                pacd[i]["cityList"].remove(pacd[i]["cityList"][j]);
                j--;
              }
            }
          }
          print(pacd);
          for (var i = 0; i < pacd.length; i++) {
            for (var j = 0; j < pacd[i]["cityList"].length; j++) {
              for (var z = 0;
                  z < pacd[i]["cityList"][j]["areaList"].length;
                  z++)
                if (!pacd[i]["cityList"][j]["areaList"][z]
                    .containsKey("listData")) {
                  pacd[i]["cityList"][j]["areaList"]
                      .remove(pacd[i]["cityList"][j]["areaList"][z]);
                  z--;
                }
            }
          }
          List citylist = [];
          List locationList = [];
          for (var i = 0; i < pacd.length; i++) {
            citylist.addAll(pacd[i]["cityList"]);
            locationList.addAll(pacd[i]["cityList"]);
          }
          for (var i = 0; i < citylist.length; i++) {
            citylist[i]["states"] = false;
          }
          citylist.shuffle();
          for (var i = 0; i < citylist.length; i++) {
            if (i > 5) {
              citylist.removeAt(i);
            }
          }
          print(pacd);

          yield state.copyWith(
              platList: platList,
              pacd: pacd,
              showPat: platList,
              locationList: locationList,
              hotcity: citylist);
        }
      },
      chahgeShowPlat: (value) async* {
        String type = value.type;
        Map<String, Object> item = value.value;
        var provinceIndex;
        List hotcity = state.hotcity;
        for (var i = 0; i < hotcity.length; i++) {
          hotcity[i]["states"] = false;
        }
        if (type == "A") {
          for (var i = 0; i < state.pacd.length; i++) {
            if (state.pacd[i]["code"] == item["code"]) {
              provinceIndex = i;
            }
          }
          print(state.pacd);
          yield state.copyWith(
              platformProvince: item["name"],
              showPat: item["listData"],
              provinceIndex: provinceIndex,
              cityIndex: -1,
              countryIndex: -1,
              platformCity: "选择",
              platformCountry: "选择",
              hotcity: hotcity);
        }
        if (type == "B") {
          var cityIndex;
          for (var i = 0;
              i < state.pacd[state.provinceIndex]["cityList"].length;
              i++) {
            if (state.pacd[state.provinceIndex]["cityList"][i]["code"] ==
                item["code"]) {
              cityIndex = i;
            }
          }
          yield state.copyWith(
              platformCity: item["name"],
              showPat: item["listData"],
              cityIndex: cityIndex,
              countryIndex: -1,
              platformCountry: "选择",
              hotcity: hotcity);
        }
        if (type == "C") {
          var countryIndex;
          for (var i = 0;
              i <
                  state
                      .pacd[state.provinceIndex]["cityList"][state.cityIndex]
                          ["areaList"]
                      .length;
              i++) {
            if (state.pacd[state.provinceIndex]["cityList"][state.cityIndex]
                    ["areaList"][i]["code"] ==
                item["code"]) {
              countryIndex = i;
            }
          }
          yield state.copyWith(
              platformCountry: item["name"],
              showPat: item["listData"],
              countryIndex: countryIndex,
              hotcity: hotcity);
        }
      },
      changhotcity: (value) async* {
        print(value);
        if (value.value != null) {
          List hotcity = state.hotcity;
          for (var i = 0; i < hotcity.length; i++) {
            if (hotcity[i]["code"] == value.value["code"]) {
              hotcity[i]["states"] = true;
            } else {
              hotcity[i]["states"] = false;
            }
          }
          yield state.copyWith(
            showPat: value.value["listData"],
            hotcity: hotcity,
            platformProvince: "选择",
            platformCity: "选择",
            platformCountry: "选择",
            provinceIndex: -1,
            cityIndex: -1,
            countryIndex: -1,
          );
        }
        // value.value.listData
        print(state.showPat);
      },
      resetSearch: (value) async* {
        List hotcity = state.hotcity;
        for (var i = 0; i < hotcity.length; i++) {
          hotcity[i]["states"] = false;
        }
        yield state.copyWith(
          hotcity: hotcity,
          platformProvince: "选择",
          platformCity: "选择",
          platformCountry: "选择",
          provinceIndex: -1,
          cityIndex: -1,
          countryIndex: -1,
        );
      },
    );
  }

  Future getname(obj, list) async {
    List pacd = list;

    for (var i = 0; i < pacd.length; i++) {
      var list = pacd[i]["listData"] ?? [];
      if (pacd[i]["code"] == obj["platformProvince"]) {
        list.add(obj);
        pacd[i]["listData"] = list;
      }
      for (var j = 0; j < pacd[i]["cityList"].length; j++) {
        var citylist = pacd[i]["cityList"][j]["listData"] ?? [];
        if (pacd[i]["cityList"][j]["code"] == obj["platformCity"]) {
          citylist.add(obj);
          pacd[i]["cityList"][j]["listData"] = citylist;
        }
        for (var z = 0; z < pacd[i]["cityList"][j]["areaList"].length; z++) {
          var areaList =
              pacd[i]["cityList"][j]["areaList"][z]["listData"] ?? [];
          if (pacd[i]["cityList"][j]["areaList"][z]["code"] ==
              obj["platformCountry"]) {
            areaList.add(obj);
            pacd[i]["cityList"][j]["areaList"][z]["listData"] = areaList;
          }
        }
      }
      // if(pacd[i] )
    }
    print(pacd);
    return Future.value(pacd);
  }
}
