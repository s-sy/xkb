import 'package:dartz/dartz.dart';
import 'package:flutter_ui/domain/core/failures.dart';
import 'package:flutter_ui/domain/process/i_process_service.dart';
import 'package:flutter_ui/infrastructure/datasources/process_remote_data_source.dart';
import 'package:flutter_ui/presentation/bean/consultant_bean.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IProcessService, env: [Environment.prod])
class ProcessService implements IProcessService {
  final ProcessRemoteDataSource processRemoteDataSource;
  ProcessService(this.processRemoteDataSource);

  @override
  Future<Either<ValueFailure, List<dynamic>>> handleProcess() async {
    var apiResult = await processRemoteDataSource.handleProcess();
    List<dynamic> list = [];
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            list = right;
          },
          failure: (error) => successAndFailure = false);
      // print(list);
      return successAndFailure
          ? right(list)
          : left(ValueFailure.empty(failedValue: "smguia"));
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(ValueFailure.empty(failedValue: "smguiaff"));
    }
  }

  @override
  Future<Either<ValueFailure, Map<String, dynamic>>> dealWithProcess(
      String id, String taskDefinitionKey) async {
    var apiResult =
        await processRemoteDataSource.dealWithProcess(id, taskDefinitionKey);
    Map<String, dynamic> mapList;
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            mapList = right;
          },
          failure: (error) => successAndFailure = false);
      return successAndFailure
          ? right(mapList)
          : left(ValueFailure.empty(failedValue: null));
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(ValueFailure.empty(failedValue: null));
    }
  }

  @override
  Future<Either<ValueFailure, List<dynamic>>> nextRemind(
      String processInstanceId) async {
    var apiResult = await processRemoteDataSource.nextRemind(processInstanceId);
    List<dynamic> list = [];
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            list = right;
          },
          failure: (error) => successAndFailure = false);
      // print(list);
      return successAndFailure
          ? right(list)
          : left(ValueFailure.empty(failedValue: null));
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(ValueFailure.empty(failedValue: null));
    }
  }

  @override
  Future<Either<ValueFailure, List<dynamic>>> handleByConsultant(
      ConsultantBean consultantBean) async {
    var apiResult =
        await processRemoteDataSource.handleByConsultant(consultantBean);
    List<dynamic> list = [];
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            list = right;
          },
          failure: (error) => successAndFailure = false);
      // print(list);
      return successAndFailure
          ? right(list)
          : left(ValueFailure.empty(failedValue: null));
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(ValueFailure.empty(failedValue: null));
    }
  }

  @override
  Future<Either<ValueFailure, List<dynamic>>> shareCode() async {
    var apiResult = await processRemoteDataSource.shareCode();
    List<dynamic> list = [];
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            list = right;
          },
          failure: (error) => successAndFailure = false);
      // print(list);
      return successAndFailure
          ? right(list)
          : left(ValueFailure.empty(failedValue: null));
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(ValueFailure.empty(failedValue: null));
    }
  }
}
