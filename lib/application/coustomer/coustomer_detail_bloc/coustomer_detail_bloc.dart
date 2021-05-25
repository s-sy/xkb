import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'coustomer_detail_event.dart';
part 'coustomer_detail_state.dart';
part 'coustomer_detail_bloc.freezed.dart';

@injectable
class CoustomerDetailBloc
    extends Bloc<CoustomerDetailEvent, CoustomerDetailState> {
  CoustomerDetailBloc() : super(_Initial());

  @override
  Stream<CoustomerDetailState> mapEventToState(
    CoustomerDetailEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
