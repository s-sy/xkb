import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ui/domain/core/failures.dart';
import 'package:flutter_ui/domain/process/i_process_service.dart';
import 'package:flutter_ui/presentation/bean/consultant_bean.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'process_event.dart';
part 'process_state.dart';
part 'process_bloc.freezed.dart';

@injectable
class ProcessBloc extends Bloc<ProcessEvent, ProcessState> {
  final IProcessService _iProcessService;

  ProcessBloc(this._iProcessService) : super(ProcessState.initial());

  @override
  Stream<ProcessState> mapEventToState(
    ProcessEvent event,
  ) async* {
    yield* event.map(
      handleProcess: (e) async* {
        yield* _processDetails(_iProcessService.handleProcess());
      },
      dealWithProcess: (e) async* {
        yield* _dealWithProcess(
            _iProcessService.dealWithProcess(e.id, e.taskDefinitionKey));
      },
      nextRemind: (e) async* {
        yield* _nextRemind(_iProcessService.nextRemind(e.processInstanceId));
      },
      handleByConsultant: (e) async* {
        yield* _handleByConsultant(
            _iProcessService.handleByConsultant(e.consultantBean));
      },
      shareCode: (e) async* {
        yield* _shareCode(_iProcessService.shareCode());
      },
    );
  }

  Stream<ProcessState> _process(
    Future<Either<ValueFailure, Unit>> forwardedCall,
  ) async* {
    Either<ValueFailure, Unit> failureOrSuccess;
    state.copyWith(
      processFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }

  Stream<ProcessState> _processDetails(
    Future<Either<ValueFailure, List<dynamic>>> forwardedCall,
  ) async* {
    List<dynamic> list = [];
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        list = r;
      });
    });
    yield state.copyWith(
      processList: list,
    );
  }

  Stream<ProcessState> _dealWithProcess(
    Future<Either<ValueFailure, Map<String, dynamic>>> forwardedCall,
  ) async* {
    Map<String, dynamic> mapList;
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        mapList = r;
      });
    });
    yield state.copyWith(
      dealWithProcess: mapList,
    );
  }

  Stream<ProcessState> _nextRemind(
    Future<Either<ValueFailure, List<dynamic>>> forwardedCall,
  ) async* {
    List<dynamic> list = [];
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        list = r;
      });
    });
    yield state.copyWith(
      nextRemind: list,
    );
  }

  Stream<ProcessState> _handleByConsultant(
    Future<Either<ValueFailure, List<dynamic>>> forwardedCall,
  ) async* {
    List<dynamic> list = [];
    await forwardedCall.then((value) {
      value.fold((l) {}, (r) {
        list = r;
      });
    });
    yield state.copyWith(
      handleByConsultant: list,
    );
  }

  Stream<ProcessState> _shareCode(
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
}
