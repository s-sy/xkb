import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'autoenter_event.dart';
part 'autoenter_state.dart';
part 'autoenter_bloc.freezed.dart';

@injectable
class AutoenterBloc extends Bloc<AutoenterEvent, AutoenterState> {
  SharedPreferences _preferences;
  AutoenterBloc(this._preferences) : super(AutoenterState.initial());

  @override
  Stream<AutoenterState> mapEventToState(
    AutoenterEvent event,
  ) async* {
    yield* event.map(
      getcoumerstype: (value) async* {
        var reslut = await _preferences.get("UserType");
        var thirdSession = await _preferences.get("CACHED_SESSION_KEY");
        var vistorSession = await _preferences.get("vistor-session");
        if (reslut == "broker" && thirdSession != null) {
          yield const AutoenterState.brokerenter();
        } else if (reslut == "estate" && vistorSession != null) {
          yield const AutoenterState.estateenter();
        } else {
          yield const AutoenterState.estateenter();
        }
      },
      getType: (value) async* {
        var reslut = await _preferences.get("UserType");
        var thirdSession = await _preferences.get("CACHED_SESSION_KEY");
        var vistorSession = await _preferences.get("vistor-session");
        if (reslut == "broker" && thirdSession != null) {
          yield const AutoenterState.brokerenter();
        } else if (reslut == "estate" && vistorSession != null) {
          yield const AutoenterState.estateenter();
        } else {
          yield const AutoenterState.est();
        }
      },
      relogin: (value) async* {
        yield const AutoenterState.initial();
      },
    );
  }
}
