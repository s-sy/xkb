import 'package:dartz/dartz.dart';
import 'package:flutter_ui/domain/core/failures.dart';
import 'package:flutter_ui/domain/web_scoket/web_scoket_failure.dart';
import 'package:flutter_ui/presentation/bean/consultant_bean.dart';

abstract class IProcessService {
  Future<Either<ValueFailure, List<dynamic>>> handleProcess();
  Future<Either<ValueFailure, Map<String, dynamic>>> dealWithProcess(
      String id, String taskDefinitionKey);
  Future<Either<ValueFailure, List<dynamic>>> nextRemind(
      String processInstanceId);
  Future<Either<ValueFailure, List<dynamic>>> handleByConsultant(
      ConsultantBean consultantBean);
  Future<Either<ValueFailure, List<dynamic>>> shareCode();
}
