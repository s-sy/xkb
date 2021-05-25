import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ui/domain/core/failures.dart';
import 'package:flutter_ui/domain/mine/i_mine_service.dart';
import 'package:flutter_ui/domain/process/i_process_service.dart';
import 'package:flutter_ui/domain/web_scoket/web_scoket_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'mine_event.dart';
part 'mine_state.dart';
part 'mine_bloc.freezed.dart';

@injectable
class MineBloc extends Bloc<MineEvent, MineState> {
  final IMineService _iMineService;
  final IProcessService _iProcessService;
  MineBloc(this._iMineService, this._iProcessService)
      : super(MineState.initial());

  @override
  Stream<MineState> mapEventToState(
    MineEvent event,
  ) async* {
    yield* event.map(
      handleProcess: (e) async* {
        // yield* _handleProcess(_iMineService.handleProcess());
        // _iMineService.handleProcess();
        yield state.copyWith(isAffId: true);
      },
      getErWeiCode: (e) async* {
        yield* _getErWeiCode(_iMineService.getErWeiCode());
      },
      shareCode: (e) async* {
        yield* _shareCode(_iProcessService.shareCode());
      },
      submitInfo: (e) async* {
        yield* _submitInfo(_iMineService.submitInfo(e.image, e.nickName));
      },
      testVersion: (e) async* {
        yield* _testVersion(_iMineService.testVersion(e.vInfo));
      },
    );
  }

  Stream<MineState> _handleProcess(
    Future<Either<ValueFailure, Unit>> forwardedCall,
  ) async* {
    Either<ValueFailure, Unit> failureOrSuccess;
    state.copyWith(
      processFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }

  Stream<MineState> _getErWeiCode(
    Future<Either<WebScoketFailure, String>> forwardedCall,
  ) async* {
    String getErWeiCode = "";
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        getErWeiCode = r;
      });
    });
    yield state.copyWith(
      getErWeiCode: getErWeiCode,
    );
  }

  Stream<MineState> _shareCode(
    Future<Either<ValueFailure, List<dynamic>>> forwardedCall,
  ) async* {
    List<dynamic> list = [];
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        list = r;
      });
    });
    yield state.copyWith(
      shareCode: list,
    );
  }

  Stream<MineState> _submitInfo(
    Future<Either<WebScoketFailure, String>> forwardedCall,
  ) async* {
    String submitInfo = "";
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        submitInfo = r;
      });
    });
    yield state.copyWith(
      submitInfo: submitInfo,
    );
  }

  Stream<MineState> _testVersion(
    Future<Either<WebScoketFailure, Map<String, dynamic>>> forwardedCall,
  ) async* {
    Map<String, dynamic> testVersion = {};
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        testVersion = r;
      });
    });
    yield state.copyWith(
      testVersion: testVersion,
    );
  }
}
