import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_ui/domain/coustomer/i_coustomer_facade.dart';
import 'package:flutter_ui/domain/house/i_house_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'house_event.dart';
part 'house_state.dart';
part 'house_bloc.freezed.dart';

@injectable
class HouseBloc extends Bloc<HouseEvent, HouseState> {
  IHouseFacade _iHouseFacade;
  final ICoustomerFacade _coustomerFacade;

  HouseBloc(this._iHouseFacade, this._coustomerFacade)
      : super(HouseState.initial());

  @override
  Stream<HouseState> mapEventToState(HouseEvent event) async* {
    yield* event.map(
      started: (e) async* {
        var res = await _iHouseFacade.getHouseq();
        print(res);
        if (res != null && res.isNotEmpty) {
          yield state.copyWith(
            buildingList: res,
            buildText: res[0], //期
            buildIndex: 0,
            houseIndex: 0,
            entranceIndex: 0,
          );
        }
      },
      getListData: (e) async* {
        if (state.buildText == "") {
          return;
        }
        var res = await _iHouseFacade.getListData(
            state.buildText, state.houseText, state.entranceText);
        print(res);
        if (res != null) {
          // res["housingList"].sort((left, right) {
          //   if (int.parse((left["floor"])) == int.parse((right["floor"]))) {
          //     return int.parse((left["serialNumber"]).substring(6))
          //         .compareTo(int.parse(right["serialNumber"].substring(6)));
          //   } else {
          //     return int.parse((right["serialNumber"]).replaceAll("-", ""))
          //         .compareTo(
          //             int.parse(left["serialNumber"].replaceAll("-", "")));
          //   }
          // });
          // double cors = double.parse((res["housingList"]
          //         [(res["housingList"].length - 1)]["serialNumber"])
          //     .substring(
          //         res["housingList"][res["housingList"].length - 1]
          //                     ["serialNumber"]
          //                 .length -
          //             1,
          //         res["housingList"][res["housingList"].length - 1]
          //                 ["serialNumber"]
          //             .length));

          yield state.copyWith(
            housList: res["buildingList"],
            entranceList: res["entranceList"],
            buildEntranceList: res["housingList"],
            // buildEntranceList: listFinal,
            // cors: cors,
          );
        }
      },
      changebuilding: (e) async* {
        yield state.copyWith(
          buildIndex: e.index,
          buildText: e.name,
          houseIndex: 0,
          entranceIndex: 0,
          houseText: "",
          entranceText: "",
        );
      },
      changeentrance: (value) async* {
        yield state.copyWith(
          entranceIndex: value.index,
          entranceText: value.name,
        );
      },
      changehouse: (value) async* {
        yield state.copyWith(
          houseIndex: value.index,
          houseText: value.name,
          entranceIndex: 0,
          entranceText: "",
        );
      },
      getSalesmanLists: (value) async* {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        String houseId = sharedPreferences.get('HOUSEID');
        if (houseId == null) {
          String affiliateds = sharedPreferences.get('AFFILIATEDS');
          if (affiliateds != null) {
            houseId = jsonDecode(affiliateds)[0]["id"];
          }
        }
        var salesmanList = await _coustomerFacade.getPersonnelList(houseId);
        yield state.copyWith(salesman: salesmanList["data"]);
        // id  realName
      },
    );
  }
}
