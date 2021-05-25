import 'dart:async';

import 'package:flutter_ui/domain/wxpage/i_wx_page_facade.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_ui/presentation/components/chat/public.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'chooseaff_event.dart';
part 'chooseaff_state.dart';
part 'chooseaff_bloc.freezed.dart';

@injectable
class ChooseaffBloc extends Bloc<ChooseaffEvent, ChooseaffState> {
  SharedPreferences _preferences;
  IWxPageFacade _iWxPageFacade;
  ChooseaffBloc(this._iWxPageFacade, this._preferences)
      : super(ChooseaffState.initial());

  @override
  Stream<ChooseaffState> mapEventToState(
    ChooseaffEvent event,
  ) async* {
    yield* event.map(
      started: (value) async* {
        Map<String, Object> item = value.data;
        print(item);
        var reslut = await _iWxPageFacade.getListbyTendentId(item["tenantId"]);
        if (reslut["ok"]) {
          _preferences.setString("tenant-session", reslut["data"]);
          print(reslut);
        }

        yield state.copyWith();
      },
      savetendent: (value) async* {
        String namekey = await _preferences.get("tenant-session");
        print(namekey);
        Map<String, Object> item = value.data;
        print(item);
        var reslut = await _iWxPageFacade.getListByTenantId(item["tenantId"]);
        print(reslut);
        if (reslut["ok"]) {
          List affList = reslut["data"]["basicInfoList"];
          affList.shuffle();
          yield state.copyWith(affList: affList);
        }
      },
    );
  }
}
